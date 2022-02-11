
<%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="adminheader.jsp"></jsp:include>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="margin-left:165px">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-10" style="display:flex;justify-content:space-evenly;">
       		<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">user</th>
      <th scope="col">products</th>
      <th scope="col">total</th>
      <th scope="col">Order-Date</th>
      <th scope="col">Status</th>
      <th scope="col">Control</th>
      
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${orders}" var="prod">
 	<c:if test="${prod.getStatus().getId() != 3}">
         							
    <tr>
      <!--  <th scope="row">1</th> -->
       <th scope="row"><c:out value="${prod.getId() }"></c:out></th>
      <td><c:out value="${prod.getUser().getEmail() }"/></td>
      <td><c:forEach items="${prod. getOrderProducts()}" var="g">
      <ul>
      <li><c:out value="${g.productName }"/>   <img style="width:30px;height:30px" src="${g.getPhotosImagePath() }" alt="Product" /></li>
      </ul>
      </c:forEach></td>
      <td> ${prod.getTotal()} $ </td>
      <td>${prod.getCreatedAt() }</td>
      <td>${prod.getStatus().getStatus() }</td>
      <td>   
      <c:choose>
       <c:when test="${prod.getStatus().getId() eq 1}">						          
       <a class="btn btn-primary" href="/acceptorder/${prod.id}">Ready</a> 
      </c:when>
      <c:otherwise>  
     <a class="btn btn-success" href="/declineorder/${prod.id}">Deliver</a>
      </c:otherwise>
      </c:choose>
     </td>
    </tr>
     </c:if>
</c:forEach>
  </tbody>
</table>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<jsp:include page="adminfooter.jsp"></jsp:include>