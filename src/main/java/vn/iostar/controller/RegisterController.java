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

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String email = req.getParameter("email"); // nếu có trường email

        String alertMsg = "";

        if (username == null || username.isEmpty() ||
            password == null || password.isEmpty() ||
            confirmPassword == null || confirmPassword.isEmpty()) {
            alertMsg = "Vui lòng nhập đầy đủ thông tin";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirmPassword)) {
            alertMsg = "Mật khẩu xác nhận không trùng khớp";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        if (userService.get(username) != null) {
            alertMsg = "Tài khoản đã tồn tại";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        // Tạo user và lưu
        User user = new User();
        user.setUserName(username);
        user.setPassWord(password);
        user.setEmail(email);

        userService.register(user); // gọi phương thức mới bạn sẽ thêm ở bước 3

        // Đăng ký thành công -> quay lại login
        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
