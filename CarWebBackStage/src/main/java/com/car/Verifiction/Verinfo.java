package com.car.Verifiction;

public class Verinfo {
    private String account;
    private String password;

    public Verinfo() {
    }

    public Verinfo(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
