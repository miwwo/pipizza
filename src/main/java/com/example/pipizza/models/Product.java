package com.example.pipizza.models;

import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    @Column(name = "price")
    private int price;
    @Column(name = "menu_component")
    private boolean menuComponent = true;
    @Column()
    @NotNull
    @Min(value = 1, message = "Quantity must be greater than or equal to zero")
    private int quantity = 1;

    public Product(String title,
                   String description,
                   int price,
                   int quantity,
                   Long previewImageId,
                   boolean menuComponent) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.previewImageId = previewImageId;
        this.menuComponent = menuComponent;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "product")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;


    public void addImageToProduct(Image image) {
        image.setProduct(this);
        images.add(image);
    }
}
