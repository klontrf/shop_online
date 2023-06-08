package mapper;

import org.apache.ibatis.annotations.*;
import pojo.Order;
import pojo.ShowOrder;

import java.util.List;

public interface OrderMapper {
    @Select("select * from shopping_cart where user_account=#{account} and good_id=#{id};")
    @Results({
            @Result(column="user_account", property="userAccount"),
            @Result(column="good_id", property="id")
        }
    )
    Order selectByIdFromCart(@Param("account") String account, @Param("id") String id);
    @Insert("INSERT INTO shopping_cart (user_account, count, good_id)\n" +
            "        VALUES (#{userAccount}, 1, #{id});")
    int insertCart(Order order);
    @Update("UPDATE shopping_cart\n" +
            "        SET count = #{count}\n" +
            "        WHERE user_account = #{userAccount} AND good_id = #{id};")
    int updateCountInCart(Order order);
    @Select("select id,path,name,price,count from goods,shopping_Cart where goods.id=shopping_Cart.good_id and user_account=#{account};")
    List<ShowOrder> selectCartByAccount(String account);
    @Delete("DELETE\n" +
            "        FROM shopping_cart\n" +
            "        WHERE user_account = #{account};")
    int deleteAllCart(String account);
    @Delete("DELETE\n" +
            "        FROM shopping_cart\n" +
            "        WHERE user_account = #{account} AND good_id = #{good_id};")
    int deleteOneCart(@Param("account") String account,@Param("good_id") String id);
    @Select("select * from purchase_history where user_account=#{account} and good_id=#{id};")
    @Results({
            @Result(column="user_account", property="userAccount"),
            @Result(column="good_id", property="id")
    }
    )
    Order selectByIdFromHistory(@Param("account") String account, @Param("id") String id);
    @Insert("INSERT INTO purchase_history (user_account, good_id, count)\n" +
            "        VALUES (#{userAccount}, #{id}, #{count});")
    int insertIntoHistory(Order order);
    @Update("UPDATE purchase_history\n" +
            "        SET count = #{count}\n" +
            "        WHERE user_account = #{userAccount} AND good_id = #{id};")
    int updateCountInHistory(Order order);
    @Update(" UPDATE goods\n" +
            "        SET inventory = #{inventory},\n" +
            "        sales     = #{sales}\n" +
            "        WHERE id = #{id};")
    int updateGood(@Param("inventory") int inventory,@Param("sales") int sales,@Param("id") String id);
    @Select("select id,path,name,price,count from goods,purchase_history where goods.id=purchase_history.good_id and user_account=#{account};")
    List<ShowOrder> selectHistoryByAccount(String account);
}
