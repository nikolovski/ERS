package com.ers.daos;

import com.ers.DAO;
import com.ers.entities.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public class UserDAO implements DAO<User> {
    Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(User object) throws SQLException {

    }

    public List<User> queryAll() throws SQLException {
        return null;
    }

    public User queryById(int id) throws SQLException {
        return null;
    }

    public int getId() throws SQLException {
        return 0;
    }

    public void mapRows(ResultSet resultSet, List<User> list) throws SQLException {

    }
}
