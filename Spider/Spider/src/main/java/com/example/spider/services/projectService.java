package com.example.spider.services;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.example.spider.models.Category;
import com.example.spider.models.Order;
import com.example.spider.models.Product;
import com.example.spider.models.Role;
import com.example.spider.models.Status;
import com.example.spider.models.Supplier;
import com.example.spider.models.User;
import com.example.spider.repositories.CategoryRepository;
import com.example.spider.repositories.OrderRepository;
import com.example.spider.repositories.ProductRepository;
import com.example.spider.repositories.RoleRepository;
import com.example.spider.repositories.StatusRepository;
import com.example.spider.repositories.SupplierRepository;
import com.example.spider.repositories.UserRepository;

@Service
public class projectService {
private final UserRepository UR;
private static ProductRepository PR;
private static CategoryRepository CR;
private static RoleRepository RR;
private static OrderRepository OR;
private static StatusRepository SR;
private static SupplierRepository SuR;
public projectService(SupplierRepository sur,UserRepository uR, ProductRepository pR,CategoryRepository cr ,RoleRepository rr ,OrderRepository or,StatusRepository sr) {
	UR = uR;
	PR = pR;
	CR = cr;
	RR =rr;
	OR=or;
	SR=sr;
	SuR=sur;
}
// select * from Products
public List<Product> allproducts(){
	return  PR.findAll();
	
}

// select * from product where category_id = ?
public List<Product> productcat(long id){
	return PR.getProductCat(id);
}
// select * from Order
public List<Order> allorders(){
	return  OR.findAll();
	
}
//select * from Category
public static List<Category> allcats(){
	return  CR.findAll();
	
}
// select * from Supplier
public static List<Supplier> allsupps(){
	return  SuR.findAll();
	
}
// select * from Order where order_id = ?
public Order findOrderById(Long id) {
	Optional<Order> u = OR.findById(id);
	
	if(u.isPresent()) {
        return u.get();
	} else {
	    return null;
	}
}
// delete * from Product where Product.id = ?
public void deleteprod(Long id) {
	PR.deleteById(id);
	
}
// insert into products values()
public void createprod(Product prod) {
	PR.save(prod);
}
// insert into Supplier values()
public void addsupplier(Supplier sup) {
	SuR.save(sup);
}
public void createooder(Order order) {
	OR.save(order);
}
public void createcategory(Category cat) {
	CR.save(cat);
}
public void updateprod(@Valid Product prod) {
	PR.save(prod);
}

public static Product findProductById(Long id) {
	Optional<Product> u = PR.findById(id);
	
	if(u.isPresent()) {
        return u.get();
	} else {
	    return null;
	}
}
public User registerUser(@Valid User user) {
	  String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
      user.setPassword(hashed);
      user.setRole(roleById(2));
      return UR.save(user);
}
public User findByEmail(String email) {
	return UR.findByEmail(email);
}
// authenticate user
public boolean authenticateUser(String email, String password) {
    // first find the user by email
    User user = UR.findByEmail(email);
    // if we can't find it by email, return false
    if(user == null) {
        return false;
    } else {
        // if the passwords match, return true, else, return false
        if(BCrypt.checkpw(password, user.getPassword())) {
            return true;
        } else {
            return false;
        }
    }
}
public Role roleById(long id) {
	return RR.findById(id).get();
}
public Status statusById(long id) {
	return SR.findById(id).get();
}
public User findUserById(Long id) {
	Optional<User> u = UR.findById(id);
	
	if(u.isPresent()) {
        return u.get();
	} else {
	    return null;
	}
}
public List<Order> deliveredOrders(){
	return OR.getDeliveredOrders();
}
public List<Order> DorderByDate(Date  start,Date  end){
	System.out.println(start);
	System.out.println(end);
	
	return OR.findByUpdatedAtBetween(start,end);
}
public Product searchprod(String name) {
	Product u = PR.findByProductName(name);
	System.out.println(u);
	return u;
	
	
}
public List<Product> top8sellers(){
	return PR.top8sellers();
}

}
