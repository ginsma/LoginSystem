package User;

import DAO.DB;
import MD5.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 * Created by 雪亚 on 2016/11/15.
 */
@WebServlet("/register.do")
public class register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usr = req.getParameter("form-usr");
        String passwd = req.getParameter("form-password");
        String email = req.getParameter("form-email");
        System.out.println("register");

        int flags = 1;
        java.util.Date rTime = new java.util.Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        String regtime = df.format(rTime);
        DB register = new DB();


        try {

            passwd = MD5Util.md5Encode(passwd);
            String sql = "insert into usrInfo (usrname,usrpasswd,usremail,regtime,loginStatus) values('" + usr + "','" + passwd + "','" + email + "','" + regtime + "','0')";
            register.update(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().print(flags);
        resp.getWriter().flush();
        resp.getWriter().close();
    }
}
