package com.ers.daos;

import com.ers.DAO;
import com.ers.entities.User;
import com.ers.entities.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        String sql = "INSERT INTO " + userTableName + " VALUES (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, getId());
        preparedStatement.setString(2, object.getUsername());
        preparedStatement.setString(3, object.getPassword());
        preparedStatement.setString(4, object.getFirstName());
        preparedStatement.setString(5, object.getLastName());
        preparedStatement.setString(6, object.getEmail());
        preparedStatement.setInt(7, object.getRole().getId());
        preparedStatement.executeUpdate();
    }

    public List<User> queryAll() throws SQLException {
        List<User> userList = new ArrayList<User>();
        String sql = getAllUsers;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        mapRows(resultSet, userList);
        return userList;

    }

    public User queryById(int id) throws SQLException {
        String sql = getAllUsers + " WHERE " + userId + "= ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<User> userList = new ArrayList<User>();
        mapRows(resultSet, userList);
        return userList.get(0);
    }

    public int getId() throws SQLException {
        int id;
        String sql = "SELECT MAX(" + userId + ") FROM " + userTableName;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            id = resultSet.getInt(1) + 1;
            return id;
        } else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<User> list) throws SQLException {
        while (resultSet.next()) {
            User user = new User(
                    resultSet.getInt(userId),
                    resultSet.getString(userUsername),
                    resultSet.getString(userPassword),
                    resultSet.getString(userFirstName),
                    resultSet.getString(userLastName),
                    resultSet.getString(userEmail),
                    new UserRole(
                            resultSet.getInt(userRoleId),
                            resultSet.getString(userRole)
                    )
            );
            list.add(user);
        }
    }
}
