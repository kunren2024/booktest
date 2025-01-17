package bean;

public class Product implements java.io.Serializable {

	private int id;
	private String name;
	private int price;
	private String area;

	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public String getArea() {
		return area;
	}
	
	public void setId(int id) {
		this.id=id;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setPrice(int price) {
		this.price=price;
	}
	public void setArea(String area) {
		this.area=area;
	}
}
