<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="recipe-header"><c:out value="${recipe.name}" /></h1>

    <div class="button-group">
        <a href="/dashboard" class="btn home-btn">Home</a>
        <a href="/recipes/new" class="btn add-btn">Add New Recipe</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="recipe-info">
        <span>Recipe: <c:out value="${recipe.recipeType}" /></span>
        <span>Prep Time: <c:out value="${recipe.prepTime}" /></span>
        <span>Cook Time: <c:out value="${recipe.cookTime}" /></span>
    </div>

    <hr class="separator">

    <div class="recipe-details">
        <h2>Description</h2>
        <p><c:out value="${recipe.description}" /></p>

        <h2>Ingredients</h2>
        <p><c:out value="${recipe.ingredients}" /></p>

        <h2>Directions</h2>
        <p><c:out value="${recipe.directions}" /></p>
    </div>

    <div class="button-group">
        <a href="/recipes/${recipe.id}/edit" class="btn edit-btn">Edit</a>
        <a href="/recipes/${recipe.id}/delete" class="btn delete-btn">Delete</a>
    </div>
</body>
</html>