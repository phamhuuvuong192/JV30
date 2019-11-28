/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.AccountEntity;
import com.mycompany.jv30_project_final.entities.FavoriteEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.repositories.FavoriteRepository;
import com.mycompany.jv30_project_final.repositories.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NHU QUYNH
 */

@Service
public class FavoriteService {
    
    @Autowired
    private FavoriteRepository favoriteRepository;
    
    @Autowired
    private ImageRepository imageRepository;
    
    public int favoriteTotalbyProducId(int id){
        return favoriteRepository.findCountFavoriteByProductId(id);
    }
    
    public void addFavorite(FavoriteEntity favorite){
        favoriteRepository.save(favorite);
    }
    
    public List<FavoriteEntity> getListFavoriteByProduct(ProductEntity product){
        return favoriteRepository.findByProduct(product);
    }
    
    public List<FavoriteEntity> findAllFavorite(){
        return (List<FavoriteEntity>) favoriteRepository.findAll();
    }
    
    public boolean checkIsFavorite (ProductEntity product, AccountEntity account){
        if(favoriteRepository.findByProductAndAccount(product, account) == null){
            return false;
        }else{
            return true;
        }
    }
    
    public List<FavoriteEntity> findByAccountId(int accountId){
        List<FavoriteEntity> fa = favoriteRepository.findByAccountId(accountId);
        for(FavoriteEntity i: fa){
            i.getProduct().setImages(imageRepository.findByProduct(i.getProduct()));
        }
        return fa;
    }
}
