package com.example.lab_week_tuan1.controlers;

import com.example.lab_week_tuan1.models.Account;
import com.example.lab_week_tuan1.models.Status;
import com.example.lab_week_tuan1.repositories.AccountRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Optional;

@WebServlet(name = "ControllSerlet", value = "/loginserlet")
public class ControllSerlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World hy dep trai haha!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        try {
            AccountRepository accountRepository=new AccountRepository();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        AccountRepository accountRepository;

        try {
            accountRepository = new AccountRepository();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if ("logon".equals(action)) {
            handleLogon(req, resp, accountRepository);
        } else if ("register".equals(action)) {
            handleRegistration(req, resp, accountRepository);
        }
    }

    private void handleLogon(HttpServletRequest req, HttpServletResponse resp, AccountRepository accountRepository)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Optional<Account> account = accountRepository.logon(email, password);

            if (account.isPresent()) {
                req.setAttribute("account", account.get());
                RequestDispatcher dispatcher = req.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward(req, resp);
            } else {
                showErrorAlert(resp, "Account does not exist", "index.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void handleRegistration(HttpServletRequest req, HttpServletResponse resp, AccountRepository accountRepository)
            throws ServletException, IOException {
        Account account = new Account();
        account.setPassword(req.getParameter("password"));
        account.setFull_name(req.getParameter("fullName"));
        account.setEmail(req.getParameter("email"));
        account.setPhone(req.getParameter("phone"));
        Status status = Status.valueOf(req.getParameter("status"));
        account.setStatus(status);

        boolean registrationSuccess = false;

        try {
            registrationSuccess = accountRepository.create(account);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if (registrationSuccess) {
            showSuccessAlert(resp, "Registration success", "index.jsp");
        } else {
            showErrorAlert(resp, "Registration failed", "register.jsp");
        }
    }

    private void showErrorAlert(HttpServletResponse resp, String message, String redirectUrl) throws IOException {
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("location='" + redirectUrl + "';");
        out.println("</script>");
    }

    private void showSuccessAlert(HttpServletResponse resp, String message, String redirectUrl) throws IOException {
        showErrorAlert(resp, message, redirectUrl);
    }


    public void destroy() {
    }
}