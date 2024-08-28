
package com.mycompany.mycart.entites;

import javax.persistence.Column;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity

public class User {

@Id
@GeneratedValue(strategy =GenerationType.IDENTITY)

    private int userId;
    private String userName;
    private String userEmail;
    private String userpassword;
    private String userPhone;
    private String userPic;
    @Column (length =1500,name = "user_address")
    private String userAddress;
    
    private String userType;
    
    

    public User(int userId, String userName, String userEmail, String userpassword, String userPhone, String userPic, String userAddress , String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userpassword = userpassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    public User(String userName, String userEmail, String userpassword, String userPhone, String userPic, String userAddress ,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userpassword = userpassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType =userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
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
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userpassword=" + userpassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }
    
   
    
    
}
