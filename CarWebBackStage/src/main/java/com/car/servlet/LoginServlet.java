package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        String Saccount=req.getParameter("account");
        String select = "select * from AdminUser where Saccount='"+Saccount+"';";
        String[] ituser2 ={"id","Saccount","Spassword"};
        String show = MysqlUtil.getJsonBySql(select,ituser2);
        //System.out.println("进入Servlet-->SelectServlet  2 ");
        System.out.println(show);
        resp.getWriter().append(show);


        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
