package com.example.pipizza.controllers;

import com.example.pipizza.models.Product;
import com.example.pipizza.services.AdminService;
import com.example.pipizza.services.ProductService;
import com.example.pipizza.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final AdminService adminService;
    private final ProductService productService;

    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("users", userService.list());
        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        adminService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/getNewProductForm")
    public String getNewProductForm(Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("bindingResult", null);
        return "newProductForm";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1,
                                @Valid Product product,
                                BindingResult bindingResult, Model model, Principal principal) throws IOException {
        if (bindingResult.hasErrors() || file1.isEmpty()) {
            if (file1.isEmpty())
                model.addAttribute("picError", "Укажите картинку продукта");
            if (bindingResult.hasErrors()) {
                model.addAttribute("bindingResult", bindingResult);
            }
            model.addAttribute("user", userService.getUserByPrincipal(principal));
            return "newProductForm";
        }
        productService.saveProduct(product, file1);
        return "redirect:/";
    }

    @PostMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.removeFromMenu(id);
        return "redirect:/";
    }
}
