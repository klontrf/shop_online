package servlet.user;

import pojo.Good;
import serve.GoodServe;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/electronics")
public class ElectronicsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        List<Good> goods= GoodServe.getElectronics();
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("html/electronics.jsp").forward(req,resp);
    }
}
