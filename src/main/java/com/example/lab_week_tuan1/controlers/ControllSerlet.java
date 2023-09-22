package com.example.lab_week_tuan1.controlers;

import com.example.lab_week_tuan1.models.Account;
import com.example.lab_week_tuan1.models.GrantAccess;
import com.example.lab_week_tuan1.models.Status;
import com.example.lab_week_tuan1.repositories.AccountRepository;
import com.example.lab_week_tuan1.repositories.GrantAccessRespository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.checkerframework.checker.units.qual.A;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
            GrantAccessRespository gA=null;
            List <Account> listAccount=new ArrayList<>();
            GrantAccess grantAccessdelete=null;
            if(action.equals("logon")){
            Optional<Account> account=accountRepository.logon(req.getParameter("email"),req.getParameter("password"));

               if(account.isEmpty()){
                   PrintWriter out = resp.getWriter();
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('Account is not exist ,please register an acount ');");
                   out.println("location='index.jsp';");
                   out.println("</script>");
               }
               else{


                   gA=new GrantAccessRespository();
                   listAccount =accountRepository.getAll();

                   GrantAccess grantAccess=gA.checkAccount(account.get().getAccount_id());
                   if(grantAccess.getRole().getRole_id().equals("am")){
                       req.setAttribute("grantAccess",grantAccess);
                       req.setAttribute("listAccount",listAccount);

                       RequestDispatcher dispatcher=req.getRequestDispatcher("AdminDashBoard.jsp");
                       dispatcher.forward(req, resp);
                   }
                   else{
                       req.setAttribute("account",account.get());
                       RequestDispatcher dispatcher=req.getRequestDispatcher("dashboard.jsp");
                       dispatcher.forward(req, resp);
                   }
               }

           }

            else if(action.equals("register")){

                Account  ac=new Account();
                ac.setAccount_id(req.getParameter("accountId"));
                ac.setPassword(req.getParameter("password"));
                ac.setFull_name(req.getParameter("fullName"));
                ac.setEmail(req.getParameter("email"));
                ac.setPhone(req.getParameter("phone"));
                int statusCode = Integer.parseInt(req.getParameter("status"));
                Status status = Status.fromCode(statusCode);
                ac.setStatus(status);


                if(accountRepository.create(ac)){
                    PrintWriter out = resp.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('dang ky thanh cong ');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
                else{
                    PrintWriter out = resp.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('dang ky that bai');");
                    out.println("location='register.jsp';");
                    out.println("</script>");
                }
            } else if (action.equals("delete")) {
                if(accountRepository.delete(req.getParameter("account_id"))){
                    for(int i=0;i<listAccount.size();i++){
                        if(listAccount.get(i).getAccount_id().equals(req.getParameter("account_id"))){
                            listAccount.remove(i);
                            return ;
                        }
                    }
                    resp.sendRedirect("Success.jsp");

                }
                else{
                    resp.sendRedirect("editAccount.jsp");
                }



            }
            else if (action.equals("editredirect")) {

                Optional<Account> account=accountRepository.getById(req.getParameter("account_id"));

                req.setAttribute("account",account.get());
                RequestDispatcher dispatcher=req.getRequestDispatcher("editAccount.jsp");
                dispatcher.forward(req, resp);
            }
            else if(action.equals("edit")){
                Account  acupdate=new Account();
                acupdate.setAccount_id(req.getParameter("accountId"));
                acupdate.setPassword(req.getParameter("password"));
                acupdate.setFull_name(req.getParameter("fullName"));
                acupdate.setEmail(req.getParameter("email"));
                acupdate.setPhone(req.getParameter("phone"));
                int statusCode = Integer.parseInt(req.getParameter("status"));
                Status status = Status.fromCode(statusCode);
                acupdate.setStatus(status);
                System.out.println(acupdate);
                if(accountRepository.update(acupdate)){
                    PrintWriter out = resp.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('update thanh cong ');");
                    out.println("location='AdminDashBoard.jsp';");
                    out.println("</script>");
                }
                else{
                    PrintWriter out = resp.getWriter();
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('update that bai ');");
                    out.println("location='AdminDashBoard.jsp';");
                    out.println("</script>");
                }

            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}