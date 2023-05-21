package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.User;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    List<User> selectAllUsers();
    User selectByAccount(@Param("account") String account,@Param("permissions") int permissions);
    int insertUser(User user);
    int updateByAccount(User user);
    int delByAccount(String account);
}
