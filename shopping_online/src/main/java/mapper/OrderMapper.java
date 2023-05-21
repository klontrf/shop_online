package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.Order;
import pojo.ShowOrder;

import java.util.List;

public interface OrderMapper {
    Order selectByIdFromCart(@Param("account") String account, @Param("id") String id);
    int insertCart(Order order);
    int updateCountInCart(Order order);
    List<ShowOrder> selectCartByAccount(String account);
    int deleteAllCart(String account);
    int deleteOneCart(@Param("account") String account,@Param("good_id") String id);

    Order selectByIdFromHistory(@Param("account") String account, @Param("id") String id);
    int insertIntoHistory(Order order);
    int updateCountInHistory(Order order);

    int updateGood(@Param("inventory") int inventory,@Param("sales") int sales,@Param("id") String id);

    List<ShowOrder> selectHistoryByAccount(String account);
}
