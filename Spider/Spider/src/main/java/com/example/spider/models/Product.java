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

import org.springframework.format.annotation.DateTimeFormat;

import com.sun.istack.NotNull;
@Entity
@Table(name = "Products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	private String productName;
	@NotNull
	private String description;
	@NotNull
	private Double price;
	@NotNull
	private Double orginial_price;
	@NotNull
	private Integer qty;
	@NotNull
	private Integer sale;
	@NotNull
	private Integer sold=0;
	private String image;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="category_id")
    private Category cat;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="supplier_id")
    private Supplier supplier;
	 @Transient
	    public String getPhotosImagePath() {
        	return "/user-photos/" + 4 + "/" + image;
	        
	    }
	      
	   
	 public Integer getSold() {
		return sold;
	}

	public void setSold(Integer sold) {
		this.sold = sold;
	}

	@Transient
	 public Long priceaftersale() {
		 return (long) (price-(price*sale/100));
	 }
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User owner;
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "users_products_orders", 
        joinColumns = @JoinColumn(name = "product_id"), 
        inverseJoinColumns = @JoinColumn(name = "order_id")
    )
    private List<Order> ordersProduct;



	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}



	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
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

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Category getCat() {
		return cat;
	}

	public void setCat(Category cat) {
		this.cat = cat;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public List<Order> getOrdersProduct() {
		return ordersProduct;
	}

	public void setOrdersProduct(List<Order> ordersProduct) {
		this.ordersProduct = ordersProduct;
	}

	public Double getOrginial_price() {
		return orginial_price;
	}

	public void setOrginial_price(Double orginial_price) {
		this.orginial_price = orginial_price;
	}

	public Integer getSale() {
		return sale;
	}

	public void setSale(Integer sale) {
		this.sale = sale;
	}

	

	
}
