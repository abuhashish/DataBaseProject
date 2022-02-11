<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <form:form method="POST" action="/addSupplier" modelAttribute="Supplier">
        <p>
            <form:label path="supplier_name">Supplier Name:</form:label>
            <form:input type="supplier_name" path="supplier_name"/>
        </p>
  
        <input type="submit" value="Create"/>
    </form:form>
