package dao;

import entity.Products;

public interface ProductDAO {
    public void getProductDetails(int productID);
    public void updateProductInfo(Products products);
    public boolean isProductInStock(int productID);
    public int getPrice(int productID);
}
