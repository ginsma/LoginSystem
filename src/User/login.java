package User;

import DAO.DB;
import MD5.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 雪亚 on 2016/11/16.
 */
@WebServlet("/login.do")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usr=req.getParameter("form-username");
        String passwd=req.getParameter("form-password");
        try {
             passwd= MD5Util.md5Encode(passwd);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

        int flags=1;
         HttpSession session=req.getSession();

        DB login=new DB();
        String sql="select * from usrInfo where usrname='"+usr+"' order by usrid desc";
        //String log="update usr set loginStatus=1 where usrname='"+usr+"'";
        ResultSet resultSet=login.executeQuery(sql);
        String qUsr;
        try {
            if(resultSet.next()){
                if(passwd.equals(resultSet.getString("usrpasswd"))){
                    flags=1;
                    session.setAttribute("usr",resultSet.getString("usrname"));
          //          login.executeAll(log);
                }else {
                    flags=2;
                }

            }else {
                flags=0;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println(session.getAttribute("usr"));
        System.out.println(flags);
        resp.getWriter().print(flags);
        resp.getWriter().flush();
        resp.getWriter().close();

    }
}
