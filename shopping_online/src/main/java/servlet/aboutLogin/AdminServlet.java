package servlet.aboutLogin;

import jakarta.servlet.annotation.WebServlet;
import pojo.User;
import serve.UserServe;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/admin_login")

public class AdminServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        if (req.getSession().getAttribute("admin_msg")!=null){
            req.setAttribute("admin_msg","您尚未登陆！");
            req.getSession().removeAttribute("admin_msg");
            req.getRequestDispatcher("admin_login.jsp").forward(req,resp);
            return;
        }
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if(!UserServe.isExist(username,1)){
            req.setAttribute("admin_msg","该管理员不存在！");
            req.getRequestDispatcher("admin_login.jsp").forward(req,resp);
        }else{
            User user=UserServe.checkPassword(username,password,1);
            if(!user.getPassword().equals(password)){
                req.setAttribute("admin_msg","密码错误！");
                req.getRequestDispatcher("admin_login.jsp").forward(req,resp);
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("admin_online",user);
                req.getRequestDispatcher("manage_users").forward(req,resp);
            }
        }
    }
}
