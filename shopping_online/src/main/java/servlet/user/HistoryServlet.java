package servlet.user;


import pojo.ShowOrder;
import pojo.User;

import serve.OrderServe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("user_online");
        List<ShowOrder> history = OrderServe.getHistory(user.getAccount());
        req.setAttribute("goods",history);
        req.getRequestDispatcher("html/purchase_history.jsp").forward(req,resp);
    }
}
