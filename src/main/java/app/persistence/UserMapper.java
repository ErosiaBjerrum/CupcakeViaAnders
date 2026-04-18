package app.persistence;

import app.entities.User;
import org.postgresql.jdbc2.optional.ConnectionPool;

import java.sql.SQLException;

public class UserMapper {

    // Ting til user: ID, Brugernavn, Password og Saldo
    private final ConnectionPool connectionPool;

    public UserMapper(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
    }

    public String createUser(User user) throws SQLException{

        String sql = "INSERT INTO user (user_id, ";



    return 0;
    }






}
