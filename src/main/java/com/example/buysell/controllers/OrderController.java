package com.example.buysell.controllers;

import com.example.buysell.models.Order;
import com.example.buysell.models.Product;
import com.example.buysell.services.OrderService;
import com.example.buysell.services.ProductService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;

    @GetMapping("/orders")
    public String orders(Principal principal, Model model) {
        model.addAttribute("orders", orderService.listOrder());
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "myPage";
    }
    @GetMapping("/order/{id}")
    public String orderInfo(@PathVariable Long id, Model model) {
        Order order = orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "order-info";
    }

    /*@PostMapping("/order/create")
    public String createOrder(Product product, Principal principal) throws IOException {
        orderService.saveOrder(product);
        return "redirect:/";
    }*/

    @PostMapping("/order/delete/{id}")
    public String deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        return "redirect:/";
    }
}
