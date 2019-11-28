    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;


import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
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
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer>{
    
    
//    
//    @Query ("Select o from OrderDetailEntity o where o.order.id = ?1 ") 
//    public List<OrderDetailEntity> findOrderDetailByOrderId (int id) ;
//    
     @Query(value = "select * from orderdetail where order_id = ?1 ", nativeQuery = true)
     public List<OrderDetailEntity> findOrderDetailByOrderId(int orderId) ;
    

     public List<OrderDetailEntity> findByOrder (OrderEntity order) ;
}
