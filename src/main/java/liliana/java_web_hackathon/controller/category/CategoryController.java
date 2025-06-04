package liliana.java_web_hackathon.controller.category;

import liliana.java_web_hackathon.model.entity.Category;
import liliana.java_web_hackathon.model.entity.Product;
import liliana.java_web_hackathon.model.service.category.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    private CategoryServiceImpl categoryService;
    @GetMapping("/categories")
    public String categories(Model model) {
        model.addAttribute("categories", categoryService.getAll());
        return "category/showCategories";
    }

    @GetMapping("/categories/add")
    public String showFormAddCategory(Model model) {
        model.addAttribute("category", new Category());
        return "category/addCategory";
    }

    @PostMapping("/categories/add")
    public String addCategory(@ModelAttribute("category") Category category) {
        categoryService.save(category);
        return "redirect:/categories";
    }

    @GetMapping("/categories/search")
    public String searchCategories(@RequestParam("keyword") String keyword, Model model) {
        List<Category> categories = categoryService.getByName(keyword);
        model.addAttribute("categories", categories);
        return "category/showCategories";
    }

}
