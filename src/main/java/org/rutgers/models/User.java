package org.rutgers.models;

import java.util.Date;

/**
 * Created by Rama on 4/16/2016.
 */
public class User {

    private String Username="";
    private String Password="";
    private String Name;
    private String Email;
    private String Gender;
    private String DateOfBirth;
    private String Address;
    private String City;
    private String Country;
    private String Mobile;
    private String Occupation;
    private int AnnualIncome;

    public String getOccupation() {
        return Occupation;
    }

    public void setOccupation(String occupation) {
        Occupation = occupation;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        DateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getMobile() {
        return Mobile;
    }

    public int getAnnualIncome() {
        return AnnualIncome;
    }

    public void setAnnualIncome(int income) {
        AnnualIncome = income;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    @Override
    public String toString() {
        return "User{" +
                "Username='" + Username + '\'' +
                ", Password='" + Password + '\'' +
                ", Name='" + Name + '\'' +
                ", Email='" + Email + '\'' +
                ", Gender='" + Gender + '\'' +
                ", DateOfBirth=" + DateOfBirth +
                ", Address='" + Address + '\'' +
                ", City='" + City + '\'' +
                ", Country='" + Country + '\'' +
                ", Mobile=" + Mobile +
                ", Occupation='" + Occupation + '\'' +
                ", Income=" + AnnualIncome +
                '}';
    }
}
