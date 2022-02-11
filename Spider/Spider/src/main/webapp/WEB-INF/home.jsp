<%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>	
<jsp:include page="header.jsp"></jsp:include>
<!-- Hero/Intro Slider Start -->
    <div class="section">
        <div class="hero-slider swiper-container">
            <div class="swiper-wrapper">

                <div class="hero-slide-item swiper-slide">
                    <div class="hero-slide-bg">
                        <img src="assets/images/slider/slider1-1.png" alt="Slider Image" />
                    </div>
                    <div class="container">
                        <div class="hero-slide-content text-start">
                            <h5 class="sub-title">We keep pets for pleasure.</h5>
                            <h2 class="title m-0">Vitamins For all Pets</h2>
                            <p class="ms-0">We know your concerns when you are looking for a chewing treat for your dog.</p>
                            <a href="shop.html" class="btn btn-dark btn-hover-primary">Shop Now</a>
                        </div>
                    </div>
                </div>

                <div class="hero-slide-item swiper-slide">
                    <div class="hero-slide-bg">
                        <img src="assets/images/slider/slider1-2.png" alt="Slider Image" />
                    </div>
                    <div class="container">
                        <div class="hero-slide-content text-center text-md-end">
                            <h5 class="sub-title">We keep pets for pleasure.</h5>
                            <h2 class="title m-0">Vitamins For all Pets</h2>
                            <p>We know your concerns when you are looking for a chewing treat for your dog.</p>
                            <a href="shop.html" class="btn btn-dark btn-hover-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Swiper Pagination Start -->
            <div class="swiper-pagination d-lg-none"></div>
            <!-- Swiper Pagination End -->

            <!-- Swiper Navigation Start -->
            <div class="home-slider-prev swiper-button-prev main-slider-nav d-lg-flex d-none"><i class="icon-arrow-left"></i></div>
            <div class="home-slider-next swiper-button-next main-slider-nav d-lg-flex d-none"><i class="icon-arrow-right"></i></div>
            <!-- Swiper Navigation End -->
        </div>
    </div>
   <!-- Hero/Intro Slider End -->

    <div class="section section-padding">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 m-b-n30">

                <div class="col m-b-30" data-aos="fade-up" data-aos-duration="1000">
                    <!-- Single CTA Wrapper Start -->
                    <div class="single-cta-wrapper">

                        <!-- CTA Icon Start -->
                        <div class="cta-icon">
                            <i class="ti-truck"></i>
                        </div>
                        <!-- CTA Icon End -->

                        <!-- CTA Content Start -->
                        <div class="cta-content">
                            <h4 class="title">Free Shipping</h4>
                            <p>Free shipping on all order</p>
                        </div>
                        <!-- CTA Content End -->

                    </div>
                    <!-- Single CTA Wrapper End -->
                </div>

                <div class="col m-b-30" data-aos="fade-up" data-aos-duration="1100">
                    <!-- Single CTA Wrapper Start -->
                    <div class="single-cta-wrapper">

                        <!-- CTA Icon Start -->
                        <div class="cta-icon">
                            <i class="ti-headphone-alt"></i>
                        </div>
                        <!-- CTA Icon End -->

                        <!-- CTA Content Start -->
                        <div class="cta-content">
                            <h4 class="title">Online Support</h4>
                            <p>Online live support 24/7</p>
                        </div>
                        <!-- CTA Content End -->

                    </div>
                    <!-- Single CTA Wrapper End -->
                </div>

                <div class="col m-b-30" data-aos="fade-up" data-aos-duration="1200">
                    <!-- Single CTA Wrapper Start -->
                    <div class="single-cta-wrapper">

                        <!-- CTA Icon Start -->
                        <div class="cta-icon">
                            <i class="ti-bar-chart"></i>
                        </div>
                        <!-- CTA Icon End -->

                        <!-- CTA Content Start -->
                        <div class="cta-content">
                            <h4 class="title">Money Return</h4>
                            <p>Back guarantee under 5 days</p>
                        </div>
                        <!-- CTA Content End -->

                    </div>
                    <!-- Single CTA Wrapper End -->
                </div>

            </div>
        </div>
    </div>

    <!-- Product Section Start -->
    
    <div class="section position-relative">
        <div class="container">

            <!-- Products Tab Start -->
            <div class="row" data-aos="fade-up" data-aos-duration="1100">
                <div class="col-12">
                    <div class="tab-content">

                        <div class="tab-pane fade show active" id="tab-product-all">
                            <div class="row m-b-n40">

              
								 <h2 class="nav-item m-b-15"><a class="nav-link active" data-bs-toggle="tab" style="margin-left:40%;color:green">Bestsellers</a></h2>
                                <!-- Product Start -->
                               	 <c:forEach items="${top6 }" var="g">
                                <div class="col-12 col-sm-6 col-lg-3 product-wrapper m-b-40">
                                    <div class="product">
                                        <!-- Thumb Start  -->
                                        <div class="thumb">
                                            <a href="/single-product/${g.id }" class="image">
                                                <img class="fit-image" src="${g.getPhotosImagePath() }" alt="Product" />
                                            </a>
                                        </div>
                                        <!-- Thumb End  -->

                                        <!-- Content Start  -->
                                        <div class="content">
                                            <h5 class="title"><a href="/single-product/${g.id }">${g.productName }</a></h5>
                                           <span class="price">
                                     <c:choose>
						           			<c:when test="${g.sale eq 0}">
                                            <span class="new"> ${g.price} </span>
                                            </c:when>
                                            <c:otherwise>
                                            <span class="new"> ${g.priceaftersale()} </span>
                                             <span class="old">${g.price }</span>
                                            </c:otherwise>
                                            
                                      </c:choose>
                                    </span>
                                        </div>
                                        <!-- Content End  -->
                                    </div>
                                </div>
                                <!-- Product End -->
							</c:forEach>
  			

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Products Tab End -->
        </div>
    </div>
    <!-- Product Section End -->

   
<jsp:include page="footer.jsp"></jsp:include>