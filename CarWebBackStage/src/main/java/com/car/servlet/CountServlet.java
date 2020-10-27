package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sqlString = "SELECT count(*) FROM CarUser LEFT JOIN RepCar ON CarUser.CarId=RepCar.CarId";
        int json2 = MysqlUtil.getCount(sqlString);
        String json= "{"+"\"count\":"+json2+"}";
        System.out.println(json);
        resp.getWriter().append(json);

        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
