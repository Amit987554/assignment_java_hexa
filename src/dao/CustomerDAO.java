package dao;

import entity.Customers;

public interface CustomerDAO {
    public void viewAllCustomer();
    public int calculateTotalOrders(int customerID);
    public void getCustomerDetails(int customerID);
    public void updateCustomerInfo(Customers customers);
    public void createNewCustomer(Customers customers);

}
