package main;

import dao.CustomerDAO;
import dao.Impl.CustomerDAOImpl;
import entity.Customers;
import exception.InvalidDataException;

import java.util.Scanner;

public class CustomerMenu {
    static CustomerDAO customerDao = new CustomerDAOImpl();

    public boolean customerSectionDetails(){
        Scanner sc =new Scanner(System.in);

        while(true){
            System.out.println("\n-----------------------Customer Section-----------------");
            System.out.println("1. View All Customers Details");
            System.out.println("2. View Particular Customer Details By ID");
            System.out.println("3.  Create New  User");
            System.out.println("4. To calculateTotalOrders");
            System.out.println("5. To UpdateCustomerInfo");
            System.out.println("6. Exit");
            System.out.println("Enter your choice: ");
            int customerChoice = sc.nextInt();
            switch (customerChoice) {
                case 1:
                    customerDao.viewAllCustomer();
                    break;
                case 2:
                    System.out.println("Enter CustomerID");
                    int id = sc.nextInt();
                    customerDao.getCustomerDetails(id);
                    break;
                case 3:
                    Customers customers = new Customers();
                    System.out.println("Enter CustomerId: ");
                    customers.setCustomerID(sc.nextInt());
                    System.out.println("Enter First Name: ");
                    customers.setFirstName(sc.next());
                    System.out.println("Enter Last Name: ");
                    customers.setLastName(sc.next());
                    System.out.println("Enter Email: ");
                    customers.setEmail(sc.next());
                    System.out.println("Enter Phone: ");
                    customers.setPhone(sc.next());
                    System.out.println("Enter Address: ");
                    customers.setAddress(sc.next());
                    try {
                        customerDao.createNewCustomer(customers);
                    } catch (InvalidDataException e) {
                        e.printStackTrace();
                    }
                    break;

                case 4:
                    System.out.println("Enter the Customer Id: ");
                    int customer_order = sc.nextInt();
                    System.out.println("Total Orders are : " + customerDao.calculateTotalOrders(customer_order));
                    break;
                case 5:
                    Customers updateCustomers = new Customers();
                    System.out.println("Enter CustomerId You Want To Update: ");
                    updateCustomers.setCustomerID(sc.nextInt());
                    System.out.println("Enter First Name: ");
                    updateCustomers.setFirstName(sc.next());

                    System.out.println("Enter Last Name: ");
                    updateCustomers.setLastName(sc.next());

                    System.out.println("Enter Email: ");
                    updateCustomers.setEmail(sc.next());

                    System.out.println("Enter Phone: ");
                    updateCustomers.setPhone(sc.next());

                    System.out.println("Enter Address: ");
                    updateCustomers.setAddress(sc.next());
                    customerDao.updateCustomerInfo(updateCustomers);
                    break;
                case 6:
                    System.out.println("Returning to Main Section.");
                    return false;
                default:
                    System.out.println("Invalid choice. Please enter a number between 1 and 6.");

            }
        }
    }
}
