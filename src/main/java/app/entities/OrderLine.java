package app.entities;

public class OrderLine {

    private int orderlineID;
    private int quantity;
    private int orderID;
    private int bottomID;
    private int toppingID;

    public OrderLine(int orderlineID, int quantity, int orderID, int bottomID, int toppingID) {
        this.orderlineID = orderlineID;
        this.quantity = quantity;
        this.orderID = orderID;
        this.bottomID = bottomID;
        this.toppingID = toppingID;
    }

    public int getOrderlineID() {
        return orderlineID;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public int getBottomID() {
        return bottomID;
    }

    public int getToppingID() {
        return toppingID;
    }
}
