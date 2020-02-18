package cn.ruanwenjun.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.ruanwenjun.constant.Constant;
import cn.ruanwenjun.domain.Category;
import cn.ruanwenjun.domain.Product;
import cn.ruanwenjun.utils.DataSourceUtils;

public class ProductDao {

	/**
	 * 查詢热门商品
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findHotProduct() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 * 写法一：设置为1和0,9属于写死（硬编码）
		 * String sql = "select * from product where is_hot=1 limit 0,9"; return
		 * runner.query(sql, new BeanListHandler<Product>(Product.class));
		 */
		//写法二：PRODUCT_IS_HOT值为1是热门商品，PRODUCT_IS_UP值为1是未下架商品
		String sql = "select * from product where is_hot=? and pflag=? order by pdate desc limit 0,9";
		return runner.query(sql, new BeanListHandler<Product>(Product.class),Constant.PRODUCT_IS_HOT,Constant.PRODUCT_IS_UP);
	}

	/**
	 * 查询最新商品
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findNewProduct() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		 * 写法一
		 * String sql = "select * from product order by pdate desc limit 0,9"; return
		 * runner.query(sql, new BeanListHandler<Product>(Product.class));
		 */
		
		//写法二：PRODUCT_IS_UP值为1是未下架商品
				String sql = "select * from product where pflag=? order by pdate desc limit 0,9";
				return runner.query(sql, new BeanListHandler<Product>(Product.class),Constant.PRODUCT_IS_UP);
		
	}

	/**
	 * 查询所有商品类别
	 * @return
	 * @throws SQLException
	 */
	public List<Category> findCategory() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category";
		return runner.query(sql, new BeanListHandler<Category>(Category.class));
	}

	public List<Product> findProductByCid(String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where cid=?";
		return runner.query(sql, new BeanListHandler<Product>(Product.class),cid);
	}

	public int findAllProductByCid(String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from product where cid=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), cid);
		return query.intValue();
	}

	public List<Product> findPageBeanProductList(int index, int currentCount,String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where cid=? order by pdate desc limit ?,?";
		return runner.query(sql, new BeanListHandler<Product>(Product.class), cid,index,currentCount);
	}

	/**
	  * 查询单个商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public Product findProductByPid(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pid=?";
		return runner.query(sql, new BeanHandler<Product>(Product.class),pid);
	}

	/**
	 * 通过cid查询商品种类
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public Category findCategoryByCid(String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category where cid=?";
		return runner.query(sql, new BeanHandler<Category>(Category.class),cid);
	}

	

	
	
}
