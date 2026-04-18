package app.entities;

public class User {

    private int id;
    private String username;
    private String password;
    private int saldo;

    public User(int id, String username, String password, int saldo) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.saldo = saldo;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getSaldo() {
        return saldo;
    }
}
