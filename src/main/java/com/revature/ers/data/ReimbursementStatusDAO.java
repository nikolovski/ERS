package com.revature.ers.data;

import com.revature.ers.beans.ReimbursementStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
class ReimbursementStatusDAO implements DAO<ReimbursementStatus> {
    private Connection connection;

    ReimbursementStatusDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(ReimbursementStatus object) throws SQLException {
    }

    public List<ReimbursementStatus> queryAll() throws SQLException {
        List<ReimbursementStatus> reimbursementStatusList = new ArrayList<ReimbursementStatus>();
        PreparedStatement preparedStatement = connection.prepareStatement(getAllReimbursementStatuses);
        ResultSet resultSet = preparedStatement.executeQuery();
        mapRows(resultSet, reimbursementStatusList);
        return reimbursementStatusList;
    }

    public ReimbursementStatus queryById(int id) throws SQLException {
        String sql = getAllReimbursementStatuses + " WHERE " + reimbursementStatusId + "= ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<ReimbursementStatus> reimbursementList = new ArrayList<ReimbursementStatus>();
        mapRows(resultSet, reimbursementList);
        resultSet.close();
        return reimbursementList.get(0);
    }

    public int getId() throws SQLException {
        int id = 0;
        String sql = "SELECT MAX(" + reimbursementStatusId + ") FROM " + reimbursementStatusTableName;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) id = resultSet.getInt(1) + 1;
        return id;
    }

    public void mapRows(ResultSet resultSet, List<ReimbursementStatus> list) throws SQLException {
        while (resultSet.next()) {
            ReimbursementStatus reimbursementStatus = new ReimbursementStatus(
                    resultSet.getInt(1),
                    resultSet.getString(2)
            );
            list.add(reimbursementStatus);
        }
    }
}
