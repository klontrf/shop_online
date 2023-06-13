package filter;

import pojo.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter("/manage/*")
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req=(HttpServletRequest) servletRequest;
        HttpSession session = req.getSession();
        User s=(User) session.getAttribute("admin_online");
        if(s!=null){
            filterChain.doFilter(req,servletResponse);
        }else{
            req.getSession().setAttribute("admin_msg","您尚未登陆！");
            HttpServletResponse resp=(HttpServletResponse)servletResponse;
            resp.sendRedirect("http://localhost:8080/shopping_online/admin_login");
        }
    }
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void destroy() {}
}
