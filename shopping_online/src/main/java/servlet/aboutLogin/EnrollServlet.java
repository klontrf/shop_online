package servlet.aboutLogin;

import pojo.User;
import serve.UserServe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {
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
        if (UserServe.isExist(account, 0)||UserServe.isExist(account, 1)) {
            req.setAttribute("enroll_msg","该账号已被占用！");
            req.setAttribute("nickname",nickName);
            req.setAttribute("email",mail);
            req.setAttribute("password",password);
            req.setAttribute("address",address);
            req.setAttribute("phone",tel);
            req.getRequestDispatcher("enroll.jsp").forward(req,resp);
        }else {
            User user=new User(account,password,mail,address,tel,nickName);
            if(UserServe.insert(user)==1){
                req.setAttribute("login_msg","注册成功！");
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }
        }
    }
}
