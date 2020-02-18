package cn.ruanwenjun.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ruanwenjun.domain.Cart;
import cn.ruanwenjun.domain.CartItem;
import cn.ruanwenjun.domain.Product;
import cn.ruanwenjun.service.ProductService;
/**
 * 购物车模块
 */
public class CartServlet extends BasicServlet{
	/**
	 * 添加到购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		ProductService service = new ProductService();
		//根据pid单个商品查询
		Product product = service.findProductByPid(pid);
		int proNum = Integer.parseInt(request.getParameter("proNum"));//添加商品的数量
		HttpSession session = request.getSession();
		/***************** 更新session域中的购物车对象***************************/
		Cart cart = (Cart) session.getAttribute("cart");  
		if(cart==null) {
			cart = new Cart();
		}
		Map<String, CartItem> cartMap = cart.getCartMap();
		//判断购物车是否已存在商品的pid
		if(cartMap.containsKey(pid)) {
			//有：原来的购物项+新增的值
			CartItem cartItem = cartMap.get(pid);
			//购物车中已经包含了该商品:新加的数量+原来的数量
			cartItem.setProNum(cartItem.getProductNum()+proNum);
			//设置：小计的价格=新加的价格+购物车原来的价格
			cartItem.setSubTotal(cartItem.getSubTotal()+product.getShop_price()*proNum);
			cartMap.put(pid, cartItem);
		}else {
			//购物车中没有该商品，新增该购物商品项
			CartItem cartItem = new CartItem();
			cartItem.setProNum(proNum);
			cartItem.setProduct(product);
			cartItem.setSubTotal(product.getShop_price()*proNum);
			cartMap.put(pid, cartItem);
		}
		//修改当前购物车总金额
		cart.setTotal(cart.getTotal()+product.getShop_price()*proNum);
		cart.setCartMap(cartMap);
		session.setAttribute("cart", cart);
		//重定向到cart.jsp页面
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}
	/**
	 * 清空购物车
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void clearCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*********清空session中的cart**********/
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Map<String, CartItem> cartMap = cart.getCartMap();
		cartMap.clear();
		cart.setCartMap(cartMap);
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
		
	}
	/**
	 * 删除购物车商品
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void deleteCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Map<String, CartItem> cartMap = cart.getCartMap();
		if(cartMap.containsKey(pid)) {
			//根据购物车项的pid删除商品
			CartItem cartItem = cartMap.get(pid);
			cartMap.remove(pid);
			//总价格-删除商品价格
			cart.setTotal(cart.getTotal()-cartItem.getSubTotal());
			//设置购物车删除后的商品项的集合
			cart.setCartMap(cartMap);
			session.setAttribute("cart", cart);
		}
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}
	
}