package Models;

public class Musteri {
	private String ad;
	private String soyad;
	private String email;
	private String sifre;
	
	public Musteri() {
		
	}
	
	public Musteri(String ad,String soyad,String email,String sifre) {
		this.ad=ad;
		this.soyad=soyad;
		this.email=email;
		this.sifre=sifre;
	}
	
	
   public void setAd(String ad) {
	   this.ad=ad;
   }
   
   public String getAd() {
	   return this.ad; 
   }
   
   public void setSoyad(String soyad) {
	   this.soyad=soyad;
   }
   
   public String getSoyad() {
	   return this.soyad;
   }
   
   public void setEmail(String email) {
	   this.email=email;
   }
   
   public String getEmail() {
	   return this.email;
   }
   
   public void setSifre(String sifre) {
	   this.sifre=sifre;
   }
   
   public String getSifre() {
	   return this.sifre;
   }
	
	
	

}
