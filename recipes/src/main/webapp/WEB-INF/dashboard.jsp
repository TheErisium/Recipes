<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Welcome, <c:out value="${user.firstName}" />!</h1>
    <h3 class="sub-header">Explore our Recipes or Add Your Own</h3>
    <div class="button-group">
        <a href="/recipes/new" class="btn add-btn">Add Recipe</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <table class="recipe-table">
        <thead>
            <tr>
                <th>Recipe Type</th>
                <th>Name</th>
                <th>Prep Time</th>
                <th>Cook Time</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="recipe" items="${recipes}">
                <tr>
                    <td>
                        <a href="/recipes/${recipe.id}">
                            <c:out value="${recipe.recipeType}" />
                        </a>
                    </td>
                    <td><c:out value="${recipe.name}" /></td>
                    <td><c:out value="${recipe.prepTime}" /></td>
                    <td><c:out value="${recipe.cookTime}" /></td>
                    <td>
                        <a href="/recipes/${recipe.id}/edit" class="btn edit-btn">Edit</a>
                        <a href="/recipes/${recipe.id}/delete" class="btn delete-btn">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>