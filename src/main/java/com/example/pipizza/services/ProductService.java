package com.example.pipizza.services;

import com.example.pipizza.models.Image;
import com.example.pipizza.models.Product;
import com.example.pipizza.repositories.ProductRepository;
import com.example.pipizza.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> listProducts(String title, String sortBy) {
        if (title != null && !title.isEmpty()) {
            if(sortBy != null &&!sortBy.isEmpty()) {
                List<Product> products = productRepository.findByTitleContaining(title);
                sortProductsBy(sortBy, products);
                return products;
            }
                return productRepository.findByTitleContaining(title);
        } else {
            if(sortBy != null && !sortBy.isEmpty()) {
                List<Product> products = productRepository.findAll();
                sortProductsBy(sortBy, products);
                return products;
            }
            return productRepository.findAll();
        }
    }

    public void sortProductsBy(String sortBy, List<Product> products){
        if ("price_asc".equals(sortBy)) {
            products.sort(Comparator.comparing(Product::getPrice));
        } else if ("price_desc".equals(sortBy)) {
            products.sort(Comparator.comparing(Product::getPrice).reversed());
        }
    }

    public void saveProduct(Product product, MultipartFile file1) throws IOException {
        Image image1;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        log.info("Saving new Product. Title: {}; ", product.getTitle());
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productRepository.save(product);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void removeFromMenu(Long id) {
        Product product = getProductById(id);
        product.setMenuComponent(false);
        productRepository.save(product);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
}
