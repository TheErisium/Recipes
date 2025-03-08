<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Update Recipe: <c:out value="${recipe.name}" /></h1>
    
    <div class="button-group">
        <a href="/dashboard" class="btn home-btn">Home</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="form-container">
        <form action="/recipes/${recipe.id}/update" method="post">
            <label for="recipeType">Recipe Type:</label><br/>
            <p class="error-msg"><c:out value="${errorRecipeType}" /></p>
            <select id="recipeType" name="recipeType">
                <option value="indian" <c:if test="${recipe.recipeType == 'indian'}">selected</c:if>>Indian</option>
                <option value="mexican" <c:if test="${recipe.recipeType == 'mexican'}">selected</c:if>>Mexican</option>
                <option value="chinese" <c:if test="${recipe.recipeType == 'chinese'}">selected</c:if>>Chinese</option>
                <option value="italian" <c:if test="${recipe.recipeType == 'italian'}">selected</c:if>>Italian</option>
                <option value="japanese" <c:if test="${recipe.recipeType == 'japanese'}">selected</c:if>>Japanese</option>
                <option value="greek" <c:if test="${recipe.recipeType == 'greek'}">selected</c:if>>Greek</option>
                <option value="thai" <c:if test="${recipe.recipeType == 'thai'}">selected</c:if>>Thai</option>
                <option value="american" <c:if test="${recipe.recipeType == 'american'}">selected</c:if>>American</option>
            </select><br/><br/>

            <label for="name">Name:</label><br/>
            <p class="error-msg"><c:out value="${errorName}" /></p>
            <input type="text" id="name" name="name" value="<c:out value='${recipe.name}' />"><br/><br/>

            <label for="prepTime">Prep Time:</label><br/>
            <p class="error-msg"><c:out value="${errorPrepTime}" /></p>
            <input type="text" id="prepTime" name="prepTime" value="<c:out value='${recipe.prepTime}' />"><br/><br/>

            <label for="cookTime">Cook Time:</label><br/>
            <p class="error-msg"><c:out value="${errorCookTime}" /></p>
            <input type="text" id="cookTime" name="cookTime" value="<c:out value='${recipe.cookTime}' />"><br/><br/>

            <label for="description">Description:</label><br/>
            <p class="error-msg"><c:out value="${errorDescription}" /></p>
            <textarea id="description" name="description" rows="3" cols="30"><c:out value="${recipe.description}" /></textarea><br/><br/>

            <label for="ingredients">Ingredients:</label><br/>
            <p class="error-msg"><c:out value="${errorIngredients}" /></p>
            <textarea id="ingredients" name="ingredients" rows="3" cols="30"><c:out value="${recipe.ingredients}" /></textarea><br/><br/>

            <label for="directions">Directions:</label><br/>
            <p class="error-msg"><c:out value="${errorDirections}" /></p>
            <textarea id="directions" name="directions" rows="3" cols="30"><c:out value="${recipe.directions}" /></textarea><br/><br/>

            <button type="submit" class="btn submit-btn">Update</button>
        </form>
    </div>
</body>
</html>