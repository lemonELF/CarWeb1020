package com.car.servlet;

import veremail.verification;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;

public class VerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        Random random = new Random(10000);
        long code = Math.round((Math.random()+1) * 1000);//生成随机的四位数字验证码

        String vercode = String.valueOf(code);//把long类型转化成Sting类型
        String address = req.getParameter("email");

        boolean flag = verification.sendEmail(address,vercode);


        System.out.println(address);
        System.out.println(vercode);
        String result="";
        if(flag==true)
        {
            result = "yes";
        }else{
            result="no";
        }
        String verandre="{\"result\":\""+result+"\",\"code\":\""+vercode+"\"}";

        ServletContext s1sc = this.getServletContext();//new一个Context对象
        s1sc.setAttribute("name",address);//将值放入公共的ServletContext

        System.out.println(verandre);
        resp.getWriter().append(verandre);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
