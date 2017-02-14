package User;

import DAO.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 雪亚 on 2017/2/13.
 */
@WebServlet("/checkEmail.do")
public class checkEmail extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usrEmail=req.getParameter("usrEmail");
        int flag=1;
        DB db=new DB();
        String checkUsr = "select * from usrInfo where usrEmail='" + usrEmail + "' order by usrid desc";
        ResultSet rs = db.executeQuery(checkUsr);
        try {
            if (rs.next()) {
                flag = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().print(flag);
        resp.getWriter().flush();
        resp.getWriter().close();

    }
}
