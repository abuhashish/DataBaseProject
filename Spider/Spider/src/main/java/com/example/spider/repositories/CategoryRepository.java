package com.example.spider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Category;
import com.example.spider.models.Product;

@Repository
public interface CategoryRepository  extends  CrudRepository<Category,Long> {
	//select * from category
	List <Category> findAll();
}