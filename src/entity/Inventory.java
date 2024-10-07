package entity;

public class Inventory {
    private int inventoryID;
    private Products products;
    private int quantityInStock;

    // Constructor
    public Inventory(){
        super();
    }

    public Inventory(int inventoryID, Products products, int quantityInStock) {
        this.inventoryID = inventoryID;
        this.products = products;
        this.quantityInStock = quantityInStock;
    }
// getter and setter
    public int getInventoryID() {
        return inventoryID;
    }

    public void setInventoryID(int inventoryID) {
        this.inventoryID = inventoryID;
    }

    public Products getProduct() {
        return products;
    }

    public void setProduct(Products products) {
        this.products = products;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }
}