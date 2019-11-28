/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;


import com.mycompany.jv30_project_final.entities.AccountEntity;
import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.repositories.CustomerRepository;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Service
public class CustomerInfoService {
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private OrderService orderService ;

	@Transactional(rollbackFor = Exception.class)
	public CustomerInfoEntity saveCustomerInfo(CustomerInfoEntity customerInfoEntity) {
		return customerRepository.save(customerInfoEntity);
	}

	public List<CustomerInfoEntity> findCusByAcc(AccountEntity acc) {
		return customerRepository.findCusInfoByAccId(acc.getId());

	}

	public void deleteCustomer(CustomerInfoEntity customer) {
		customerRepository.delete(customer);
	}
	
//	public CustomerInfoEntity findCusByOrder (OrderEntity orderEntity) {
//		
//		
//	}
	
	public CustomerInfoEntity findCusById (int id) {
		return customerRepository.findOne(id) ;
	}

}
