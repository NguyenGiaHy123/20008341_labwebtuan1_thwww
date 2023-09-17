package com.example.lab_week_tuan1.repositories;

import com.example.lab_week_tuan1.connectdb.ConnectDB;
import com.example.lab_week_tuan1.models.Account;
import com.example.lab_week_tuan1.models.Status;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AccountRepository {
    private Connection connection;
    public AccountRepository() throws Exception{
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://localhost:3306/mydb?createDatabaseIfNotExist=true";
        Connection connection = DriverManager.getConnection(url, "root", "root");
    }





    public boolean create(Account account) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "INSERT into account VALUES(?,?,?,?,?,?)";
            statement = con.prepareStatement(sql);
            statement.setString(1,account.getAccount_id());
            statement.setString(2, account.getFull_name());
            statement.setString(3, account.getPassword());
            statement.setString(4, account.getEmail());
            statement.setString(5, account.getPhone());
            Status accountStatus = account.getStatus();
            statement.setInt(6, accountStatus.getCode());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Account account) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "UPDATE Account SET full_name=?, email=?, password=?, phone=?, status=? WHERE account_id=?";
            statement = con.prepareStatement(sql);
            statement.setString(1, account.getFull_name());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getPassword());
            statement.setString(4, account.getPhone());
            Status accountStatus = account.getStatus();
            statement.setInt(5, accountStatus.getCode());
            statement.setString(6, account.getAccount_id());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            // e.printStackTrace();
            return false;
        }
    }

    public boolean delete(String accountId) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "DELETE FROM Account WHERE account_id=?";
            statement = con.prepareStatement(sql);
            statement.setString(1, accountId);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            // e.printStackTrace();
            return false;
        }
    }

    public List<Account> getAll() throws SQLException, ClassNotFoundException {
        List<Account> listAccount = new ArrayList<>();
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "Select * from Account";
            statement = con.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Status status = Status.fromCode(rs.getInt("status"));
                listAccount.add(new Account(rs.getString("account_id"), rs.getString("full_name"), rs.getString("password"),
                        rs.getString("email"), rs.getString("phone"), status));
            }

            return listAccount;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    public Optional<Account> logon(String email, String password) throws SQLException, ClassNotFoundException {
        Connection con;
        con = ConnectDB.getInstance().getConnection();
        PreparedStatement statement = null;
        try {
            String sql = "SELECT * FROM account WHERE email=? AND password=?";
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getString("account_id"));
                account.setFull_name(rs.getString("full_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setPhone(rs.getString("phone"));
                account.setStatus(Status.fromCode(rs.getInt("status")));

                return Optional.of(account);
            } else {
                return Optional.empty();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return Optional.empty();
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

}



