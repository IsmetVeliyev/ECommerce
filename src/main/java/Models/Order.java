package Models;

public class Order extends Urun{
	
	private String tarih;
	private String yontem;
	
	public void setTarih(String tarih) {
		this.tarih=tarih;
	}
	
	public String getTarih() {
		return this.tarih;
	}
	
	public void setYontem(String yontem) {
		this.yontem=yontem;
	}
	
	public String getYontem() {
		return this.yontem;
	}
}
