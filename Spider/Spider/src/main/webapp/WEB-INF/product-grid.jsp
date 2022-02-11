<%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>	
<jsp:include page="header.jsp"></jsp:include>
<!-- Breadcrumb Area Start -->
    <div class="section breadcrumb-area bg-name-bright">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-wrapper">
                        <h2 class="breadcrumb-title">Shop Sidebar</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li>Shop Sidebar</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Shop Section Start -->
    <div class="section section-margin">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-9 col-12">

                    <!--shop toolbar start-->
                    <div class="shop_toolbar_wrapper flex-column flex-md-row p-2 m-b-40 border">

                        <!-- Shop Top Bar Left start -->
                        <div class="shop-top-bar-left">

                            <div class="shop_toolbar_btn">
                                <button data-role="grid_3" type="button" class="active btn-grid-3" title="Grid"><i class="ti-layout-grid4-alt"></i></button>
                               
                            </div>
                    

                        </div>
                        <!-- Shop Top Bar Left end -->



                    </div>
                    <!--shop toolbar end-->

                    <!-- Shop Wrapper Start -->
                    <div class="row shop_wrapper grid_3">
						<c:forEach items="${prods }" var="g">
                        <!-- Single Product Start -->
                        <div class="col-lg-4 col-md-4 col-sm-6 product">
                            <div class="product-inner">
                                <div class="thumb">
                                    <a href="/single-product/${g.id }" class="image">
                                        <img class="fit-image" src="${g.getPhotosImagePath() }" alt="Product" />
                                    </a>
                                </div>
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
                                   
                                    <p> ${g.description} </p>
                                    <!-- Cart Button Start -->
                                    <div class="cart-btn action-btn">
                                        <div class="action-cart-btn-wrapper d-flex">
                                            <div class="add-to_cart">
                                                <a class="btn btn-primary btn-hover-dark rounded-0" href="cart.html">Add to cart</a>
                                            </div>
                                            <a href="#/" class="action quickview" data-bs-toggle="modal" data-bs-target="#quick-view" title="Quickview"><i class="ti-plus"></i></a>
                                        </div>
                                    </div>
                                    <!-- Cart Button End -->
                                </div>
                            </div>
                        </div>
                        <!-- Single Product End -->
						</c:forEach>
                        

                        

                    </div>
                    <!-- Shop Wrapper End -->

                    <!--shop toolbar start-->
                    <div class="shop_toolbar_wrapper justify-content-center m-t-50">

                        <!-- Shopt Top Bar Right Start -->
                        <div class="shop-top-bar-right">
                        </div>
                        <!-- Shopt Top Bar Right End -->

                    </div>
                    <!--shop toolbar end-->

                </div>
                <div class="col-lg-3 col-12">
                    <!-- Sidebar Widget Start -->
                    <aside class="sidebar_widget m-t-50 mt-lg-0">
                        <div class="widget_inner">
                            <div class="widget-list m-b-50">
                                <h3 class="widget-title m-b-30">Search</h3>
                                <div class="search-box">
                                    <form  method="POST" class="header-search-form" action="/search">
                                        <input type="text" name="hello" class="header-search-input" placeholder="Search Our Store">
                                        <button class="header-search-button"><i class="icon-magnifier icons"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="widget-list m-b-50">
                                <h3 class="widget-title m-b-30">Categories</h3>
                                <div class="sidebar-body">
                                    <ul class="sidebar-list">
                                         <c:forEach items="${x }" var="g">
				        				<li ><a href="/shop/${g.id }"><c:out value="${g.cat }"></c:out></a></li>
				        				</c:forEach>
                                    </ul>
                                </div>
                            </div>                           
                        </div>
                    </aside>
                    <!-- Sidebar Widget End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Section End -->
    <jsp:include page="footer.jsp"></jsp:include>