package app.entities;

public class Bottom {

    private int bottomID;
    private String name;
    private int price;

    public Bottom(int bottomID, String name, int price) {
        this.bottomID = bottomID;
        this.name = name;
        this.price = price;
    }

    public int getBottomID() {
        return bottomID;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }
}
