package servlet.user;

import pojo.User;
import serve.OrderServe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/del_one_cart")
public class DelOneCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("user_online");
        String account= user.getAccount();
        String id=req.getParameter("del_id");
        int i= OrderServe.delOneCart(account,id);
        req.getRequestDispatcher("cart").forward(req,resp);
    }
}
