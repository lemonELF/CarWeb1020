package com.car.servlet;

import com.car.pojo.Verinfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
        System.out.println("进入checkout");
        HttpSession session = req.getSession();
        try {
            Verinfo verinfo = (Verinfo) session.getAttribute("name");

            String account =  verinfo.getAccount();
            String password =  verinfo.getPassword();

            System.out.println(account+"   "+password);
            String flag="{\"account\":\""+account+"\",\"password\":\""+password+"\"}";
            System.out.println(flag);
            resp.getWriter().append(flag);

        }catch (NullPointerException e)
        {
            String flag="{\"account\":\"\",\"password\":\"\"}";
            resp.getWriter().append(flag);
        }
        //super.doGet(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);
    }
}
