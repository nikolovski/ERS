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
        String sql = "INSERT INTO "+constants.getString("userTableName")+
                " VALUES (?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,getId()+1);
        preparedStatement.setString(2,object.getUsername());
        preparedStatement.setString(3,object.getPassword());
        preparedStatement.setString(4,object.getFirstName());
        preparedStatement.setString(5,object.getLastName());
        preparedStatement.setString(6,object.getEmail());
        preparedStatement.setInt(7,object.getRole().getUserRoleID());
        preparedStatement.executeUpdate();
    }

    public List<User> queryAll() throws SQLException {
        List<User> userList = new ArrayList<User>();
        String sql = "SELECT * FROM "+constants.getString("userTableName");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        mapRows(resultSet,userList);
        return userList;

    }

    public User queryById(int id) throws SQLException {
        String sql = "SELECT * FROM "+constants.getString("userTableName")+" WHERE "+
                constants.getString("userId")+"="+id;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        List<User> userList = new ArrayList<User>();
        mapRows(resultSet,userList);
        connection.commit();
        return userList.get(0);
    }

    public int getId() throws SQLException {
        int id;
        String sql = "SELECT MAX("+constants.getString("userId")+") FROM "+constants.getString("userTableName");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        if(resultSet.next()) {
            id = resultSet.getInt(1);
            return id;
        }
        else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<User> list) throws SQLException {
        while(resultSet.next()){
            UserRole userRole = new UserRoleDAO(connection).queryById(resultSet.getInt(7));
            User user = new User(
                    resultSet.getInt(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),
                    resultSet.getString(6),
                    userRole
            );
            list.add(user);
        }
    }
}
