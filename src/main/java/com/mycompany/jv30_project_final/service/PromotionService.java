/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.PromotionEntity;
import com.mycompany.jv30_project_final.repositories.PromotionRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class PromotionService  {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public PromotionEntity findPromotionByProductIdAndCurrentDate(int productId) {
    	List<PromotionEntity> promotions = promotionRepository.findPromotionByProductIdAndCurrentDate(new Date(), productId);
    	if(promotions!=null && promotions.size()>0) {
    		return promotions.get(0);
    	}else {
    		return new PromotionEntity();
    	}
    }
    

}
