package mapper;

import org.apache.ibatis.annotations.*;
import pojo.User;
import java.util.List;

public interface UserMapper {
    @Select("select * from users where permissions=0;")
    @Result(column = "name",property = "nickName")
    List<User> selectAllUsers();
    @Select("select * from users where account= #{account} and permissions= #{permissions};")
    @Result(column="name",property = "nickName")
    User selectByAccount(@Param("account") String account,@Param("permissions") int permissions);
    @Insert("insert into users (account, password, mail, address, tel, name)\n" +
            "        VALUES (#{account}, #{password}, #{mail}, #{address}, #{tel}, #{nickName});")
    int insertUser(User user);
    @Update("UPDATE users\n" +
            "        SET password = #{password},\n" +
            "        mail     = #{mail},\n" +
            "        address  = #{address},\n" +
            "        tel      = #{tel},\n" +
            "        name     = #{nickName}\n" +
            "        WHERE account = #{account} ;")
    int updateByAccount(User user);
    @Delete("DELETE\n" +
            "        FROM users\n" +
            "        WHERE account = #{account};")
    int delByAccount(String account);
}
