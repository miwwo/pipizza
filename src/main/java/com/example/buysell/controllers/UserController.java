package com.example.buysell.controllers;

import com.example.buysell.models.Product;
import com.example.buysell.models.User;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/account")
    public String userInfo(Model model, Principal principal) {
            model.addAttribute("user", userService.getUserByPrincipal(principal));
            model.addAttribute("orders", userService.getUserByPrincipal(principal).getOrders());
            return "account";
    }

    @PostMapping("/user/cart/add/product/{id}")
    public String addProduct(@PathVariable Long id, Principal principal) throws IOException {
        if (principal == null)
            return "redirect:/login";
        User user =  userService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        userService.addProduct(user,product);
        userService.saveUser(userService.getUserByPrincipal(principal));
        return "redirect:/";
    }
    @PostMapping("/user/cart/remove/product/{id}")
    public String removeProduct(@PathVariable Long id, Principal principal) throws IOException {
        User user =  userService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        userService.removeProduct(user, product);
        userService.saveUser(userService.getUserByPrincipal(principal));
        return "redirect:/user/cart";
    }

    @GetMapping("/user/cart")
    public String getCart(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("cart_products", user.getCart());
        return "cart";
    }

}
