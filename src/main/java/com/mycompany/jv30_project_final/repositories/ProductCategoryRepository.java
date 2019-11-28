/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;

import com.mycompany.jv30_project_final.entities.ProductCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NHU QUYNH
 */
@Repository
public interface ProductCategoryRepository  extends CrudRepository<ProductCategory, Integer> {
    
}
