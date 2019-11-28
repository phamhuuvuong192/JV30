/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface  CustomerRepository  extends CrudRepository<CustomerInfoEntity, Integer> {
	  @Query (value = "SELECT * from customerinfo where account_id = ?1" ,nativeQuery = true )
      List<CustomerInfoEntity> findCusInfoByAccId (int accId) ;
	  
//	  @Query (value = "")
}
