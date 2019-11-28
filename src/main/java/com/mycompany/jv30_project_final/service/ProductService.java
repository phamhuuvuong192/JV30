
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.repositories.ImageRepository;
import com.mycompany.jv30_project_final.repositories.ProductRepository;
import com.mycompany.jv30_project_final.repositories.PromotionRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author Admin
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private PromotionRepository promotionRepository;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private ProductCategoryService categoryService;

    public ProductEntity findProductById(int productId) {
        ProductEntity product = productRepository.findOne(productId);
        product.setImages(imageRepository.findByProduct(product));
        return product;
    }

    public List<ProductEntity> getProducts() {
        Page<ProductEntity> pageProducts = productRepository.findAll(new PageRequest(0, 6));
        List<ProductEntity> products = pageProducts.getContent();
        if (products != null && products.size() > 0) {
            for (ProductEntity i : products) {
                i.setImages(imageRepository.findByProduct(i));
                i.setTotalProduct(pageProducts.getTotalPages());
            }
        }
        return products;
    }

    public List<ProductEntity> getProducts(int page) {
        Page<ProductEntity> pageProducts = productRepository.findAll(new PageRequest(page, 6));
        List<ProductEntity> products = pageProducts.getContent();
        if (products != null && products.size() > 0) {
            for (ProductEntity i : products) {
                i.setImages(imageRepository.findByProduct(i));
                i.setTotalProduct(pageProducts.getTotalPages());
            }
        }
        return products;
    }

    public List<ProductEntity> searchProduct(String searchTxt) {
        List<ProductEntity> list = productRepository.findProductByName("%" + searchTxt + "%");
        for (ProductEntity i : list) {

            i.setImages(imageRepository.findByProduct(i));
        }
        return list;
    }

    public List<ProductEntity> findProductByProductCategoryId(int id) {
        ProductCategory category = categoryService.findCategoryById(id);
        List<ProductEntity> list = (List<ProductEntity>) productRepository.findByCategory(category);
        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        } else {
            for (ProductEntity i : list) {
                i.setImages(imageRepository.findByProduct(i));
            }
            return list;
        }
    }
    
    public float setPriceProduct(ProductEntity pe) {
        float price = pe.getPrice();
        PromotionEntity pre = promotionService.findPromotionByProductIdAndCurrentDate(pe.getId());
        if (pre.getId() > 0) {
            price = price - ((price * pre.getDiscount()) / 100);
        }

        return price;
    }

}
