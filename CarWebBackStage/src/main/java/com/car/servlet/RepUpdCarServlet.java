package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RepUpdCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        System.out.println("repairupdate");

        String carId  = req.getParameter("CarId");
        String account = req.getParameter("account");
        String model = req.getParameter("model");
        String buydate = req.getParameter("buydate");
        String produyear = req.getParameter("produyear");

        String update="update CarUser set account ='"+account+"' where carId ='"+carId+"'";

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
