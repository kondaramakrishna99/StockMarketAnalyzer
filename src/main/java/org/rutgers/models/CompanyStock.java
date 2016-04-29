package org.rutgers.models;


import java.util.*;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/27/2016.
 */
public class CompanyStock {
    private Date DateClose;
    private String Open;
    private String High;
    private String Low;
    private String close;
    private String volume;
    private String Adj_Close;
    private String Stock;

    public Date getDateClose() {
        return DateClose;
    }

    public void setDateClose(Date dateClose) {
        DateClose = dateClose;
    }

    public String getOpen() {
        return Open;
    }

    public void setOpen(String open) {
        Open = open;
    }

    public String getHigh() {
        return High;
    }

    public void setHigh(String high) {
        High = high;
    }

    public String getLow() {
        return Low;
    }

    public void setLow(String low) {
        Low = low;
    }

    public String getClose() {
        return close;
    }

    public void setClose(String close) {
        this.close = close;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public String getAdj_Close() {
        return Adj_Close;
    }

    public void setAdj_Close(String adj_Close) {
        Adj_Close = adj_Close;
    }

    public String getStock() {
        return Stock;
    }

    public void setStock(String stock) {
        Stock = stock;
    }

    @Override
    public String toString() {
        return "CompanyStock{" +
                "DateClose=" + DateClose +
                ", Open='" + Open + '\'' +
                ", High='" + High + '\'' +
                ", Low='" + Low + '\'' +
                ", close='" + close + '\'' +
                ", volume='" + volume + '\'' +
                ", Adj_Close='" + Adj_Close + '\'' +
                ", Stock='" + Stock + '\'' +
                '}';
    }
}
