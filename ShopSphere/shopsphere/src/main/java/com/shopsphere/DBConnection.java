
package com.shopsphere;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/shopsphere";

    private static final String USER =
            System.getenv("SHOPSPHERE_DB_USER");

    private static final String PASSWORD =
            System.getenv("SHOPSPHERE_DB_PASSWORD");

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

        if (USER == null || PASSWORD == null) {
            throw new IllegalStateException(
                    "Database environment variables are not configured."
            );
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
