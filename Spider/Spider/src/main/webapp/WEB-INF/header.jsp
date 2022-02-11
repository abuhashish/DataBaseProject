<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Amber - Pet Care Bootstrap 5 Template</title>
    <link rel="shortcut icon" href="/assets/images/favicon.ico">
    <link rel="stylesheet" href="/assets/css/vendor/vendor.min.css">
    <link rel="stylesheet" href="/assets/css/plugins/plugins.min.css">
    <link rel="stylesheet" href="/assets/css/style.min.css">
</head>

<body>
    <!-- Header Section Start -->
    <div class="header section">
        <!-- Header Bottom Start -->
        <div class="header-bottom">
            <div class="header-sticky">
                <div class="container">
                    <div class="row align-items-center position-relative">

                        <!-- Header Logo Start -->
                        <div class="col-lg-3 col-md-4 col-6">
                            <div class="header-logo">
                                <a href="/"><img   style="width:65px ; heiRght:65px" src="/assets/images/logo/logo.jpg" alt="Site Logo" /></a>
                            </div>
                        </div>
                        <!-- Header Logo End -->

                        <!-- Header Menu Start -->
                        <div class="col-lg-6 d-none d-lg-block">
                            <div class="main-menu">
                                <ul>
                                    <li class="has-children">
                                        <a href="/">Home</a>                            
                                    </li>
                                    <li class="has-children position-static">
                                        <a href="/shop">Shop</a>    
                                    </li>
                                    <li><a href="/about">About</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Header Menu End -->

                        <!-- Header Action Start -->
                        <div class="col-lg-3 col-md-8 col-6">
                            <div class="header-actions">

                                <!-- Header Action Search Button Start -->
                                <div class="header-action-btn header-action-btn-search d-none d-md-flex">
                                    <div class="action-execute">
                                        <a class="action-search-open" href="javascript:void(0)"><i class="icon-magnifier icons"></i></a>
                                        <a class="action-search-close" href="javascript:void(0)"><i class="ti-close"></i></a>
                                    </div>
                                    <!-- Search Form and Button Start -->
                                    <form  method="POST" class="header-search-form" action="/search">
                                        <input type="text" name="hello" class="header-search-input" placeholder="Search Our Store">
                                        <button class="header-search-button"><i class="icon-magnifier icons"></i></button>
                                    </form>

                                    <!-- Search Form and Button End -->
                                </div>
                                    <c:if test="${sessionScope.role eq 2 or sessionScope.role eq 1}">
         						 <a class="cart-visible" href="/cart">
                                        <button style="margin-top:25px" > <i class="icon-handbag icons"></i></button>
                                    </a>

         							 </c:if>
                                <!-- Header Action Search Button End -->

                                <!-- Header My Account Button Start -->
                                <c:choose>
						           <c:when test="${sessionScope.role eq null}">
						          
						           <li style=" list-style-type: none;" class="nav-item">
						            <a style="margin-top:25px" class="nav-link" href="/login">Login</a>
						          </li>
						          </c:when>
						          <c:otherwise>
						          
						           <li style=" list-style-type: none;" class="nav-item">
						            <a  style="margin-top:25px" class="nav-link"  href="/logout">Logout</a>
						          </li>
						          </c:otherwise>
						          </c:choose>
                             	
                                <!-- Header My Account Button End -->

                                <!-- Header Action Button Start -->
                               
						         
                              

                                   

                                <!-- Mobile Menu Hambarger Action Button Start -->
                                <a href="javascript:void(0)" class="header-action-btn header-action-btn-menu d-lg-none d-md-flex">
                                    <i class="icon-menu"></i>
                                </a>
                                <!-- Mobile Menu Hambarger Action Button End -->

                            </div>
                        </div>
                        <!-- Header Action End -->

                    </div>
                </div>
            </div>
        </div>
        <!-- Header Bottom End -->

    </div>
    <!-- Header Section End -->