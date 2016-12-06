package com.ers.daos;

import com.ers.DAO;
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
public class UserRoleDAO implements DAO<UserRole>{
    Connection connection;

    public UserRoleDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(UserRole object) throws SQLException {

    }

    public List<UserRole> queryAll() throws SQLException {
        return null;
    }

    public UserRole queryById(int id) throws SQLException {
        try{
            String sql = "SELECT * FROM "+constants.getString("userRoleTableName")+" WHERE "+
                    constants.getString("userRoleId")+"="+id;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery(sql);
            List<UserRole> userRoleList = new ArrayList<UserRole>();
            mapRows(resultSet,userRoleList);
            return userRoleList.get(0);
        }finally {
            connection.close();
        }

    }

    public int getId() throws SQLException {
        return 0;
    }

    public void mapRows(ResultSet resultSet, List<UserRole> list) throws SQLException {
        while(resultSet.next()){
            UserRole userRole = new UserRole(
                    resultSet.getInt(1),
                    resultSet.getString(2)
            );
            list.add(userRole);
        }
    }
}
