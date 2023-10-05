package com.mycompany.mavenproject2.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length=20, name="user_id")
    private int userId;
    @Column(length=20, name="user_email")
    private String userEmail;
    @Column(length=20, name="user_name")
    private String userName;
    @Column(length=20, name="user_password")
    private String userPassword;
    @Column(length=10, name="user_phone")
    private String userPhone;
    @Column(length=1000, name="user_address")
    private String userAddress;
    @Column(length=1000, name="user_type")
    private String userType;
    

    public User(int userId, String userEmail, String userName, String userPassword, String userPhone, String userAddress, String userType) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User(String userEmail, String userName, String userPassword, String userPhone, String userAddress, String userType) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    
    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userEmail=" + userEmail + ", userName=" + userName + ", userPassword=" + userPassword + ", userPhone=" + userPhone + '}';
    }
    
    
    
}
