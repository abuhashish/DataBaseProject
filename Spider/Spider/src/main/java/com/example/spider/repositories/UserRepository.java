package com.example.spider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Role;
import com.example.spider.models.User;



@Repository
public interface UserRepository extends  CrudRepository<User,Long> {
	User findByEmail(String email);
	// select * from users u join roles r where u.roleid=r.id and role.role = "somthing"
	List <User> findByRole(Role role);
}
