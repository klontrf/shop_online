package mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pojo.Good;

import java.util.List;

public interface GoodMapper {
    @Select("select * from goods;")
    List<Good> selectAllGoods();
    @Select("select * from goods where state='启用';")
    List<Good> selectGoods();
    @Update("UPDATE goods\n" +
            "        SET name      = #{name},\n" +
            "        price     = #{price},\n" +
            "        introduce = #{introduce},\n" +
            "        inventory = #{inventory},\n" +
            "        state     = #{state}\n" +
            "        WHERE id = #{id};")
    int updateGood(Good good);
    @Select("select id, name, path, price, introduce from foods_sort,goods where foods_sort.good_id=goods.id and state='启用';")
    List<Good> selectFoods();
    @Select("select id, name, path, price, introduce from electronics_sort,goods where electronics_sort.good_id=goods.id and state='启用';")
    List<Good> selectElectronics();
    @Select("select id, name, path, price, introduce from sport_sort,goods where sport_sort.good_id=goods.id and state='启用';")
    List<Good> selectClothes();
    @Select("select * from goods where id=#{id};")
    Good selectOneById(String id);

}
