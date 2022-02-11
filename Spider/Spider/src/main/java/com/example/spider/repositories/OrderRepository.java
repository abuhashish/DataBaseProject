package com.example.spider.repositories;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.spider.models.Order;





@Repository
public interface OrderRepository extends  CrudRepository<Order,Long> {
	List <Order> findAll();
	 @Query(value="SELECT * FROM spider.orders x WHERE x.status_id = 3", nativeQuery=true)
	 List<Order> getDeliveredOrders();
	 //SELECT * FROM spider.orders x WHERE x.updated_at between '2020-01-01' and '2022-01-01' as native sql
	 List<Order> findByUpdatedAtBetween(Date  start, Date  end);
}
