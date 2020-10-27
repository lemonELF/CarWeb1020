package com.car.servlet;

import com.car.Verifiction.Verinfo;
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

        String sqlString = "SELECT id,CarUser.account,CarUser.CarId,model,produyear,buydate,recentCareDay,CareTime FROM CarUser LEFT JOIN RepCar ON CarUser.CarId=RepCar.CarId";
        if(limit!=0) {
            if(page!=0) {
                sqlString += " limit "+limit*page+","+limit;
            }else{
                sqlString += " limit 0,"+limit;
            }
        }
        String[] CarRep = {"id","account","CarId","model","produyear","buydate","recentCareDay","CareTime"};
        String show = MysqlUtil.getJsonBySql(sqlString,CarRep);
        resp.getWriter().append(show);

        //super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
