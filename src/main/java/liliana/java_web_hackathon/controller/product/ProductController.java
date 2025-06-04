package liliana.java_web_hackathon.controller.product;

import liliana.java_web_hackathon.model.entity.Product;
import liliana.java_web_hackathon.model.service.CloudinaryService;
import liliana.java_web_hackathon.model.service.category.CategoryServiceImpl;
import liliana.java_web_hackathon.model.service.product.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductServiceImpl productService;
    @Autowired
    private CloudinaryService cloudinaryService;
    @Autowired
    private CategoryServiceImpl categoryService;

    @GetMapping("/products")
    public String products(Model model) {
        model.addAttribute("products", productService.getAll());
        return "product/showProducts";
    }

    @GetMapping("/product/add")
    public String showFormAddProduct(Model model) {
        model.addAttribute("product", new Product());
        return "product/addProduct";
    }

    @PostMapping("/product/add")
    public String processAddProduct(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "product/addProduct";
        }
        MultipartFile file = product.getFile();
        try {
            String url = cloudinaryService.uploadFile(file);
            model.addAttribute("url", url);
            product.setImg_url(url);
            productService.save(product);

            model.addAttribute("product", product);
            model.addAttribute("categories", categoryService.getAll());
            return "product/showProducts";

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("product/delete/{id}")
    public String deleteProduct(@PathVariable("id") int id) {
        productService.delete(id);
        return "redirect:/products";
    }

    @GetMapping("/products/search")
    public String searchProducts(@RequestParam("keyword") String keyword, Model model) {
        List<Product> products = productService.getByName(keyword);
        model.addAttribute("products", products);
        return "product/showProducts";
    }


}
