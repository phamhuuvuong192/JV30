/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.repositories;

import com.mycompany.jv30_project_final.entities.ProductCategory;
import com.mycompany.jv30_project_final.entities.ProductEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {

    @Query("select p from ProductEntity p where p.name  like ?1 ")
    public List<ProductEntity> findProductByName(String name);

//       @Query("Select p From product p "
//               + "join productcategory pc on pc.id = p.category_id "
//            + "Where pc.name =?1 " )
//    public List<ProductEntity> findProductByCategory(String name);
    public ProductEntity findById(int id);

    @Query("Select p From ProductEntity p " + "Where p.producer.id = ?1 ")
    public List<ProductEntity> findProductByProducerId(int id);

    Page<ProductEntity> findAll(Pageable pageable);

    @Query("select p from ProductEntity p order by p.price")
    public List<ProductEntity> sortProductByPrice();

    @Query(value = " select distinct * from  product p inner join product_promotion_relationship ppr on  p.id = ppr.product_id"
            + "   inner join promotion pn  on ppr.promotion_id  = pn.id where pn.startDate <=  '2019-08-17' and pn.endDate >= '2019-08-17'", nativeQuery = true)
    public List<ProductEntity> findProductByDate();

    @Query("Select pe From  ProductEntity pe " + "Join fetch pe.promotions "
    )
    public List<ProductEntity> findProductByDate1();

    @Query(value = "select distinct * from product pt inner join product_promotion_relationship ppr on ppr.product_id = pt.id inner join promotion p on ppr.promotion_id = p.id where p.id = ?1", nativeQuery = true)
    public List<ProductEntity> findProductByPromotionId(int id);

    public List<ProductEntity> findByCategory(ProductCategory category);

}
