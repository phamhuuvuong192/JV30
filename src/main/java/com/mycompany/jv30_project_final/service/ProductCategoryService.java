/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.repositories.ProductCategoryRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NHU QUYNH
 */
@Service
public class ProductCategoryService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    public List<ProductCategory> getCategory() {
        return (List<ProductCategory>) productCategoryRepository.findAll();
    }

    public ProductCategory findCategoryById(int categoryId) {
        ProductCategory category = productCategoryRepository.findOne(categoryId);
        if (category == null) {
            return new ProductCategory();
        }
        return category;
    }
}
