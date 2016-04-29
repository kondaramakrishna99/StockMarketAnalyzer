package org.rutgers.models;
import java.util.*;
/**
 * Created by Rama on 4/23/2016.
 */
public class UsersWithShares {

    private String Username;
    private String Company;
    private Date DateBought;
    private int NumberOfShares;
    private int PricePerShare;
    private String status;


    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getCompany() {
        return Company;
    }

    public void setCompany(String company) {
        Company = company;
    }

    public Date getDateBought() {
        return DateBought;
    }

    public void setDateBought(Date date) {
        //Date d = new Date(date);
        DateBought = date;
    }

    public int getNumberOfShares() {
        return NumberOfShares;
    }

    public void setNumberOfShares(int numberOfShares) {
        NumberOfShares = numberOfShares;
    }

    public int getPricePerShare() {
        return PricePerShare;
    }

    public void setPricePerShare(int pricePerShare) {
        PricePerShare = pricePerShare;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UsersWithShares{" +
                "Username='" + Username + '\'' +
                ", Company='" + Company + '\'' +
                ", DateBought=" + DateBought +
                ", NumberOfShares=" + NumberOfShares +
                ", PricePerShare=" + PricePerShare +
                ", status='" + status + '\'' +
                '}';
    }
}
