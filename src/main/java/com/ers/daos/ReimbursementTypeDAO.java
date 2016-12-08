package com.ers.daos;

import com.ers.DAO;
import com.ers.entities.ReimbursementType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public class ReimbursementTypeDAO implements DAO<ReimbursementType>{
    public void insert(ReimbursementType object) throws SQLException {

    }

    public List<ReimbursementType> queryAll() throws SQLException {
        return null;
    }

    public ReimbursementType queryById(int id) throws SQLException {
        return null;
    }

    public int getId() throws SQLException {
        return 0;
    }

    public void mapRows(ResultSet resultSet, List<ReimbursementType> list) throws SQLException {

    }
}
