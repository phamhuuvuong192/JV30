/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;

import com.mycompany.jv30_project_final.entities.ProductEntity;
import com.mycompany.jv30_project_final.entities.PromotionEntity;
import java.util.Date;
import java.util.List;
import org.hibernate.query.NativeQuery;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface PromotionRepository extends CrudRepository<PromotionEntity, Integer> {

	@Query(value = "SELECT p.* FROM product p inner join product_promotion_relationsh   ip ppr on p.id = ppr.product_id where ppr.product_id =  ?1 ", nativeQuery = true)
	public List<ProductEntity> findProductPromotionByProductId(int productId);

	@Query(value = " select pn.* from  product p inner join product_promotion_relationship ppr on  p.id = ppr.product_id "
			+ "inner join promotion pn  on ppr.promotion_id= pn.id where pn.startDate <= '2019-08-17'    "
			+ "and pn.endDate >= '2019-08-17'   ", nativeQuery = true)
	public PromotionEntity findPromotionByDate(Date date, Date date1);

	@Query(value = "select * from promotion p where p.endDate >= '2019-08-18' and p.startDate <='2019-08-18' ", nativeQuery = true)
	public List<PromotionEntity> findPromotionByDate();


	@Query(value = "select * from promotion where id = ?1 ", nativeQuery = true)
	public PromotionEntity findPromotionById(int id);

	@Query(value = "select distinct * from promotion p inner join product_promotion_relationship ppr on ppr.promotion_id = p.id inner join product pt on ppr.product_id = pt.id where pt.id = ?1 ", nativeQuery = true)
	public List<PromotionEntity> findPromotionByProductId(int id);

	@Query("SELECT pr FROM PromotionEntity pr JOIN FETCH pr.products p WHERE pr.startDate <= ?1 and pr.endDate >= ?1 and p.id = ?2"
			+ " Order by pr.startDate DESC")
	public List<PromotionEntity> findPromotionByProductIdAndCurrentDate(Date currentDate, int productId);

}
