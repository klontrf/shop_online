package serve;

import mapper.GoodMapper;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.Good;

import tools.FactoryOfSqlSession;

import java.util.List;

public class GoodServe {
    public static List<Good> getAllGoods(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        List<Good> goods=mapper.selectAllGoods();
        sqlSession.close();
        return goods;
    }
    public static List<Good> getGoods(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        List<Good> goods=mapper.selectGoods();
        sqlSession.close();
        return goods;
    }
    public static int updateGood(Good good){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        int i = mapper.updateGood(good);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
    public static List<Good> getFoods(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        List<Good> foods=mapper.selectFoods();
        sqlSession.close();
        return foods;
    }
    public static List<Good> getElectronics(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        List<Good> goods=mapper.selectElectronics();
        sqlSession.close();
        return goods;
    }
    public static List<Good> getClothes(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        List<Good> goods=mapper.selectClothes();
        sqlSession.close();
        return goods;
    }
    public static Good getGood(String id){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        GoodMapper mapper=sqlSession.getMapper(GoodMapper.class);
        Good good = mapper.selectOneById(id);
        sqlSession.close();
        return good;
    }
}
