package mapper;

import pojo.Good;

import java.util.List;

public interface GoodMapper {
    List<Good> selectAllGoods();
    List<Good> selectGoods();
    int updateGood(Good good);
    List<Good> selectFoods();
    List<Good> selectElectronics();
    List<Good> selectClothes();
    Good selectOneById(String id);

}
