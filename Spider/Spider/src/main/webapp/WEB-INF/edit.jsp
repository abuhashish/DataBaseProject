<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Edit app</h1>
<form:form action="/updateprod/${x.id }" method="post" modelAttribute="x">
    <input type="hidden" name="_method" value="put">
	
    <p>
    
        <form:label path="productName">name</form:label>
        <form:errors path="productName"/>
        <form:input path="productName"  />
    </p>
    
    <p>
        <form:label path="description">description</form:label>
        <form:errors path="description"/>
        <form:input path="description" />
    </p>
    <p>
        <form:label path="qty" >qty</form:label>
        <form:errors path="qty"/>
        <form:input path="qty" />
    </p>
     <p>
        <form:label path="orginial_price" >orginal_price</form:label>
        <form:errors path="orginial_price"/>
        <form:input path="orginial_price" />
    </p>
     <p>
        <form:label path="price" >price</form:label>
        <form:errors path="price"/>
        <form:input path="price" />
    </p>
     <p>
        <form:label path="image" >image</form:label>
        <form:errors path="image"/>
         <form:input type="hidden"  path="image" />        
    </p>
	  <p>
	  Category
				        <form:errors path="cat"/>     
				        <form:select  path="cat">
					     <c:forEach items="${g }" var="z">
				        <option value="${z.id }"><c:out value="${z.cat }"></c:out></option>
				        </c:forEach>
				   
				        </form:select>
				    </p>      	    
	  <p>
	  Supplier
				        <form:errors path="supplier"/>     
				        <form:select  path="supplier">
					     <c:forEach items="${m }" var="z">
				        <option value="${z.id }"><c:out value="${z.getSupplier_name() }"></c:out></option>
				        </c:forEach>
				   
				        </form:select>
				    </p>   
				    
				  <p style="color:red; size:10px">Update here to put sale on a certain item  </p>
				     <p style="color:red">
    
        <form:label path="sale">Sale</form:label>
        <form:errors path="sale"/>
        <form:input path="sale"  />
    </p>   	    
    
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>