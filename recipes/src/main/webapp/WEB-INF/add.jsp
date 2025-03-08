<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Recipe</title>
    <link rel="stylesheet" href="/css/styles.css">
</head>
<body>
    <h1 class="main-header">Make Something Good</h1>
    
    <div class="button-group">
        <a href="/dashboard" class="btn home-btn">Home</a>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <div class="form-container">
        <form action="/recipes/create" method="post">
            <label for="recipeType">Recipe Type:</label><br/>
            <p class="error-msg"><c:out value="${errorRecipeType}" /></p>
            <select id="recipeType" name="recipeType">
                <option value="">--Select--</option>
                <option value="indian">Indian</option>
                <option value="mexican">Mexican</option>
                <option value="chinese">Chinese</option>
                <option value="italian">Italian</option>
                <option value="japanese">Japanese</option>
                <option value="greek">Greek</option>
                <option value="thai">Thai</option>
                <option value="american">American</option>
            </select><br/><br/>

            <label for="name">Name:</label><br/>
            <p class="error-msg"><c:out value="${errorName}" /></p>
            <input type="text" id="name" name="name"><br/><br/>

            <label for="prepTime">Prep Time:</label><br/>
            <p class="error-msg"><c:out value="${errorPrepTime}" /></p>
            <input type="text" id="prepTime" name="prepTime"><br/><br/>

            <label for="cookTime">Cook Time:</label><br/>
            <p class="error-msg"><c:out value="${errorCookTime}" /></p>
            <input type="text" id="cookTime" name="cookTime"><br/><br/>

            <label for="description">Description:</label><br/>
            <p class="error-msg"><c:out value="${errorDescription}" /></p>
            <textarea id="description" name="description" rows="3" cols="30"></textarea><br/><br/>

            <label for="ingredients">Ingredients:</label><br/>
            <p class="error-msg"><c:out value="${errorIngredients}" /></p>
            <textarea id="ingredients" name="ingredients" rows="3" cols="30"></textarea><br/><br/>

            <label for="directions">Directions:</label><br/>
            <p class="error-msg"><c:out value="${errorDirections}" /></p>
            <textarea id="directions" name="directions" rows="3" cols="30"></textarea><br/><br/>

            <button type="submit" class="btn submit-btn">Submit</button>
        </form>
    </div>
</body>
</html>