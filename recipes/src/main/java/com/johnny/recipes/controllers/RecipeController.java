package com.johnny.recipes.controllers;

import com.johnny.recipes.models.Recipe;
import com.johnny.recipes.models.User;
import com.johnny.recipes.services.RecipeService;
import com.johnny.recipes.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @Autowired
    private UserService userService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        List<Recipe> allRecipes = recipeService.allRecipes();
        model.addAttribute("recipes", allRecipes);
        return "dashboard";
    }

    @GetMapping("/recipes/new")
    public String newRecipe(HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        model.addAttribute("recipe", new Recipe());
        return "add"; 
    }

    @PostMapping("/recipes/create")
    public String createRecipe(
        @RequestParam("recipeType") String recipeType,
        @RequestParam("name") String name,
        @RequestParam("prepTime") String prepTime,
        @RequestParam("cookTime") String cookTime,
        @RequestParam("description") String description,
        @RequestParam("ingredients") String ingredients,
        @RequestParam("directions") String directions,
        HttpSession session
    ) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        User currentUser = userService.findById(userId);
        if (currentUser == null) {
            return "redirect:/";
        }
        Recipe newRecipe = new Recipe();
        newRecipe.setRecipeType(recipeType);
        newRecipe.setName(name);
        newRecipe.setPrepTime(prepTime);
        newRecipe.setCookTime(cookTime);
        newRecipe.setDescription(description);
        newRecipe.setIngredients(ingredients);
        newRecipe.setDirections(directions);
        newRecipe.setUser(currentUser);
        recipeService.createRecipe(newRecipe);
        return "redirect:/dashboard";
    }

    @GetMapping("/recipes/{id}")
    public String viewRecipe(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null) {
            return "redirect:/dashboard";
        }
        model.addAttribute("recipe", recipe);
        return "view";
    }

    @GetMapping("/recipes/{id}/edit")
    public String editRecipe(@PathVariable("id") Long recipeId, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null) {
            return "redirect:/dashboard";
        }
        if (!recipe.getUser().getId().equals(userId)) {
            return "redirect:/dashboard";
        }
        model.addAttribute("recipe", recipe);
        return "update";
    }

    @PostMapping("/recipes/{id}/update")
    public String updateRecipe(
        @PathVariable("id") Long recipeId,
        @RequestParam("recipeType") String recipeType,
        @RequestParam("name") String name,
        @RequestParam("prepTime") String prepTime,
        @RequestParam("cookTime") String cookTime,
        @RequestParam("description") String description,
        @RequestParam("ingredients") String ingredients,
        @RequestParam("directions") String directions,
        HttpSession session
    ) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null) {
            return "redirect:/dashboard";
        }
        if (!recipe.getUser().getId().equals(userId)) {
            return "redirect:/dashboard";
        }
        recipe.setRecipeType(recipeType);
        recipe.setName(name);
        recipe.setPrepTime(prepTime);
        recipe.setCookTime(cookTime);
        recipe.setDescription(description);
        recipe.setIngredients(ingredients);
        recipe.setDirections(directions);
        recipeService.updateRecipe(recipe);
        return "redirect:/dashboard";
    }

    @GetMapping("/recipes/{id}/delete")
    public String deleteRecipe(@PathVariable("id") Long recipeId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/";
        }
        Recipe recipe = recipeService.findRecipe(recipeId);
        if (recipe == null) {
            return "redirect:/dashboard";
        }
        if (!recipe.getUser().getId().equals(userId)) {
            return "redirect:/dashboard";
        }
        recipeService.deleteRecipe(recipeId);
        return "redirect:/dashboard";
    }
}
