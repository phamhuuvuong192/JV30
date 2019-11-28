/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.ImageEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.repositories.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NHU QUYNH
 */
@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public List<ImageEntity> findImageByProduct(ProductEntity product) {
        return imageRepository.findByProduct(product);
    }
    
    public List<ImageEntity> findImageByProductId (ProductEntity product) {
        List<ImageEntity> images = imageRepository.findByProduct(product) ;
        return images;
    }
}
