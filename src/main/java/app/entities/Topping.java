package app.entities;

public class Topping {

    private int toppingID;
    private String name;
    private int price;

    public Topping(int toppingID, String name, int price) {
        this.toppingID = toppingID;
        this.name = name;
        this.price = price;
    }

    public int getToppingID() {
        return toppingID;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }
}
