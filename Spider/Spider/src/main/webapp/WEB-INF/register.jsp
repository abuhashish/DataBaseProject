  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:include page="header.jsp"></jsp:include>
 <!-- Register Section Start -->
    <div class="section section-margin">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-8 m-auto">
                    <div class="login-wrapper">

                        <!-- Register Title & Content Start -->
                        <div class="section-content text-center m-b-30">
                            <h2 class="title m-b-10">Create Account</h2>
                        </div>
                        <!-- Register Title & Content End -->

                        <!-- Form Action Start -->
                        <form:form method="POST" action="/registration" modelAttribute="User">
						
					   			<div class="single-input-item m-b-10">
						           <form:label path="email">name:</form:label>
						           <form:input  path="name" />
					             </div>
						      
						       <div class="single-input-item m-b-10">
						           <form:label path="email">Email:</form:label>
						           <form:input type="email" path="email" />
						       </div>
						       <div class="single-input-item m-b-10">
						           <form:label path="password">Password:</form:label>
						           <form:password path="password" />
						       </div>
						       
						        <div class="single-input-item">
                                <div class="login-reg-form-meta m-b-n15">
                                    <button class="btn btn btn-gray-deep btn-hover-primary m-b-15">Create</button>
                                </div>
                            </div>
						   </form:form>
                        <!-- Form Action End -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Section End -->
        <jsp:include page="footer.jsp"></jsp:include>