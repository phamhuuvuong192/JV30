
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.AccountEntity;
import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.enums.Gender;
import com.mycompany.jv30_project_final.service.CustomerInfoService;
import com.mycompany.jv30_project_final.service.OrderService;
import com.mycompany.jv30_project_final.service.ProductCategoryService;
import com.mycompany.jv30_project_final.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author NHU QUYNH
 */
@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductCategoryService productCategoryService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CustomerInfoService customerInfoService;

    @RequestMapping("/findProductByCategory/{categoryId}")
    public String findProductByCategory(Model model,
            @PathVariable("categoryId") int categoryId) {
        model.addAttribute("products", productService.findProductByProductCategoryId(categoryId));
        return "category";
    }

    @ModelAttribute("category")
    public List<ProductCategory> getCategory() {
        return productCategoryService.getCategory();
    }

    @RequestMapping(value = "/delete_dt/{productId}")
    public String deleteProduct(Model model, @PathVariable("productId") int productId, HttpSession session) {
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        ProductEntity product = productService.findProductById(productId);
        if (order != null) {
            float totalPrice = order.getTotalPrice();

            for (OrderDetailEntity orderDetail : order.getOrderDetails()) {
                if (orderDetail.getProduct().getId() == productId) {
                    order.getOrderDetails().remove(orderDetail);
                    order.setTotalPrice(totalPrice - (product.getPrice() * orderDetail.getQuantity()));
                    break;
                }
            }
            session.setAttribute("order", order);
            model.addAttribute("order", order);
        }

        return "redirect:/shopping_cart";
    }

    @RequestMapping(value = "/shopping_cart")
    public String shoppingCart(Model m) {
        return "order";
    }
}
