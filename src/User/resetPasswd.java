package Mail;




import DAO.DB;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 * Created by 雪亚 on 2016/12/6.
 */
@WebServlet("/resetPasswd.do")
public class resetPasswd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usrname = req.getParameter("username");
        String resetKey = req.getParameter("key");

        boolean flags = false;

        DB confirm = new DB();
        String sql = "select resetTime from usrInfo where usrname='" + usrname + "'";
        ResultSet rs = confirm.executeQuery(sql);
        java.util.Date now = new java.util.Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
        String resetTime = df.format(now);
        System.out.println(resetTime);
        java.util.Date resettime;
        long diff=0;

        try {
            if (rs.next()) {
                resettime = rs.getTimestamp("resetTime");
                resetTime = df.format(resettime);
                System.out.println(resetTime);
                diff = now.getTime() - resettime.getTime();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (!overdue(diff)) {
            HttpSession session=req.getSession();
            session.setAttribute("usr",usrname);
            req.setAttribute("usrname", usrname);
            req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);


        } else {
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }

    }

    public boolean overdue(long diff) {
        boolean flags = false;
        if (diff / 60 / 60 / 1000 > 24) {
            flags = true;
        }

        return flags;

    }
}