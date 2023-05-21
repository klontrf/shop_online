package servlet.admin;

import pojo.Good;
import serve.GoodServe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/update_good")
public class UpdateGood extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int idnum= Integer.parseInt(req.getParameter("idnum"));
        String name=req.getParameter("name");
        int sales= Integer.parseInt(req.getParameter("sales"));
        float price= Float.parseFloat(req.getParameter("price"));
        int stock= Integer.parseInt(req.getParameter("stock"));
        String brief=req.getParameter("brief");
        String state=req.getParameter("state");
        Good good=new Good(idnum,name,"",price,brief,stock,sales,state);

        if(GoodServe.updateGood(good)==1){
            req.getRequestDispatcher("manage_goods").forward(req,resp);
        }
    }
}
