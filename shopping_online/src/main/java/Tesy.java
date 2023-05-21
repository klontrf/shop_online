
import pojo.Good;
import pojo.User;
import serve.GoodServe;
import serve.OrderServe;
import serve.UserServe;

import java.util.List;

public class Tesy {
    public static void main(String[] args) {

//        int insert = UserServe.insert(new User("12", "sdf", "wer", "wer", "ewrw", "asdasd"));
//        System.out.println(insert);
//        List<User> allUsers = UserServe.getAllUsers();
//        System.out.println(allUsers.size());
        int i = OrderServe.delOneCart("test1", "3");
        System.out.println(i);
    }

}
