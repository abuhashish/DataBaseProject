package com.example.spider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Category;
import com.example.spider.models.Product;
import com.example.spider.models.Status;

@Repository
public interface StatusRepository  extends  CrudRepository<Status,Long> {
}