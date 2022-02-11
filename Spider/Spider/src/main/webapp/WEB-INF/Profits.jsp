
<%@ taglib prefix=  "c" uri=  "http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="adminheader.jsp"></jsp:include>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="margin-left:165px">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-10" style="justify-content:space-evenly;">
       		<h1 style="border:1px solid black; color:green">Total Profit : <c:out value="${total }"></c:out></h1>
       		<h2 style="color:blue">To select profit in a specific date:</h2>
       		<form method="POST" action="/profit">
       		<label for="startdate">Start Date</label>
       		<input name="startdate" type="date" value="2020-01-01">
       		<label for="enddate">End Date</label>
       		<input name="enddate" type="date" value="2022-01-01">
       		<br>
      		<button class="btn btn-primary">Search</button>
      		</form>
      		<br>
      		<c:if test="${sessionScope.profit != null}">
      		<h2>Profit is : <c:out value="${sessionScope.profit }"></c:out></h2>
      		</c:if>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<jsp:include page="adminfooter.jsp"></jsp:include>