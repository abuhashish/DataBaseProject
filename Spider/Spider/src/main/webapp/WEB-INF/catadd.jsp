<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <form:form method="POST" action="/addCat" modelAttribute="Category">
        <p>
            <form:label path="cat">Category Name:</form:label>
            <form:input type="cat" path="cat"/>
        </p>
  
        <input type="submit" value="Create"/>
    </form:form>
