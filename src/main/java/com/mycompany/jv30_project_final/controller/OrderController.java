package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.entities.ImageEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.enums.Gender;
import com.mycompany.jv30_project_final.service.CustomerInfoService;
import com.mycompany.jv30_project_final.service.EmailService;
import com.mycompany.jv30_project_final.service.ImageService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.ProductCategoryService;
import com.mycompany.jv30_project_final.service.ProductService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerInfoService customerInfoService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ProductCategoryService productCategoryService;

    @RequestMapping(value = "/order_product", method = RequestMethod.GET)
    public String orderProduct(Model m, @RequestParam("id") Integer id, @RequestParam("quantity") int quantity, HttpSession session) {

        ProductEntity pe = productService.findProductById(id);
        pe.setPrice(productService.setPriceProduct(pe));

        if (pe != null) {
            float totalPrice = 0;
            OrderEntity order = (OrderEntity) session.getAttribute("order");
            if (order != null) {
                List<OrderDetailEntity> orderDetails = order.getOrderDetails();

                int flagNotEqual = 1;
                for (int i = 0; i < orderDetails.size(); i++) {

                    if (orderDetails.get(i).getProduct().getId() == id) {
                        int temp = orderDetails.get(i).getQuantity();
                        orderDetails.get(i).setQuantity(temp + quantity);
                        orderDetails.get(i).setPrice(orderDetails.get(i).getQuantity() * orderDetails.get(i).getProduct().getPrice());

                        flagNotEqual = 0;
                    }

                }
                if (flagNotEqual == 1) {
                    OrderDetailEntity addOrderDetail = new OrderDetailEntity();
                    addOrderDetail.setName(pe.getName());
                    addOrderDetail.setPrice(Math.ceil((double) (pe.getPrice() * 1000) / 1000));
                    addOrderDetail.setQuantity(quantity);
                    addOrderDetail.setOrder(order);
                    addOrderDetail.setProduct(pe);
                    addOrderDetail.setPrice(addOrderDetail.getQuantity() * addOrderDetail.getProduct().getPrice());

                    orderDetails.add(addOrderDetail);

                    order.setTotalPrice(Math.ceil((double) (totalPrice * 1000) / 1000));
                    order.setOrderDetails(orderDetails);

                }

                for (int j = 0; j < orderDetails.size(); j++) {

                    totalPrice = totalPrice + (orderDetails.get(j).getQuantity()) * (orderDetails.get(j).getProduct().getPrice());
                }
                order.setTotalPrice(totalPrice);

                session.setAttribute("order", order);
            } else {
                order = new OrderEntity();
                order.setDate(new Date());
                order.setStatus("Waiting");

                List<OrderDetailEntity> orderDetails = new ArrayList<>();
                OrderDetailEntity detail = new OrderDetailEntity();
                List<ImageEntity> list = imageService.findImageByProductId(pe);
                pe.setImages(list);

                detail.setName(pe.getName());
                detail.setOrder(order);
                detail.setPrice(Math.ceil((double) (pe.getPrice() * 1000) / 1000));
                detail.setProduct(pe);
                detail.setQuantity(quantity);
                detail.setPrice(detail.getQuantity() * detail.getProduct().getPrice());

                detail.setOrder(order);

                orderDetails.add(detail);

                order.setOrderDetails(orderDetails);
                order.setTotalPrice(detail.getPrice());

                session.setAttribute("order", order);

            }
        }
        return "redirect:/shopping_cart";
    }

    @RequestMapping(value = "/submit_order", method = RequestMethod.POST)
    public String doneOrder(Model m, HttpSession session,
            @Valid @ModelAttribute("customerInfo") CustomerInfoEntity customerInfo, BindingResult result)
            throws MessagingException {

        OrderEntity order = (OrderEntity) session.getAttribute("order");
        if (result.hasErrors()) {
            m.addAttribute("customerInfo", customerInfo);
            m.addAttribute("genders", Gender.values());
            return "checkout";

        }

        order.setCustomer(customerInfo);
        orderService.saveOrder(order);

        List<OrderDetailEntity> orderDetails = order.getOrderDetails();

        try {
            orderService.saveOrder(order);
            emailService.sendEmailByAccountId(orderDetails, customerInfo, order);
        } catch (Exception ex) {
            customerInfoService.deleteCustomer(customerInfo);
            orderDetailService.deleteOrderDetail(orderDetails);
        }

        if (order != null) {
            order.setStatus("Ordered");

            orderService.saveOrder(order);
            session.invalidate();
        }

        return "redirect:/home?message=Order Successfull, check your Email &status=success\"";

    }

    @ModelAttribute("category")
    public List<ProductCategory> getCategory() {
        return productCategoryService.getCategory();
    }

    @RequestMapping(value = "/check_out")
    public String checkOut(Model m, HttpSession session, Authentication authentication) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");

        m.addAttribute("genders", Gender.values());
        m.addAttribute("customerInfo", new CustomerInfoEntity());
        m.addAttribute("action", "submit_order");
        return "checkout";
    }

    @RequestMapping("/continue")
    public String continueOrder(Model model) {

        return "redirect:/home";
    }

    @RequestMapping(value = "/update-quantity")
    public String updateQuantity(Model model, @RequestParam(name = "quantity") int quantity, @RequestParam(name = "productId") int productId,
            HttpSession session) {

        OrderEntity order = (OrderEntity) session.getAttribute("order");
        List<OrderDetailEntity> orderDetails = order.getOrderDetails();
        ProductEntity product = productService.findProductById(productId);
        if (order != null) {
            for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                if (orderDetail.getProduct().getId() == productId) {
                    orderDetail.setQuantity(quantity);
                    orderDetail.setPrice(orderDetail.getQuantity() * orderDetail.getProduct().getPrice());
                    if (orderDetail.getQuantity() == 0 || orderDetail.getQuantity() < 0) {
                        return "redirect:/delete_dt/" + orderDetail.getProduct().getId();
                    }
                }
                float totalPrice = 0;
                for (int i = 0; i < orderDetails.size(); i++) {

                    totalPrice += (orderDetails.get(i).getQuantity()) * (orderDetails.get(i).getProduct().getPrice());
                }
                order.setTotalPrice(totalPrice);
            }
        }

        return "redirect:/shopping_cart";
    }

}
