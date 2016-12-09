package com.revature.ers.data;

import com.revature.ers.ResourceHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
interface DAO<E> extends ResourceHelper {
    /**
     * Method for inserting a new record to a table
     * @param object
     * @throws SQLException
     */
    void insert(E object) throws SQLException;
    /**
     * Method for querying all records from a table
     * @return List of Java representation/Objects of the records of that table
     * @throws SQLException
     */
    List<E> queryAll() throws SQLException;

    /**
     * Method that queries a single record by its id
     * @param id
     * @return Java representation/Object of that record
     * @throws SQLException
     */
    E queryById(int id) throws SQLException;

    /**
     * Gets the next id for a new record
     * @return the new id
     * @throws SQLException
     */
    int getId() throws SQLException;

    /**
     * Populates a list with the result set
     * @param resultSet the result of the query
     * @param list list that is being populated
     * @throws SQLException
     */
    void mapRows(ResultSet resultSet, List<E> list) throws SQLException;
}
