package com.example.spider.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Product;
import com.example.spider.models.User;

@Repository
public interface ProductRepository  extends  CrudRepository<Product,Long> {
	List <Product> findAll();
	 @Query(value="SELECT * FROM spider.products x WHERE x.category_id = ?1", nativeQuery=true)
	 List<Product> getProductCat(Long id);
	 @Query(value="SELECT * FROM spider.products order by sold desc limit 8;", nativeQuery=true)
	 List<Product> top8sellers();
	 //select * from products x where product.name = "somthing"
	 Product findByProductName(String name);
}
