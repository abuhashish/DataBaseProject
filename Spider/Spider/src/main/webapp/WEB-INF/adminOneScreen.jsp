
    <%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="adminheader.jsp"></jsp:include>
 <!-- Content Wrapper. Contains page content -->
 
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <h1 style="margin-left:155px; color:lightgreen">To Set A product On Sale Please Update The zero Value in Update</h1>
    <div class="content-header" style="margin-left:165px">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-10" style="display:flex;justify-content:space-evenly;">
       		<table class="table table-dark">
       		
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">name</th>
      <th scope="col">desc</th>
      <th scope="col">Original_Price</th>
      <th scope="col">Selling_Price</th>
      <th scope="col">qty</th>
      <th scope="col">cat</th>
      <th scope="col">Supplier</th>
      <th scope="col">Sold Units</th>
      <th scope="col">controll</th>
      
    </tr>
  </thead>
  <tbody>
 <c:forEach items="${prods}" var="prod">
    <tr>
      <!--  <th scope="row">1</th> -->
       <th scope="row"><c:out value="${prod.getId() }"></c:out></th>
      <td><c:out value="${prod.getProductName() }"/></td>
      <td><c:out value="${prod. getDescription()}"/></td>
      <td><c:out value="${prod. getOrginial_price()}"/></td>
      <td><c:out value="${prod. getPrice()}"/></td>
      <td><c:out value="${prod. getQty()}"/></td>
       <td><c:out value="${prod.getCat().getCat()}"/></td>
       <td><c:out value="${prod.getSupplier().getSupplier_name() }"/></td>
       <td><c:out value="${prod.sold}"/></td>
         <!--   <td> <p> <a class="btn btn-danger" href="/adminprop/delete/${prod.id}">Delete</a></p></td> -->
    <td style="display:flex"> <form action="/adminprod/delete/${prod.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input class="btn btn-danger" type="submit" value="Delete">
</form>
<form action="/adminprod/update/${prod.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input class="btn btn-primary" type="submit" value="update">
</form>
</td>

     
    </tr>
</c:forEach>
  </tbody>
</table>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<jsp:include page="adminfooter.jsp"></jsp:include>