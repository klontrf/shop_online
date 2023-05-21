package pojo;

import org.apache.ibatis.type.Alias;

@Alias("order")
public class Order {
    private String userAccount;
    private String id;
    private int count;

    public Order(String userAccount, String id, int count) {
        this.userAccount = userAccount;
        this.id = id;
        this.count = count;
    }

    public Order() {
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Order{" +
                "userAccount='" + userAccount + '\'' +
                ", id='" + id + '\'' +
                ", count=" + count +
                '}';
    }
}
