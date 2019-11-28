/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.OrderEntity;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer>{
    
	@Query (value = "select * from product_order where customer_info_id = ?1" , nativeQuery = true)
	public OrderEntity findOrderByCusInfo (int cusId) ;
}
