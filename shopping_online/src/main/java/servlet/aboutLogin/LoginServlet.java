package servlet.aboutLogin;

import pojo.User;
import serve.UserServe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        if (req.getSession().getAttribute("login_msg")!=null){
            req.setAttribute("login_msg","您尚未登陆！");
            req.getSession().removeAttribute("login_msg");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
            return;
        }

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if(!UserServe.isExist(username,0)){
            req.setAttribute("login_msg","该用户不存在！");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }else{
            User user=UserServe.checkPassword(username,password,0);
            if(!user.getPassword().equals(password)){
                req.setAttribute("login_msg","密码错误！");
                req.setAttribute("account_temp",username);
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("user_online",user);
                req.getRequestDispatcher("home").forward(req,resp);
            }
        }
    }
}
