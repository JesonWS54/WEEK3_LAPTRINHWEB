package vn.iostar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = "/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Xóa session
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.removeAttribute("account");
            session.removeAttribute("username");
            session.invalidate(); // Hủy toàn bộ session
        }
        
        // Xóa cookie remember me
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    cookie.setMaxAge(0); // Đặt thời gian hết hạn về 0
                    cookie.setPath("/"); // Đảm bảo đường dẫn chính xác
                    resp.addCookie(cookie);
                    break;
                }
            }
        }
        
        // Chuyển hướng về trang login
        resp.sendRedirect(req.getContextPath() + "/login?logout=success");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Gọi lại doGet để xử lý
        doGet(req, resp);
    }
}