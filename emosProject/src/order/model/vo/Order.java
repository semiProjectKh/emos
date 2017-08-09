package order.model.vo;

import java.sql.Date;

public class Order {
	private int orderNum;
	private int storeNum;
	private Date orderTime;
	private int orderType;
	private int order_way;
	private int userNum;
	public Order() {
		super();
	}
	
	public Order(int storeNum, Date orderTime, int order_way, int userNum) {
		super();
		this.storeNum = storeNum;
		this.orderTime = orderTime;
		this.order_way = order_way;
		this.userNum = userNum;
	}

	public Order(int orderNum, int storeNum, Date orderTime, int orderType, int order_way, int userNum) {
		super();
		this.orderNum = orderNum;
		this.storeNum = storeNum;
		this.orderTime = orderTime;
		this.orderType = orderType;
		this.order_way = order_way;
		this.userNum = userNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public int getOrderType() {
		return orderType;
	}
	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	public int getOrder_way() {
		return order_way;
	}
	public void setOrder_way(int order_way) {
		this.order_way = order_way;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	@Override
	public String toString() {
		return "Order [orderNum=" + orderNum + ", storeNum=" + storeNum + ", orderTime=" + orderTime + ", orderType="
				+ orderType + ", order_way=" + order_way + ", userNum=" + userNum + "]";
	}
	
	
	
}
