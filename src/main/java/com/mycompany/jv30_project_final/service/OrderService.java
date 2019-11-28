/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.repositories.CustomerRepository;
import com.mycompany.jv30_project_final.repositories.OrderDetailRepository;
import com.mycompany.jv30_project_final.repositories.OrderRepository;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
        
        @Autowired
        private CustomerRepository customerRepository;

	@Autowired
	private OrderDetailRepository orderDetailRepository;

//    public OrderEntity saveOrder (OrderEntity orderEntity) {
//        return orderRepository.save(orderEntity) ;
//    }
	@Transactional(rollbackFor = Exception.class)
        
//        public void saveOrder(OrderEntity order){
//            orderRepository.save(order);
//        }
	public OrderEntity saveOrder(OrderEntity order) {

		try {
			CustomerInfoEntity cus = order.getCustomer();
                        cus = customerRepository.save(cus);

		

				
                                    //Save Order
                                    order.setCustomer(cus);
                                    order = orderRepository.save(order);
                                    //save Order Detail
					for (OrderDetailEntity orderItem : order.getOrderDetails()) {
						orderItem.setOrder(order);
						orderItem = orderDetailRepository.save(orderItem);
					}
                                        order.setOrderDetails(order.getOrderDetails());
			
		} catch (Exception ex) {

		}
		return orderRepository.save(order);
	}

	public OrderEntity findOrderByCusInfo(CustomerInfoEntity cus) {

		OrderEntity orders = orderRepository.findOrderByCusInfo(cus.getId());
		return orders;

	}

	public OrderEntity findOrderById(int id) {
		OrderEntity order = orderRepository.findOne(id);
		if (order != null) {
			order.setOrderDetails(orderDetailRepository.findByOrder(order));

		}
		return order;
	}

	public void deleteOrder (OrderEntity orderEntity) {
		orderRepository.delete(orderEntity.getId());
		
	}

}
