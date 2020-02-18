package cn.ruanwenjun.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.ruanwenjun.constant.Constant;
import cn.ruanwenjun.domain.Order;
import cn.ruanwenjun.domain.OrderItem;
import cn.ruanwenjun.utils.DataSourceUtils;

public class OrderDao {

	/**
	 * 问题：orderItem.getItemid()获取的是0ce942bb69c6这种形式的数据，
	 * 数据库Itemid改为255才存放得下，但是不知道怎么转换为int类型
	 * @param orderItem
	 * @throws SQLException
	 */
	public void setOrderItem(OrderItem orderItem) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into orderitem values(?,?,?,?,?)";
		runner.update(sql,orderItem.getItemid(),orderItem.getProductNum(),orderItem.getSubTotal(),
				orderItem.getProduct().getPid(),orderItem.getOrder().getOid());
	}

	public void setOrderItem(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		runner.update(sql, order.getOid(),order.getOrdertime(),order.getTotal(),Constant.ORDERS_STATE_OK,order.getAddress(),
						order.getName(),order.getTelephone(),order.getUid());
		
	}

	public void changeOrderState(String orderId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update orders set state = ? where oid=?";
		runner.update(sql, 1,orderId);
	}

	public List<Order> findAllOrderByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from orders where uid=? order by ordertime desc ";
		return runner.query(sql, new BeanListHandler<Order>(Order.class), uid);
	}

	public List<Map<String, Object>> findAllOrderItemByOid(String oid) throws SQLException {
		//要查询的有pimage,pname,shop_price,productNum,subTotal
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select p.pimage,p.pname,p.shop_price,o.count,o.subTotal from product p,orderitem o where o.oid=? and o.pid=p.pid ";
		List<Map<String, Object>> maplist = runner.query(sql, new MapListHandler(), oid);
		return maplist;
	}

	/**
	 * 根据oid删除订单
	 * @param oid
	 * @throws SQLException 
	 */
	public void delOrderByItemId(String oid) throws SQLException {
		//System.out.println("获取oid=="+oid);
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from orders where oid='"+oid+"'";
		String sql1 = "delete from orderitem where oid='"+oid+"'";
		runner.update(DataSourceUtils.getConnection(), sql);
		runner.update(DataSourceUtils.getConnection(), sql1);
	}

}
