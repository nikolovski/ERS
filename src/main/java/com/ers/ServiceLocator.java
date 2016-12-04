package com.ers;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * Created by Martino Nikolovski on 12/3/16.
 */
public class ServiceLocator {
    private static DataSource ers;
    private static Properties properties;
    static {
        InputStream stream = ServiceLocator.class.getClassLoader().getResourceAsStream("constants.properties");
        properties = new Properties();
        try{
            properties.load(stream);
        }catch (IOException e){
            e.getCause();
            System.out.println("Cannot find the properties file!");
        }
        finally {
            try {
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Method that looks up the ERS data source
     * @return Reference to ERS data source if found
     */
    private static DataSource lookupERS(){
        try {
            Context context = new InitialContext(properties);
            DataSource dataSource = (DataSource) context.lookup(properties.getProperty("ersDB"));
            return dataSource;
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Method that assigns the data source to the ers class variable
     * @return Reference to the data source
     */
    public synchronized static DataSource getERSDatabase(){
        if(ers == null) ers = lookupERS();
        return ers;
    }
}
