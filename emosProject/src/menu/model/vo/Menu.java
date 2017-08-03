package menu.model.vo;

public class Menu {
	private String menu_name;
	private int menu_num;
	private int store_num;
	private double menu_left;
	private double menu_top;
	private double menu_width;
	private double menu_height;
	private int menu_modal;
	private String menu_img;

	public Menu() {
		super();
	}

	public Menu(String menu_name, int menu_num, int store_num, double menu_left, double menu_top, double menu_width,
			double menu_height, int menu_modal, String menu_img) {
		super();
		this.menu_name = menu_name;
		this.menu_num = menu_num;
		this.store_num = store_num;
		this.menu_left = menu_left;
		this.menu_top = menu_top;
		this.menu_width = menu_width;
		this.menu_height = menu_height;
		this.menu_modal = menu_modal;
		this.menu_img = menu_img;
	}
	
	@Override
	public String toString() {
		return "Menu [menu_name=" + menu_name + ", menu_num=" + menu_num + ", store_num=" + store_num + ", menu_left="
				+ menu_left + ", menu_top=" + menu_top + ", menu_width=" + menu_width + ", menu_height=" + menu_height
				+ ", menu_modal=" + menu_modal + ", menu_img=" + menu_img + "]";
	}

	public double getMenu_height() {
		return menu_height;
	}
	public void setMenu_height(double menu_height) {
		this.menu_height = menu_height;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public int getStore_num() {
		return store_num;
	}
	public void setStore_num(int store_num) {
		this.store_num = store_num;
	}
	public double getMenu_left() {
		return menu_left;
	}
	public void setMenu_left(double menu_left) {
		this.menu_left = menu_left;
	}
	public double getMenu_top() {
		return menu_top;
	}
	public void setMenu_top(double menu_top) {
		this.menu_top = menu_top;
	}
	public double getMenu_width() {
		return menu_width;
	}
	public void setMenu_width(double menu_width) {
		this.menu_width = menu_width;
	}
	public int getMenu_modal() {
		return menu_modal;
	}
	public void setMenu_modal(int menu_modal) {
		this.menu_modal = menu_modal;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}	
}
