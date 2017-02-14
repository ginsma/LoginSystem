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

/**
 * Created by 雪亚 on 2016/12/7.
 */
@WebServlet("/updatePass.do")
public class UpdatePass extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String passwd=req.getParameter("password");
        try {
              passwd= MD5Util.md5Encode(passwd);
        }catch (Exception e){
            e.printStackTrace();
        }

        HttpSession session=req.getSession();
        String usrname=session.getAttribute("usr").toString();
        //String usrname="yaya";

        DB updatePass=new DB();
        String sql="update usrInfo set usrPassWd='"+passwd+"'where usrname='"+usrname+"'";
        System.out.println(sql);
        updatePass.update(sql);

    }
}
