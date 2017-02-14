package User;


import DAO.DB;
import MD5.MD5Util;
import Mail.Mail;
import jdk.nashorn.internal.runtime.ECMAException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * Created by 雪亚 on 2016/12/6.
 */
@WebServlet("/getback.do")
public class getback extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usrEmail = req.getParameter("usrEmail");
        String usrName = req.getParameter("usrName");
        int flag = 0;
        DB db = new DB();
        String sql = "select *  from usrInfo  WHERE usrName='" + usrName + "' and usrEmail='" + usrEmail + "'";
        ResultSet rs = db.executeQuery(sql);
        System.out.println(sql);

        try {
            if (rs.next()) {
                Random ramkey = new Random();
                String rak = ramkey.nextInt(999999) + "";
                //获取申请时间
                java.util.Date rTime = new java.util.Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
                String resetTime = df.format(rTime);
                String Key = MD5Util.md5Encode(rak);
                Mail.sendMail(usrEmail, usrName, Key);
                sql = "update usrInfo set resetkey= '" + Key + "',resettime='" + resetTime + "' where usrname='" + usrName + "'";
                db.update(sql);
                flag = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }



        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().print(flag); //默认为0，用户名和邮箱正确则为1
        resp.getWriter().flush();
        resp.getWriter().close();
    }
}
