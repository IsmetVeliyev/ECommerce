package Models;

public class Urun {
	private String ad;
	private double fiyat;
	private String kategori;
	private int sayi;
	private String goruntu;
	private String email;
	private int UrunId;
	
	public Urun() {
		
	}
	public Urun(String ad,double fiyat,String kategori,int sayi,String goruntu,String email) {
		this.ad=ad;
		this.fiyat=fiyat;
		this.kategori=kategori;
		this.sayi=sayi;
		this.goruntu=goruntu;
		this.email=email;
	}
	
	public String getAd() {
		return this.ad;
	}
	public void setAd(String ad) {
		this.ad=ad;
	}
	
	public double getFiyat() {
		return this.fiyat;
	}
	
	public void setFiyat(Double fiyat) {
		this.fiyat=fiyat;
	}
	
	
	public String getKategori() {
		return this.kategori;	
	}
	
	public void setKategori(String kategori) {
		this.kategori=kategori;
	}
	
	public int getSayi() {
		return this.sayi;
	}
	
	public void setSayi(int sayi) {
		this.sayi=sayi;
	}
	
	public void setGoruntu(String goruntu) {
		this.goruntu=goruntu;
	}
	public String getGoruntu() {
		return this.goruntu;
	}
	
	public String getEmail() {
		return email;
		
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	
	public void setUrunId(int UrunId) {
		this.UrunId=UrunId;
	}
	
	public int getUrunId() {
		return this.UrunId;
	}
	
}
