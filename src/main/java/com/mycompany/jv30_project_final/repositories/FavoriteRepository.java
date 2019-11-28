/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;

import com.mycompany.jv30_project_final.entities.AccountEntity;
import com.mycompany.jv30_project_final.entities.FavoriteEntity;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NHU QUYNH
 */
@Repository
public interface FavoriteRepository extends CrudRepository<FavoriteEntity, Integer>{
    @Query(value = "select count(f.id) from favorite f where product_id = ?1", nativeQuery = true)
    int findCountFavoriteByProductId(int productId);
    List<FavoriteEntity> findByProduct (ProductEntity product);
    
    FavoriteEntity findByProductAndAccount (ProductEntity product, AccountEntity account);
    
    @Query(value = "select f from FavoriteEntity f where f.account.id = ?1")
    public List<FavoriteEntity> findByAccountId(int id);
}
