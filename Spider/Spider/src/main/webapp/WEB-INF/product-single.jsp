<%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>	
<jsp:include page="header.jsp"></jsp:include>
<!-- Breadcrumb Area Start -->
    <div class="section breadcrumb-area bg-name-bright">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-wrapper">
                        <h2 class="breadcrumb-title">Single Product</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li>Single Product</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Single Product Section Start -->
    <div class="section section-margin">
        <div class="container">
            <div class="row">

                <div class="col-lg-5 offset-lg-0 col-md-8 offset-md-2">

                    <!-- Product Details Image Start -->
                    <div class="product-details-img">

                        <!-- Single Product Image Start -->
                        <div class="single-product-img swiper-container product-gallery-top">
                            <div class="swiper-wrapper popup-gallery">

                                <a class="swiper-slide w-100" href="/assets/images/products/large-product/1.png">
                                    <img class="w-100" src="${x.getPhotosImagePath() }" alt="Product">
                                </a>
                               

                            </div>
                        </div>
                        <!-- Single Product Image End -->

                        <!-- Single Product Thumb Start -->
                        <div class="single-product-thumb swiper-container product-gallery-thumbs">
                            <div class="swiper-wrapper">
                               
                            </div>

                            <!-- Next Previous Button Start -->
                            <div class="swiper-button-next swiper-nav-button"><i class="ti-arrow-right"></i></div>
                            <div class="swiper-button-prev swiper-nav-button"><i class="ti-arrow-left"></i></div>
                            <!-- Next Previous Button End -->

                        </div>
                        <!-- Single Product Thumb End -->

                    </div>
                    <!-- Product Details Image End -->

                </div>

                <div class="col-lg-7">

                    <!-- Product Summery Start -->
                    <div class="product-summery position-relative">

                        <!-- Product Head Start -->
                        <div class="product-head m-b-15">
                            <h2 class="product-title">${x.productName }</h2>
                        </div>
                        <!-- Product Head End -->

                        <!-- Rating End -->

                        <!-- Price Box Start -->
                        <div class="price-box m-b-10">
                        <c:choose >
                        	<c:when test="${x.sale eq 0}">
                            <span class="regular-price">${x.price }</span>
                            </c:when>
                            <c:otherwise>
                            <span class="regular-price">${x.priceaftersale() }</span>
                            </c:otherwise>
                        </c:choose>
                        </div>
                        <!-- Price Box End -->

                        <!-- Product Inventory Start -->
                        <div class="product-inventroy m-b-15">
                            <span class="inventroy-title"> <strong>Availability:</strong></span>
                            <span class="inventory-varient">${x.qty } Left in Stock</span>
                        </div>
                        <!-- Product Inventory End -->

                        <!-- Description Start -->
                        <p class="desc-content m-b-25">${x.description }</p>
                        <!-- Description End -->
                        <!-- Cart Button Start -->
                        <div class="cart-btn action-btn m-b-30">
                            <div class="action-cart-btn-wrapper d-flex">
                                <div class="add-to_cart">
                                <c:choose>
						           <c:when test="${sessionScope.role eq null}">
						          
						           <li style=" list-style-type: none;" class="nav-item">
						            <a  class="nav-link" href="/login">Login</a>
						          </li>
						          </c:when>
						          <c:otherwise>
						          
						           <li style=" list-style-type: none;" class="nav-item">
						            <a class="nav-link" href="/addtocart/${x.id }">Add to cart</a>
						          </li>
						          </c:otherwise>
						          </c:choose>
                                    
                                </div>
                               
                            </div>
                        </div>
                        <!-- Cart Button End -->

                        <!-- Social Shear Start -->
                        <div class="social-share">
                            <div class="widget-social justify-content-start m-b-30">
                                <a title="Twitter" href="#/"><i class="icon-social-twitter"></i></a>
                                <a title="Instagram" href="#/"><i class="icon-social-instagram"></i></a>
                                <a title="Linkedin" href="#/"><i class="icon-social-linkedin"></i></a>
                                <a title="Skype" href="#/"><i class="icon-social-skype"></i></a>
                                <a title="Dribble" href="#/"><i class="icon-social-dribbble"></i></a>
                            </div>
                        </div>
                        <!-- Social Shear End -->

                  

                    </div>
                    <!-- Product Summery End -->

                </div>

            </div>
        </div>
    </div>
   


 
<jsp:include page="footer.jsp"></jsp:include>