package com.example.lab_week_tuan1.models;
import java.time.LocalDate;
public class Logs {
    private int id;
    private Account account;
    private LocalDate login_time;
    private LocalDate logout_time;
    private String notes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount_id() {
        return account;
    }

    public void setAccount_id(String account_id) {
        this.account = account;
    }

    public LocalDate getLogin_time() {
        return login_time;
    }

    public void setLogin_time(LocalDate login_time) {
        this.login_time = login_time;
    }

    public LocalDate getLogout_time() {
        return logout_time;
    }

    public void setLogout_time(LocalDate logout_time) {
        this.logout_time = logout_time;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Logs() {
    }

    public Logs(Account account, LocalDate login_time, LocalDate logout_time, String notes) {
        this.id = id;
        this.account = account;
        this.login_time = login_time;
        this.logout_time = logout_time;
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Logs{" +
                "id=" + id +
                ", account=" + account +
                ", login_time=" + login_time +
                ", logout_time=" + logout_time +
                ", notes='" + notes + '\'' +
                '}';
    }
}
