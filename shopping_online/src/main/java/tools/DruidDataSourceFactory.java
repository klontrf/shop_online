package tools;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.datasource.DataSourceFactory;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Properties;

public class DruidDataSourceFactory implements DataSourceFactory {
    private Properties properties;
    @Override
    public void setProperties(Properties properties) {
        this.properties= properties;
    }
    @Override
    public DataSource getDataSource() {
        DruidDataSource dds = new DruidDataSource();
        dds.setUrl(this.properties.getProperty("url"));
        dds.setUsername(this.properties.getProperty("username"));
        dds.setPassword(this.properties.getProperty("password"));
        dds.setInitialSize(Integer.parseInt(this.properties.getProperty("initialSize")));
        dds.setMaxActive(Integer.parseInt(this.properties.getProperty("maxActive")));
        dds.setMaxWait(Long.parseLong(this.properties.getProperty("maxWait")));
        dds.setDriverClassName(this.properties.getProperty("driverClassName"));
        try {
            dds.init();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dds;
    }
}
