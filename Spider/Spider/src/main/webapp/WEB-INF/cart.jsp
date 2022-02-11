 <%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>	
<jsp:include page="header.jsp"></jsp:include>
 <!-- Breadcrumb Area Start -->
    <div class="section breadcrumb-area bg-name-bright">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="breadcrumb-wrapper">
                        <h2 class="breadcrumb-title">Cart</h2>
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li>Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Shopping Cart Section Start -->
    <div class="section section-margin">
        <div class="container">

            <div class="row">
                <div class="col-12">

                    <!-- Cart Table Start -->
                    <div class="cart-table table-responsive">
                        <table class="table table-bordered">

                            <!-- Table Head Start -->
                            <thead>
                                <tr>
                                    <th class="pro-thumbnail">Image</th>
                                    <th class="pro-title">Product</th>
                                    <th class="pro-price">Price</th>                    
                                    <th class="pro-remove">Remove</th>
                                </tr>
                            </thead>
                            <!-- Table Head End -->

                            <!-- Table Body Start -->
                            <tbody>
                            <c:forEach items="${sessionScope.items }" var="g">
                                <tr>
                                    <td class="pro-thumbnail"><a href="#"><img class="fit-image" src="${g.getPhotosImagePath() }" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="#"> ${g.productName} </a></td>
                                    <td class="pro-price"> <c:choose >
                        	<c:when test="${g.sale eq 0}">
                            <span class="regular-price">${g.price }</span>
                            </c:when>
                            <c:otherwise>
                            <span class="regular-price">${g.priceaftersale() }</span>
                            </c:otherwise>
                        </c:choose></td>
   
                                   
                                    <td class="pro-remove"><a href="/remove/${g.id}"><i class="ti-trash"></i></a></td>
                                </tr>
                             </c:forEach>
                            </tbody>
                            <!-- Table Body End -->

                        </table>
                    </div>
                    <!-- Cart Table End -->

                    <!-- Cart Button Start -->
                    <div class="cart-button-section m-b-n20">

                        <!-- Cart Button left Side Start -->
                        <div class="cart-btn-lef-side m-b-20">
                            <a href="/shop" class="btn btn btn-gray-deep btn-hover-primary">Continue Shopping</a>
                        </div>
                        <!-- Cart Button left Side End -->

                        <!-- Cart Button Right Side Start -->
                        <div class="cart-btn-right-right m-b-20">
                            <a href="/clearcart" class="btn btn btn-gray-deep btn-hover-primary">Clear Shopping Cart</a>
                        </div>
                        <!-- Cart Button Right Side End -->

                    </div>
                    <!-- Cart Button End -->

                </div>
            </div>

            <div class="row m-t-50">
                <div class="col-lg-6 me-0 ms-auto">

                    <!-- Cart Calculation Area Start -->
                    <div class="cart-calculator-wrapper">

                        <!-- Cart Calculate Items Start -->
                        <div class="cart-calculate-items">

                            <!-- Cart Calculate Items Title Start -->
                            <h3 class="title">Cart Totals</h3>
                            <!-- Cart Calculate Items Title End -->

                            <!-- Responsive Table Start -->
                            <div class="table-responsive">
                                <table class="table">

                                    <tr class="total">
                                        <td>Total</td>
                                        <td class="total-amount">${total }</td>
                                    </tr>
                                </table>
                            </div>
                            <!-- Responsive Table End -->

                        </div>
                        <!-- Cart Calculate Items End -->

                        <!-- Cart Checktout Button Start -->
                        <a href="/checkout" class="btn btn btn-gray-deep btn-hover-primary m-t-30">Place Order</a>
                        <!-- Cart Checktout Button End -->

                    </div>
                    <!-- Cart Calculation Area End -->

                </div>
            </div>

        </div>
    </div>
    <!-- Shopping Cart Section End -->
<jsp:include page="footer.jsp"></jsp:include>