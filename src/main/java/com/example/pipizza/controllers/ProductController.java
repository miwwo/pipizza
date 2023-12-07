package com.example.pipizza.controllers;

import com.example.pipizza.models.Product;
import com.example.pipizza.services.ProductService;
import com.example.pipizza.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final UserService userService;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("products", productService.listProducts(title));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "products";
    }

    @GetMapping("/menu/product/{id}")
    public String productInfo(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

}
