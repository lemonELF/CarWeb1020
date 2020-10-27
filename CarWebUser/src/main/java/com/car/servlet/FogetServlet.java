package com.car.servlet;

import mysql.MysqlUtil;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FogetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入UPDATEServlet");

        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        javax.servlet.ServletContext servletContext = this.getServletContext();//new一个Context对象
        String account = (String) servletContext.getAttribute("name");

        System.out.println("servletContext获得的邮箱名"+account);
        String password =req.getParameter("pwd");

        String update="update LoginUser set password ='"+password+"' where account ='"+account+"'";

        MysqlUtil.update(update);
        String data = "{\"data\":\"返回成功\"}";
        resp.getWriter().append(data);
        System.out.println(data);
        //super.doGet(req, resp);
  //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
