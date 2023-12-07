package com.example.pipizza.controllers;

import com.example.pipizza.models.Product;
import com.example.pipizza.models.User;
import com.example.pipizza.services.ProductService;
import com.example.pipizza.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @GetMapping("/login-error")
    public String login(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        String errorMessage = null;
        if (session != null) {
            AuthenticationException ex = (AuthenticationException) session
                    .getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
            if (ex != null) {
                errorMessage = ex.getMessage();
            }
        }
        model.addAttribute("errorMessage", "Введены неверные данные");
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
    public String userAccount(Model model, Principal principal) {
            model.addAttribute("user", userService.getUserByPrincipal(principal));
            model.addAttribute("orders", userService.getUserByPrincipal(principal).getOrders());
            return "account";
    }
    @PostMapping("/cart/add/product/{id}")
    public String addProduct(@PathVariable Long id, Principal principal) throws IOException {
        if (principal == null)
            return "redirect:/login";
        User user =  userService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        userService.addProduct(user,product);
        userService.saveUser(userService.getUserByPrincipal(principal));
        return "redirect:/";
    }
    @PostMapping("/cart/remove/product/{id}")
    public String removeProduct(@PathVariable Long id, Principal principal) throws IOException {
        User user =  userService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        userService.removeProduct(user, product);
        userService.saveUser(userService.getUserByPrincipal(principal));
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String getCart(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("cart_products", user.getCart());
        return "cart";
    }

}
