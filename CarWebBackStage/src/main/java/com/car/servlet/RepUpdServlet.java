package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RepUpdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        System.out.println("repairupdate");
        String account = req.getParameter("account");
        String CarId = req.getParameter("CarId");
        String recentCareDay = req.getParameter("recentCareDay");
        String CareTime = req.getParameter("CareTime");

        String update="update RepCar set CarId ='"+CarId+"',recentCareDay ='"+recentCareDay+"',CareTime ='"+CareTime+"' where account ='"+account+"'";

        MysqlUtil.update(update);
        String data = "{\"status\":\"0\"}";
        resp.getWriter().append(data);
        System.out.println(data);




        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
