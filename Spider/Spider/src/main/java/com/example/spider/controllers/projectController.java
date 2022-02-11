package com.example.spider.controllers;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.spider.models.Category;
import com.example.spider.models.Order;
import com.example.spider.models.Product;
import com.example.spider.models.Status;
import com.example.spider.models.Supplier;
import com.example.spider.models.User;
import com.example.spider.services.projectService;




@Controller
public class projectController {
	private final projectService ps;
		
		public projectController(projectService ps) {
			this.ps = ps;
		}
	@RequestMapping("/")
		 public String index(Model model) {
				List<Product> top6 = ps.top8sellers();
				model.addAttribute("top6",top6);
				return "home.jsp";
		 }
	@RequestMapping("/login")
	 public String login(@ModelAttribute("user") User user) {
			return "login.jsp";
	 }
	@RequestMapping("/shop")
	 public String shop(Model model) {
			List <Product> prods=ps.allproducts();
			List <Category> x=projectService.allcats();
	    	model.addAttribute("x",x);
			model.addAttribute("prods",prods);
			return "product-grid.jsp";
	 }
	@RequestMapping("/shop/{id}")
	 public String grid(@PathVariable("id") Long id,Model model) {
			List<Product> prods=ps.productcat(id);
			List <Category> x=projectService.allcats();
	    	model.addAttribute("x",x);
			model.addAttribute("prods",prods);
			return "gridcat.jsp";
	 }
	@RequestMapping("/single-product/{id}")
	 public String shopz(Model model,@PathVariable("id") Long id,HttpSession session) {
	    	model.addAttribute("x",ps.findProductById(id));
			return "product-single.jsp";
	 }
	@RequestMapping("/addtocart/{id}")
	public String addtocart(Model model,@PathVariable("id")Long id,HttpSession session,HttpServletRequest request) {
		Product x=ps.findProductById(id);
		if (session.getAttribute("items") != null) {
		ArrayList<Product> arraytofix = (ArrayList<Product>) session.getAttribute("items");
		
		arraytofix.add(x);
		session.setAttribute("items", arraytofix);
		}
		else {
			ArrayList<Product> items = new ArrayList<Product>();
			items.add(x);
			session.setAttribute("items", items);
			
		}
		return "redirect:/cart";
	}
	 @RequestMapping("/remove/{id}")
	 public String removefromcart(@PathVariable("id") Long id,HttpSession session) {
		 Product x=ps.findProductById(id);
		 ArrayList<Product> arraytofix = (ArrayList<Product>) session.getAttribute("items");
			for(Product i:arraytofix) {
				if (i.getId() == x.getId()) {
					arraytofix.remove(i);
					break;
				}
			}
			session.setAttribute("items", arraytofix);
		 return "redirect:/cart";
		 
	 }
	@RequestMapping("/cart")
	 public String cart(Model model,HttpSession session) {
			long total = 0;
			if (session.getAttribute("items") != null) {
			ArrayList<Product> totalcats = (ArrayList<Product>) session.getAttribute("items");
			
			for (Product x:totalcats) {
				if(x.getSale() == 0)
					total+=x.getPrice();
				    else {
				    	total+=x.getPrice()-(x.getPrice()*x.getSale()/100);
				    }
			}
			model.addAttribute("total",total);
			}
			else {
				total=0;
			}
			return "cart.jsp";
	 }
	@RequestMapping("/register")
	 public String register(@ModelAttribute("User") User User) {
			return "register.jsp";
	 }
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
	        if(result.hasErrors()) {
	            return "registrationPage.jsp";
	        }
	        ps.registerUser(user);
	        return "redirect:/login";
	    }
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
	        // if the user is authenticated, save their user id in session
	        // else, add error messages and return the login page
	    	if(ps.authenticateUser(email, password)==true) {
	    		User user=ps.findByEmail(email);
	    		session.setAttribute("user.id", user.getId());
	    		session.setAttribute("role", user.getRole().getId());
	    		ArrayList<Product> items = new ArrayList<Product>();
	    		session.setAttribute("items", items);
	    		return "redirect:/";	
	    	}
	    	else {
	    		return "redirect:/login";
	    	}
	    }
	 @RequestMapping(value="/logout")
	 public String logout(HttpSession session,Model model) {
		  session.invalidate();
		  return "redirect:/";
	 }
	 @RequestMapping(value="/clearcart")
	 public String clearcart(HttpSession session,Model model) {
		 ArrayList<Product> items = new ArrayList<Product>();
		  session.setAttribute("items", items);
		  return "redirect:/";
	 }
	 @RequestMapping("/admin")
	 public String admin(HttpSession session,Model model) {
		 Long id=(Long)session.getAttribute("user.id");
			if (id == null ) {
				return "redirect:/login";
			}
			User user=ps.findUserById(id);
			if(user.getRole().getId() != 1) {
				return "redirect:/";
			}
			
			List <Product> prods=ps.allproducts();
			model.addAttribute("prods",prods);
			return "adminOneScreen.jsp";
	 }
	
	 @RequestMapping("/orders")
	 public String offers(HttpSession session,Model model) {
		 Long id=(Long)session.getAttribute("user.id");
			if (id == null ) {
				return "redirect:/login";
			}
			User user=ps.findUserById(id);
			if(user.getRole().getId() != 1) {
				return "redirect:/";
			}
			
			List <Order> orders=ps.allorders();
			model.addAttribute("orders",orders);
			return "adminorders.jsp";
	 }
	 @RequestMapping("/dorders")
	 public String doffers(HttpSession session,Model model) {
		 Long id=(Long)session.getAttribute("user.id");
			if (id == null ) {
				return "redirect:/login";
			}
			User user=ps.findUserById(id);
			if(user.getRole().getId() != 1) {
				return "redirect:/";
			}
			
			List <Order> orders=ps.allorders();
			model.addAttribute("orders",orders);
			return "delieveredproducts.jsp";
	 }

	 @RequestMapping(value="/adminprod/delete/{id}")
	 public String destroy(@PathVariable("id")Long id) {
		ps.deleteprod(id);
	 	return"redirect:/admin";
	 }
	
	 @RequestMapping("/admin/createform")
	 public String addapp(@ModelAttribute ("Product") Product Product,Model model) {	
		 List <Category> x=projectService.allcats();
		 List <Supplier> y=ps.allsupps();
    	 model.addAttribute("x",x);
    	 model.addAttribute("y",y);
		 return "addapp.jsp";
		 
	 }

	 @RequestMapping(value="/addapp",method=RequestMethod.POST)
	  public String addapp(@Valid @ModelAttribute("Product") Product Product, BindingResult result,HttpSession session,@RequestParam("Image") MultipartFile multipartFile) throws IOException {
		 String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		 User owner=ps.findUserById((Long)session.getAttribute("user.id"));
		 Product.setImage(fileName);
		 Product.setOwner(owner);
		 Product.setSale(0);
 	  	 ps.createprod(Product);
         String uploadDir = "user-photos/" + 4;
         FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
		 return "redirect:/admin";
 
	 }
	 @RequestMapping("/adminprod/update/{id}")
	 public String updateform(@PathVariable("id") Long id,Model model) {	 
		 Product x=projectService.findProductById(id);
		 model.addAttribute("x",x);
		 List <Category> g=projectService.allcats();
	     model.addAttribute("g",g);
	     List <Supplier> m=ps.allsupps();
	     model.addAttribute("m",m);
		 return "edit.jsp";
		 
	 }
	 
	 @RequestMapping(value="/checkout")
	  public String checkout(Model model,HttpSession session)  {
	   User savedUser=ps.findUserById((Long)session.getAttribute("user.id"));
	   ArrayList<Product> ordereditems = (ArrayList<Product>) session.getAttribute("items");
	   Order order=new Order();
	   Status ordered=ps.statusById(1);
	   order.setOrderProducts(ordereditems);
	   order.setUser(savedUser);
	   order.setStatus(ordered);
	   long total=0;
	   for (Product x:ordereditems) {
		    if(x.getSale() == 0)
			total+=x.getPrice();
		    else {
		    	total+=x.getPrice()-(x.getPrice()*x.getSale()/100);
		    }
			System.out.println(total);
		}
	   order.setTotal(total);
  	   ps.createooder(order);
  	   ArrayList<Product> items = new ArrayList<Product>();
  	   session.setAttribute("items", items);
		 return "redirect:/";

	 }
	 @RequestMapping(value="/updateprod/{id}",method=RequestMethod.POST)
	  public String updateprod(@Valid @ModelAttribute("Product") Product Product, BindingResult result,HttpSession session) throws IOException { 
		 if (result.hasErrors()) {
	            return "/edit.jsp";
	        } else {
	        	User Owner=ps.findUserById((Long)session.getAttribute("user.id"));
	        	Product.setOwner(Owner);
	        	ps.updateprod(Product);
	        	return "redirect:/admin";	
	        }
	 }
	 @RequestMapping(value="/acceptorder/{id}")
	 public String acceptorder(@PathVariable("id")Long id) {
		Order yes=ps.findOrderById(id);
		Status ordered=ps.statusById(2);
		yes.setStatus(ordered);
		ps.createooder(yes);
	 	return"redirect:/orders";
	 }
	 @RequestMapping(value="/declineorder/{id}")
	 public String declineorder(@PathVariable("id")Long id) {
		 Order yes=ps.findOrderById(id);
		 Status ordered=ps.statusById(3);
		yes.setStatus(ordered);
		for(Product x:yes.getOrderProducts()) {
			x.setQty(x.getQty()-1);
			x.setSold(x.getSold()+1);
			System.out.println(x.getSold());
		}
		ps.createooder(yes);
	 	 return"redirect:/orders";
	 }
	
	 @RequestMapping("/addCat")
	 public String addCat(@ModelAttribute ("Category") Category Category,Model model) {
		 
	 	 return"catadd.jsp";
	 }
	 @RequestMapping(value="/addCat",method=RequestMethod.POST)
	 public String addCat(@Valid @ModelAttribute("Category") Category Category) {
		 ps.createcategory(Category);
	 	 return"redirect:/admin";
	 }
	 @RequestMapping("/addSupplier")
	 public String addSupplier(@ModelAttribute ("Supplier") Supplier Supplier,Model model) {
	 	 return"supplieradd.jsp";
	 }
	 @RequestMapping(value="/addSupplier",method=RequestMethod.POST)
	 public String addSupplier(@Valid @ModelAttribute("Supplier") Supplier Supplier) {
		 ps.addsupplier(Supplier);
	 	 return"redirect:/admin";
	 }
	 @RequestMapping(value="/profit", method=RequestMethod.POST)
	    public String profit(Model model,HttpSession session,@RequestParam(value="startdate") Date  startdate, @RequestParam(value="enddate") Date  enddate) {
		 List<Order> y=ps.DorderByDate(startdate,enddate);
		 long totalprofit=0;
		 for (Order i:y) {
			 totalprofit+=i.getTotal();
		 }
		 session.setAttribute("profit", totalprofit);
		 return "redirect:/profits";
	 }
	 @RequestMapping("/profits")
	 public String profits(HttpSession session,Model model) {
		 Long id=(Long)session.getAttribute("user.id");
			if (id == null ) {
				return "redirect:/login";
			}
			User user=ps.findUserById(id);
			if(user.getRole().getId() != 1) {
				return "redirect:/";
			}
			long totalprofit=0;
			List<Order> x = ps.deliveredOrders();
			for(Order i:x) {
				totalprofit+=i.getTotal();
			}
			model.addAttribute("total",totalprofit);
			return "Profits.jsp";
	 }
	 

	  @RequestMapping("/about")
	  public String about(Model model) {
		  return "about.jsp";
	  }
	 @RequestMapping(value="/search", method=RequestMethod.POST)
	 public String searchprod(@RequestParam("hello") String input,Model model) {
		 Product x = ps.searchprod(input);
		 if(x == null) {
			 return "redirect:/";
		 }
		 else {
			 return "redirect:/single-product/"+x.getId();
		 }

	 }
}
