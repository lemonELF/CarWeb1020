package veremail;

import org.apache.commons.mail.HtmlEmail;

public class verification {
    public static boolean sendEmail(String emailaddress, String code) {
        try {
            HtmlEmail email = new HtmlEmail();//不用更改
            email.setHostName("smtp.126.com");//需要修改，126邮箱为smtp.126.com,163邮箱为163.smtp.com，QQ为smtp.qq.com
            email.setCharset("UTF-8");
            email.addTo(emailaddress);// 收件地址

            email.setFrom("phone15630821952@126.com", "wangyi126");//此处填邮箱地址和用户名,用户名可以任意填写

            email.setAuthentication("phone15630821952@126.com", "FZUZQZYHSAPUSSTK");//此处填写邮箱地址和客户端授权码

            email.setSubject("java web验证码测试程序");//此处填写邮件名，邮件名可任意填写


            email.setMsg("尊敬的用户你好,您本次注册的验证码是:" + code);//此处填写邮件内容

            email.send();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }


    }
}

