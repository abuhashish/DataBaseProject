package com.example.spider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Category;
import com.example.spider.models.Supplier;

@Repository
public interface SupplierRepository  extends  CrudRepository<Supplier,Long> {
	// select * from supplier
	List <Supplier> findAll();
}