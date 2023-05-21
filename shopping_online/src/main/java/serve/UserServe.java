package serve;

import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.User;
import tools.FactoryOfSqlSession;

import java.util.List;

public class UserServe {
    public static boolean isExist(String account,int permissions){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User test = mapper.selectByAccount(account,permissions);
        sqlSession.close();
        return test!=null;
    }
    public  static User checkPassword(String account,String password,int permissions){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        User test = mapper.selectByAccount(account,permissions);
        sqlSession.close();
        return test;
    }
    public  static int insert(User user){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int t= mapper.insertUser(user);
        sqlSession.commit();
        sqlSession.close();
        return t;
    }
    public static List<User> getAllUsers(){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.selectAllUsers();
        sqlSession.close();
        return users;
    }
    public  static int updateUserByAccount(User user){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int res=mapper.updateByAccount(user);
        sqlSession.commit();
        sqlSession.close();
        return res;
    }
    public static int deleteUserByAccount(String account){
        SqlSessionFactory ssFactory = FactoryOfSqlSession.getSsFactory();
        SqlSession sqlSession = ssFactory.openSession(false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        int res=mapper.delByAccount(account);
        sqlSession.commit();
        sqlSession.close();
        return res;
    }

}
