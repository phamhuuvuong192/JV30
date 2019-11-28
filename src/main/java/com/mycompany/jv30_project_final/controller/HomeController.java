/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.controller;

import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.entities.ProducerEntity;
import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.service.ProducerService;
import com.mycompany.jv30_project_final.service.ProductCategoryService;
import com.mycompany.jv30_project_final.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author AnhLe
 */
@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProducerService producerService;

    @Autowired
    private ProductCategoryService productCategoryService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String home(Model model, @RequestParam(value = "message", required = false) String message,
            @RequestParam(value = "status", required = false) String status) {
        List<ProductEntity> products = productService.getProducts();

        model.addAttribute("products", products);

        model.addAttribute("message", message);
        model.addAttribute("status", status);
        return "home";
    }

    @RequestMapping("/view-detail/{productId}")
    public String viewFormUpdate(Model model, @PathVariable("productId") int productId, HttpSession session) {

        ProductEntity p = productService.findProductById(productId);
        model.addAttribute("product", p);

        return "viewdetail";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchProductByCategory(Model model, @ModelAttribute("searchTxt") String searchTxt) {
        List<ProductEntity> products = productService.searchProduct(searchTxt);
        model.addAttribute("products", products);

        List<ProductEntity> list = productService.searchProduct(searchTxt);
        model.addAttribute("product_found", list.size());
        return "category";
    }

    @ModelAttribute("producers")
    public List<ProducerEntity> getProducer() {
        return producerService.getProducers();
    }

    @ModelAttribute("category")
    public List<ProductCategory> getCategory() {
        return productCategoryService.getCategory();
    }

}
