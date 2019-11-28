/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import com.mycompany.jv30_project_final.repositories.OrderDetailRepository;
import com.mycompany.jv30_project_final.repositories.ProductRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class OrderDetailService {
	private OrderDetailRepository orderDetailRepository;

	private ProductRepository productRepository;

	public List<OrderDetailEntity> findOrderDetailByOrderId(int id) {
		return (List<OrderDetailEntity>) orderDetailRepository.findOrderDetailByOrderId(id);
	}

	public OrderDetailEntity saveOrderDetail(OrderDetailEntity orderDetail) {
		return orderDetailRepository.save(orderDetail);

	}

	public void deleteOrderDetail(List<OrderDetailEntity> orderDetails) {
		for (OrderDetailEntity o : orderDetails) {
			orderDetailRepository.delete(o);
		}
	}

	public List<OrderDetailEntity> findOrderDetailByOrder(OrderEntity order) {
		return  orderDetailRepository.findByOrder(order);

	}

}
