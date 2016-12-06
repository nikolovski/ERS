package com.ers.daos;

import com.ers.DAO;
import com.ers.entities.ReimbursementStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public class ReimbursementStatusDAO implements DAO<ReimbursementStatus> {
    private Connection connection;

    public ReimbursementStatusDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(ReimbursementStatus object) throws SQLException {
        String sql = "INSERT INTO "+constants.getString("reimbursementStatusTableName")+
                " VALUES (?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,getId()+1);
        preparedStatement.setString(2,object.getStatus());
        preparedStatement.executeUpdate();
    }

    public List<ReimbursementStatus> queryAll() throws SQLException {
        try{
            List<ReimbursementStatus> reimbursementStatusList = new ArrayList<ReimbursementStatus>();
            //String sql = "SELECT * FROM "+constants.getString("reimbursementStatusTableName");
            String sql = "SELECT * FROM ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,constants.getString("reimbursementStatusTableName"));
            ResultSet resultSet = preparedStatement.executeQuery(sql);
            mapRows(resultSet,reimbursementStatusList);
            connection.commit();
            return reimbursementStatusList;
        }finally {
            connection.close();
        }

    }

    public ReimbursementStatus queryById(int id) throws SQLException {
        try{
            String sql = "SELECT * FROM "+constants.getString("reimbursementStatusTableName")+" WHERE "+
                    constants.getString("reimbursementStatusId")+"="+id;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery(sql);
            List<ReimbursementStatus> reimbursementList = new ArrayList<ReimbursementStatus>();
            mapRows(resultSet,reimbursementList);
            resultSet.close();
            return reimbursementList.get(0);
        }finally {
            connection.close();
        }
    }

    public int getId() throws SQLException {
        int id;
        String sql = "SELECT MAX("+constants.getString("reimbursementStatusId")+") FROM "+constants.getString("reimbursementTableName");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        if(resultSet.next()){
            id = resultSet.getInt(1);
            resultSet.close();
            return id;
        }
        else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<ReimbursementStatus> list) throws SQLException {
        while(resultSet.next()){
            ReimbursementStatus reimbursementStatus = new ReimbursementStatus(
                    resultSet.getInt(1),
                    resultSet.getString(2)
            );
            list.add(reimbursementStatus);
        }
    }
}
