package ordermenu.model.vo;

public class OrderMenu {
	private int orderMenuNum;
	private int orderNum;
	private int menuNum;
	private int menuCnt;
	private int price;
	public OrderMenu() {
		super();
	}
	public OrderMenu(int orderMenuNum, int orderNum, int menuNum, int menuCnt, int price) {
		super();
		this.orderMenuNum = orderMenuNum;
		this.orderNum = orderNum;
		this.menuNum = menuNum;
		this.menuCnt = menuCnt;
		this.price = price;
	}
	public int getOrderMenuNum() {
		return orderMenuNum;
	}
	public void setOrderMenuNum(int orderMenuNum) {
		this.orderMenuNum = orderMenuNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}
	public int getMenuCnt() {
		return menuCnt;
	}
	public void setMenuCnt(int menuCnt) {
		this.menuCnt = menuCnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderMenu [orderMenuNum=" + orderMenuNum + ", orderNum=" + orderNum + ", menuNum=" + menuNum
				+ ", menuCnt=" + menuCnt + ", price=" + price + "]";
	}
}
