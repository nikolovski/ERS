package com.ers.data;

import com.ers.beans.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
class UserRoleDAO implements DAO<UserRole> {
    Connection connection;

    UserRoleDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(UserRole object) throws SQLException {
        String sql = "INSERT INTO " + userRoleTableName + " VALUES (?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, getId());
        preparedStatement.setString(2, object.getRole());
        preparedStatement.executeUpdate();
    }

    public List<UserRole> queryAll() throws SQLException {
        List<UserRole> typeList = new ArrayList<UserRole>();
        PreparedStatement preparedStatement = connection.prepareStatement(getAllUserRoles);
        ResultSet resultSet = preparedStatement.executeQuery();
        mapRows(resultSet, typeList);
        return typeList;
    }

    public UserRole queryById(int id) throws SQLException {
        List<UserRole> userRoleList = new ArrayList<UserRole>();
        String sql = getAllUserRoles + " WHERE " + userRoleId + "= ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        mapRows(resultSet, userRoleList);
        return userRoleList.get(0);

    }

    public int getId() throws SQLException {
        String sql = "SELECT MAX(" + userRoleId + ") FROM " + userRoleTableName;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt(1) + 1;
        } else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<UserRole> list) throws SQLException {
        while (resultSet.next()) {
            UserRole role = new UserRole(
                    resultSet.getInt(userRoleId),
                    resultSet.getString(userRole)
            );
            list.add(role);
        }
    }
}
