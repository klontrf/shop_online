package servlet.user;

import pojo.Order;
import pojo.ShowOrder;
import pojo.User;
import serve.OrderServe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/buy_all")
public class BuyAllServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String  goods_id=req.getParameter("goods_id");
        String  counts=req.getParameter("counts");
        User user= (User) req.getSession().getAttribute("user_online");
        String account=user.getAccount();
        OrderServe.clearAllCart(account);
        String[] goodLis=goods_id.split(" ");
        String[] countLis=counts.split(" ");

        for(int i=0;i<goodLis.length;i++){
            OrderServe.addIntoHistory(new Order(account,goodLis[i],Integer.parseInt(countLis[i])));
            OrderServe.updateGood(goodLis[i],Integer.parseInt(countLis[i]));
        }
        req.getRequestDispatcher("cart").forward(req,resp);
    }
}
