package com.example.spider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Role;




@Repository
public interface RoleRepository extends  CrudRepository<Role,Long> {

}
