package com.example.spider.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name = "Orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_products_orders", 
        joinColumns = @JoinColumn(name = "order_id"), 
        inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Product> orderProducts;
	  @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User user;
	 private long total;
	 @ManyToOne(fetch = FetchType.LAZY)
     @JoinColumn(name="status_id")
     private Status status;
	 @Column(updatable=false)
     private Date createdAt;
     private Date updatedAt;
		@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	    @PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }
	    
	public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
	public Status getStatus() {
			return status;
		}
		public void setStatus(Status status) {
			this.status = status;
		}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<Product> getOrderProducts() {
		return orderProducts;
	}
	public void setOrderProducts(List<Product> orderProducts) {
		this.orderProducts = orderProducts;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Order() {
		super();
	}
	  
}