package com.car.servlet;

import com.car.pojo.Verinfo;
import mysql.MysqlUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RepServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        int page= Integer.parseInt(req.getParameter("page"))-1;
        int limit= Integer.parseInt(req.getParameter("limit"));
        HttpSession session = req.getSession();
        Verinfo verinfo = (Verinfo) session.getAttribute("name");
        String account = verinfo.getAccount();
        //String account = req.getParameter("account");//从session中取得
        String sqlString = "SELECT * from RepCar where account ='"+account+"'";
        if(limit!=0) {
            if(page!=0) {
                sqlString += " limit "+limit*page+","+limit;
            }else{
                sqlString += " limit 0,"+limit;
            }
        }
        //String[] ituser2 ={"id","userName","password","phoneNumber","idCard"};
        String[] ituser2 = {"id","account","CarId","recentCareDay","CareTime"};

        String show = MysqlUtil.getJsonBySql(sqlString,ituser2);
        //System.out.println(show);
        //System.out.println(select);
        resp.getWriter().append(show);
        System.out.println("进入Servlet-->RepServlet");
        System.out.println(show);

        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
