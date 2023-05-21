package serve;

import mapper.OrderMapper;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.Good;
import pojo.Order;
import pojo.ShowOrder;
import tools.FactoryOfSqlSession;

import java.util.List;

public class OrderServe {
    public static void addCart(String account,String id){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        Order order=mapper.selectByIdFromCart(account,id);
        if(order==null){
            mapper.insertCart(new Order(account,id,1));
        }else {
            int count=order.getCount();
            count++;
            mapper.updateCountInCart(new Order(account,id,count));
        }
        sqlSession.commit();
        sqlSession.close();
    }
    public static List<ShowOrder> getCart(String account){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        List<ShowOrder> showOrders = mapper.selectCartByAccount(account);
        sqlSession.close();
        return showOrders;
    }
    public static int clearAllCart(String account){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int i = mapper.deleteAllCart(account);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
    public static int delOneCart(String account,String id){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        int i = mapper.deleteOneCart(account, id);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
    public static void addIntoHistory(Order order){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        Order order1=mapper.selectByIdFromHistory(order.getUserAccount(),order.getId());
        if(order1!=null){
            int count=order1.getCount();
            count+=order.getCount();
            mapper.updateCountInHistory(new Order(order1.getUserAccount(), order1.getId(), count));
        }else {
            mapper.insertIntoHistory(order);
        }
        sqlSession.commit();
        sqlSession.close();
    }
    public static void updateGood(String id,int count){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        Good good = GoodServe.getGood(id);
        Integer inventory = good.getInventory();
        Integer sales = good.getSales();
        inventory-=count;
        sales+=count;
        mapper.updateGood(inventory,sales,id);
        sqlSession.commit();
        sqlSession.close();
    }
    public static List<ShowOrder> getHistory(String account){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        List<ShowOrder> showOrders = mapper.selectHistoryByAccount(account);
        sqlSession.close();
        return showOrders;
    }
}
