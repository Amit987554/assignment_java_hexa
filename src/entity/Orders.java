package entity;

import java.util.Date;

public class Orders {
    private int orderID;
    private Customers customers;
    private Date orderDate;
    private double totalAmount;

// Constructor
    public Orders(){
        super();
    }
    public Orders(int orderID, Customers customers, Date orderDate, double totalAmount){
        this.orderID = orderID;
        this.customers = customers;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }

// getters and setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Customers getCustomer() {
        return customers;
    }

    public void setCustomer(Customers customers) {
        this.customers = customers;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

}




