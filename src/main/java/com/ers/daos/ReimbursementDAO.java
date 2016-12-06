package com.ers.daos;

import com.ers.DAO;
import com.ers.entities.Reimbursement;
import com.ers.entities.ReimbursementStatus;
import com.ers.entities.ReimbursementType;
import com.ers.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public class ReimbursementDAO implements DAO<Reimbursement>{
    private Connection connection;

    public ReimbursementDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(Reimbursement object) throws SQLException {
        String sql = "INSERT INTO "+constants.getString("reimbursementTableName")+
                " VALUES (?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,getId()+1);
        preparedStatement.setDouble(2,object.getReimbAmount());
        preparedStatement.setTimestamp(3, object.getReimbSubmitted());
        preparedStatement.setTimestamp(4, object.getReimbResolved());
        preparedStatement.setString(5, object.getReimbDescription());
        preparedStatement.setBlob(6, object.getReimbReceipt());
        preparedStatement.setInt(7, object.getReimbAuthor().getUserId());
        preparedStatement.setInt(8, object.getReimbResolver().getUserId());
        preparedStatement.setInt(9, object.getReimbStatus().getStatusId());
        preparedStatement.setInt(10, object.getReimbType().getTypeId());
        preparedStatement.executeUpdate();
    }

    public List<Reimbursement> queryAll() throws SQLException {
        List<Reimbursement> reimbursementList = new ArrayList<Reimbursement>();
        String sql = "SELECT * FROM "+constants.getString("reimbursementTableName");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        mapRows(resultSet,reimbursementList);
        return reimbursementList;
    }

    public Reimbursement queryById(int id) throws SQLException {
        String sql = "SELECT * FROM "+constants.getString("reimbursementTableName")+" WHERE "+
                constants.getString("reimbursementId")+"="+id;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        List<Reimbursement> reimbursementList = new ArrayList<Reimbursement>();
        mapRows(resultSet,reimbursementList);
        return reimbursementList.get(0);
    }

    public int getId() throws SQLException {
        String sql = "SELECT MAX("+constants.getString("reimbursementId")+") FROM "+constants.getString("reimbursementTableName");
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery(sql);
        if(resultSet.next()) return resultSet.getInt(1);
        else throw new SQLException();
    }

    public void mapRows(ResultSet resultSet, List<Reimbursement> list) throws SQLException {
        while(resultSet.next()){
            //TODO change Type object
            User author = new UserDAO(connection).queryById(resultSet.getInt(7));
            User resolver = new UserDAO(connection).queryById(resultSet.getInt(8));
            ReimbursementStatus status = new ReimbursementStatusDAO(connection).queryById(resultSet.getInt(9));
            ReimbursementType type = new ReimbursementType();
            type.setTypeId(resultSet.getInt(10));
            Reimbursement reimbursement = new Reimbursement(
                    resultSet.getInt(1),
                    resultSet.getInt(2),
                    resultSet.getTimestamp(3),
                    resultSet.getTimestamp(4),
                    resultSet.getString(5),
                    resultSet.getBlob(6),
                    author,
                    resolver,
                    status,
                    type
            );
            list.add(reimbursement);
        }
    }
}
