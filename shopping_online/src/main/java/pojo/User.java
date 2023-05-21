package pojo;

import org.apache.ibatis.type.Alias;

@Alias("user")
public class User {
    private String account;
    private String password;
    private String mail;
    private String address;
    private String tel;
    private String nickName;


    public void setPassword(String password) {
        this.password = password;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public User() {
    }

    public User(String account, String password, String mail, String address, String tel, String nickName) {
        this.account = account;
        this.password = password;
        this.mail = mail;
        this.address = address;
        this.tel = tel;
        this.nickName = nickName;
    }

    public String getAccount() {
        return account;
    }

    public String getPassword() {
        return password;
    }

    public String getMail() {
        return mail;
    }

    public String getAddress() {
        return address;
    }

    public String getTel() {
        return tel;
    }

    public String getNickName() {
        return nickName;
    }

    @Override
    public String toString() {
        return "User{" +
                "account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", mail='" + mail + '\'' +
                ", address='" + address + '\'' +
                ", tel='" + tel + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
    }
}
