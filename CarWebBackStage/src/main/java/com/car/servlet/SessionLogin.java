package com.car.servlet;


import com.car.Verifiction.Verinfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class
SessionLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        //得到session需要验证的值    账户名和密码
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        //当前页//会话//           //四个作用域
        System.out.println("进入登录session");
        //得到session
        HttpSession session = req.getSession();
        //给session传递参数
        session.setAttribute("name",new Verinfo(account,password));
        //得到session的ID
        String SessionId = session.getId();
        String flag="Input";
        resp.getWriter().append(flag);
        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
