package app.entities;

public class Order {

    private int orderID;
    private int customerID;

    public Order(int orderID, int customerID) {
        this.orderID = orderID;
        this.customerID = customerID;
    }

    public int getOrderID() {
        return orderID;
    }

    public int getCustomerID() {
        return customerID;
    }
}
