package vn.iostar.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.model.User;	

import java.io.IOException;
import java.io.PrintWriter;

@SuppressWarnings("serial")
@WebServlet(urlPatterns="/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Kiểm tra xem có thông báo đăng ký thành công hay không (qua parameter hoặc attribute)
        String successMsg = request.getParameter("success");
        if (successMsg != null && successMsg.equals("register")) {
            out.println("<h2 style='color:green;'>Đăng ký tài khoản thành công! Bạn có thể đăng nhập ngay.</h2>");
        }

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            User user = (User) session.getAttribute("account");
            out.println("<h1>Chào mừng " + user.getUserName() + "!</h1>");
        } else {
            out.println("<h1>Bạn chưa đăng nhập!</h1>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
