package com.ers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public interface DAO<E> extends ResourceHelper{
    void insert(E object) throws SQLException;
    List<E> queryAll() throws SQLException;
    E queryById(int id) throws SQLException;
    int getId() throws SQLException;
    void mapRows(ResultSet resultSet, List<E> list) throws SQLException;
}
