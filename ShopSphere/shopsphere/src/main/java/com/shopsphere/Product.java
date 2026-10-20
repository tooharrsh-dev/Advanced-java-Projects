package com.shopsphere;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private String imageUrl;
    private int stock;

    public Product(int id, String name, String description,
                   double price, String imageUrl, int stock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public int getStock() {
        return stock;
    }
}
