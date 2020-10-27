package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RepDelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        System.out.println("进入RepDelServlet");
        String delid = req.getParameter("id");
        String DelSql = "Delete from CarUser where CarId ='"+delid+"'";
        int flag = MysqlUtil.del(DelSql);
        String data="";
        if(flag==1)
        {
              data="{\"status\":\"0\"}";
        }else {
              data="{\"status\":\"1\"}";
        }
        resp.getWriter().append(data);
        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
