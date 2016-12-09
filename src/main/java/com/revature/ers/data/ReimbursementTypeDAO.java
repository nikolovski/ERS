package com.revature.ers.data;

import com.revature.ers.beans.ReimbursementType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
class ReimbursementTypeDAO implements DAO<ReimbursementType>{
    Connection connection;

    ReimbursementTypeDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(ReimbursementType object) throws SQLException {
        String sql = "INSERT INTO " + reimbursementTypeTableName + " VALUES (?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, getId());
        preparedStatement.setString(2, object.getType());
        preparedStatement.executeUpdate();
    }

    public List<ReimbursementType> queryAll() throws SQLException {
        List<ReimbursementType> typeList = new ArrayList<ReimbursementType>();
        PreparedStatement preparedStatement = connection.prepareStatement(getAllReimbursementTypes);
        ResultSet resultSet = preparedStatement.executeQuery();
        mapRows(resultSet,typeList);
        return typeList;
    }

    public ReimbursementType queryById(int id) throws SQLException {
        String sql = getAllReimbursementTypes + " WHERE " + reimbursementTypeId + "= ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<ReimbursementType> userList = new ArrayList<ReimbursementType>();
        mapRows(resultSet, userList);
        return userList.get(0);
    }

    public int getId() throws SQLException {
        String sql = "SELECT MAX(" + reimbursementTypeId + ") FROM " + reimbursementTypeTableName;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
             return resultSet.getInt(1) + 1;
        } else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<ReimbursementType> list) throws SQLException {
        while (resultSet.next()){
            ReimbursementType type = new ReimbursementType(
                resultSet.getInt(reimbursementTypeId),
                resultSet.getString(reimbursementType)
            );
            list.add(type);
        }
    }
}
