package entity;

public class OrderDetails {
    private int orderDetailID;
    private Orders orders;
    private Products products;
    private int quantity;

// Constructor
    public OrderDetails(){
        super();
    }
    public OrderDetails(int orderDetailID, Orders orders, Products products, int quantity){
        this.orderDetailID = orderDetailID;
        this.orders = orders;
        this.products = products;
        this.quantity = quantity;
    }

    // getter and setter
    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public Orders getOrder() {
        return orders;
    }

    public void setOrder(Orders orders) {
        this.orders = orders;
    }

    public Products getProduct() {
        return products;
    }

    public void setProduct(Products products) {
        this.products = products;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
