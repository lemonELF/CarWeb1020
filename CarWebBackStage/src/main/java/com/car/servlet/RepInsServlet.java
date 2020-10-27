package com.car.servlet;

import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RepInsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入RepInsServlet");
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        String account = req.getParameter("account");
        String CarId = req.getParameter("CarId");
        String recentCareDay = req.getParameter("recentCareDay");
        String CareTime = req.getParameter("CareTime");

        String[] ituser2 ={"CarId","account","model","engine","produyear","buydate"};
        String search="select * from CarUser where CarId = '"+CarId+"'";
        String show = MysqlUtil.getJsonBySql(search,ituser2);
        String data="";
        if(show.length()==74)
        {
            data = "{\"data\":\"不存在该车辆\"}";
        }else{
            String insertcar="insert RepCar (account,CarId,recentCareDay,CareTime) values ('"+account+"','"+CarId+"','"+recentCareDay+"','"+CareTime+"')";
            MysqlUtil.add(insertcar);
            data = "{\"data\":\"返回成功\"}";
            //super.doGet(req, resp);
        }
        resp.getWriter().append(data);
        System.out.println(data);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //super.doPost(req, resp);
    }
}
