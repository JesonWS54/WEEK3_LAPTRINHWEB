package vn.iostar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iostar.model.User;
import vn.iostar.service.UserService;
import vn.iostar.service.UserServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        
        String email = req.getParameter("email");
        String alertMsg = "";
        
        if (email == null || email.isEmpty()) {
            alertMsg = "Vui lòng nhập địa chỉ email";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
            return;
        }
        
        User user = userService.getPasswordByEmail(email);
        
        if (user != null) {
            String password = user.getPassWord();
            String successMsg = "Mật khẩu của tài khoản " + email + " là: " + password;
            req.setAttribute("success", successMsg);
            req.setAttribute("foundPassword", password);
            req.setAttribute("foundEmail", email);
        } else {
            alertMsg = "Email không tồn tại trong hệ thống";
            req.setAttribute("alert", alertMsg);
        }
        
        req.getRequestDispatcher("/forgot-password.jsp").forward(req, resp);
    }
}