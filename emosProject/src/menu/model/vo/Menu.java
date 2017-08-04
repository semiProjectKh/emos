package menu.model.vo;

import java.io.Serializable;

public class Menu implements Serializable {
	private int menuNum;
	private int storeNum;
	private String menuName;
	private int price;
	private String menuType;

	public Menu() {
		super();
	}

	public Menu(int menuNum, int storeNum, String menuName, int price, String menuType, int displayNum) {
		super();
		this.menuNum = menuNum;
		this.storeNum = storeNum;
		this.menuName = menuName;
		this.price = price;
		this.menuType = menuType;
	}

	public Menu(int menuNum, String menuName, int price, String menuType) {
		super();
		this.menuNum = menuNum;
		this.menuName = menuName;
		this.price = price;
		this.menuType = menuType;
	}

	public int getMenuNum() {
		return menuNum;
	}

	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}

	public int getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(int storeNum) {
		this.storeNum = storeNum;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	@Override
	public String toString() {
		return "Menu [menuNum=" + menuNum + ", storeNum=" + storeNum + ", menuName=" + menuName + ", price=" + price
				+ ", menuType=" + menuType + "]";
	}

}
