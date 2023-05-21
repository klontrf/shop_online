package pojo;

import org.apache.ibatis.type.Alias;

@Alias("good")
public class Good {
    private int id;
    private String name;
    private String path;
    private float price;
    private String introduce;
    private Integer inventory;
    private Integer sales;
    private String state;

    public Good(int id, String name, String path, float price, String introduce, Integer inventory, Integer sales,String state) {
        this.id = id;
        this.name = name;
        this.path = path;
        this.price = price;
        this.introduce = introduce;
        this.inventory = inventory;
        this.sales = sales;
        this.state=state;
    }

    public Good() {
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPath() {
        return path;
    }

    public float getPrice() {
        return price;
    }

    public String getIntroduce() {
        return introduce;
    }

    public Integer getInventory() {
        return inventory;
    }

    public Integer getSales() {
        return sales;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    @Override
    public String toString() {
        return "Good{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", price=" + price +
                ", introduce='" + introduce + '\'' +
                ", inventory=" + inventory +
                ", sales=" + sales +
                ", state='" + state + '\'' +
                '}';
    }
}
