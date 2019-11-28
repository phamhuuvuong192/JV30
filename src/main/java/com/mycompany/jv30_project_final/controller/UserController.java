/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.AccountEntity;
import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.entities.FavoriteEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.enums.Gender;
import com.mycompany.jv30_project_final.service.CustomerInfoService;
import com.mycompany.jv30_project_final.service.EmailService;
import com.mycompany.jv30_project_final.service.FavoriteService;
import com.mycompany.jv30_project_final.service.OrderDetailService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author AnhLe
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired

    private OrderService orderService;
    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerInfoService customerInfoService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping(value = "/check_out")
    public String checkOut(Model m, HttpSession session, Authentication authentication) {
        AccountEntity acc = (AccountEntity) authentication.getPrincipal();

        m.addAttribute("acc", acc);

        m.addAttribute("genders", Gender.values());
        m.addAttribute("customerInfo", new CustomerInfoEntity());
        m.addAttribute("action", "user/submit_order");
        return "checkout";
    }

    @RequestMapping(value = "/submit_order", method = RequestMethod.POST)
    public String doneOrder(Model m, HttpSession session,
            @ModelAttribute("customerInfo") CustomerInfoEntity customerInfo, Authentication authentication)
            throws MessagingException {
        OrderEntity order = (OrderEntity) session.getAttribute("order");

        AccountEntity acc = (AccountEntity) authentication.getPrincipal();

        customerInfo.setAccount(acc);
        order.setCustomer(customerInfo);
        if (order.getOrderDetails().size() > 0 && customerInfoService.saveCustomerInfo(customerInfo) != null) {

            orderService.saveOrder(order);
            List<OrderDetailEntity> orderDetails = order.getOrderDetails();

            emailService.sendEmailByAccountId(orderDetails, customerInfo, order);

            try {
                orderService.saveOrder(order);
            } catch (Exception ex) {
                customerInfoService.deleteCustomer(customerInfo);
                orderDetailService.deleteOrderDetail(orderDetails);
            }

            if (order != null) {
                order.setStatus("Ordered");

                orderService.saveOrder(order);
                session.invalidate();
            }

        }

        return "redirect:/home?message=Order Successfull, check your Email &status=success\"";

    }

    @RequestMapping(value = "/add-favorite", method = RequestMethod.GET)

    public String AddFavorite(Model model, @RequestParam("productId") int productId) {
        AccountEntity account = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        FavoriteEntity newFavorite = new FavoriteEntity();

        newFavorite.setProduct(productService.findProductById(productId));
        newFavorite.setAccount(account);
        ProductEntity product1 = productService.findProductById(productId);
        List<FavoriteEntity> allfav = favoriteService.findAllFavorite();
        boolean isExist = false;

        for (FavoriteEntity fav1 : allfav) {
            if (fav1.getProduct().getId() == productId) {
                isExist = true;
                break;
            }
        }
        List<ProductEntity> products = new ArrayList<>();
        if (isExist == false) {
            favoriteService.addFavorite(newFavorite);
        }
        List<FavoriteEntity> fe = favoriteService.findByAccountId(account.getId());

        for (FavoriteEntity f : fe) {

            products.add(f.getProduct());
        }
        model.addAttribute("products", products);

        return "wishlist";

    }

    @RequestMapping(value = "/wishlist")
    public String WishList(Model m) {
        AccountEntity account = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
         List<ProductEntity> products = new ArrayList<>();
        List<FavoriteEntity> fe = favoriteService.findByAccountId(account.getId());
        for (FavoriteEntity f : fe) {

            products.add(f.getProduct());
        }
        m.addAttribute("products", products);

        return "wishlist";
    }

}
