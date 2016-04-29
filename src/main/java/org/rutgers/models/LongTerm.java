package org.rutgers.models;

import java.util.Date;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/28/2016.
 */
public class LongTerm {

    private Date Date;
    private double Value;
    private String Company;

    public java.util.Date getDate() {
        return Date;
    }

    public void setDate(java.util.Date date) {
        Date = date;
    }

    public double getValue() {
        return Value;
    }

    public void setValue(double value) {
        Value = value;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String company) {
        Company = company;
    }

    @Override
    public String toString() {
        return "LongTerm{" +
                "Date=" + Date +
                ", Value=" + Value +
                ", Company='" + Company + '\'' +
                '}';
    }
}
