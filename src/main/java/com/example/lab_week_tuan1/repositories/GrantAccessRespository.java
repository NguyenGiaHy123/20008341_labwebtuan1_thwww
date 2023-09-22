package com.example.lab_week_tuan1.repositories;

import com.example.lab_week_tuan1.connectdb.ConnectDB;
import com.example.lab_week_tuan1.models.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GrantAccessRespository {
    public GrantAccess checkAccount(String accountId) throws SQLException, ClassNotFoundException {
        Connection con;
        con= ConnectDB.getInstance().getConnection();
        PreparedStatement statement=null;
        try{
            String sql="SELECT *FROM grant_access AS gr JOIN role AS ro ON gr.role_id=ro.role_id JOIN account as ac\n" +
                    " ON gr.account_id=ac.account_id WHERE gr.account_id =?";
            statement = con.prepareStatement(sql);
            statement.setString(1, accountId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Account account = new Account(rs.getString("account_id"), rs.getString("full_name"), rs.getString("password"),
                        rs.getString("email"), rs.getString("phone"), Status.fromCode(rs.getInt("status")));
                Role role = new Role(rs.getString("role_id"), rs.getString("role_name"), rs.getString("description"),
                        Status.fromCode(rs.getInt("status")));
                return new GrantAccess(role, account, Grant.fromCode(rs.getInt("is_grant")), rs.getString("note"));
            }
            return null;
        }
        catch (IllegalAccessException e) {
            throw new RuntimeException(e);

        }



    }
}
