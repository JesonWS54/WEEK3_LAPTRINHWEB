package vn.iostar.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.model.User;
import vn.iostar.service.UserService;
import vn.iostar.service.UserServiceImpl;

import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet(urlPatterns="/login")
public class LoginController extends HttpServlet {
	public static final String SESSION_USERNAME = "username";
	public static final String COOKIE_REMEMBER = "username";
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            resp.sendRedirect(req.getContextPath()+ "/admin/categories"); // Thay đổi ở đây
            return;
        }
        
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    session = req.getSession(true);
                    session.setAttribute("username", cookie.getValue());
                    resp.sendRedirect(req.getContextPath()+ "/admin/categories"); // Thay đổi ở đây
                    return;
                }
            }
        }
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
    
    private void saveRememberMe(HttpServletResponse response, String username){
        Cookie cookie = new Cookie(COOKIE_REMEMBER, username);
        cookie.setMaxAge(30*60);
        response.addCookie(cookie);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean isRememberMe = false;
        String remember = req.getParameter("remember");
        if("on".equals(remember)) {
            isRememberMe = true;
        }
        String alertMsg="";
        
        if(username.isEmpty() || password.isEmpty()) {
            alertMsg = "Tài khoản hoặc mật khẩu không được rỗng";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }
        
        UserService service = new UserServiceImpl();
        User user = service.login(username, password);
        if(user!=null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("account", user);
            if(isRememberMe){
                saveRememberMe(resp, username);
            }
            resp.sendRedirect(req.getContextPath()+"/admin/categories"); // Thay đổi ở đây
        } else {
            alertMsg = "Tài khoản hoặc mật khẩu không đúng";
            req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}