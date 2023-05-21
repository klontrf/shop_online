package servlet.admin;

import pojo.User;
import serve.UserServe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update_user")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String account=req.getParameter("account");
        String nickName=req.getParameter("nickname");
        String mail=req.getParameter("email");
        String password=req.getParameter("password");
        String address=req.getParameter("address");
        String tel=req.getParameter("phone");
        User user=new User(account,password,mail,address,tel,nickName);
        if(UserServe.updateUserByAccount(user)==1){
            req.getRequestDispatcher("manage_users").forward(req,resp);
        }
    }
}
