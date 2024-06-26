package services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import Models.Musteri;
import Models.Urun;
public class ProductServices {
	Connection con;
	PreparedStatement psmnt;
	String query;
	ResultSet rs;
	
	public ProductServices(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Urun> getProducts(String opr){
		ArrayList<Urun>productList = new ArrayList<>();
		try {
			if(opr.equals("All")) {
				
			
			query="SELECT * FROM URUN";
			psmnt = con.prepareStatement(query);
			rs = psmnt.executeQuery();
			while(rs.next()) {
				Urun urun = new Urun();
				urun.setUrunId(rs.getInt("UrunId"));
				urun.setAd(rs.getString("ad"));
				urun.setGoruntu(rs.getString("goruntu"));
				urun.setKategori(rs.getString("kategori"));
				urun.setSayi(rs.getInt("sayi"));
				urun.setFiyat(rs.getDouble("fiyat"));
				urun.setEmail(rs.getString("email"));
				productList.add(urun);
			}
		}else {
			query="SELECT * FROM URUN WHERE kategori=?";
			psmnt=con.prepareStatement(query);
			psmnt.setString(1,opr);
			rs= psmnt.executeQuery();
			while(rs.next()) {
				Urun urun = new Urun();
				urun.setUrunId(rs.getInt("UrunId"));
				urun.setAd(rs.getString("ad"));
				urun.setGoruntu(rs.getString("goruntu"));
				urun.setKategori(rs.getString("kategori"));
				urun.setSayi(rs.getInt("sayi"));
				urun.setFiyat(rs.getDouble("fiyat"));
				urun.setEmail(rs.getString("email"));
				productList.add(urun);
			}
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	
	}
	
	public void shareProduct(Urun urun) throws SQLException {
		System.out.println("There is a problem!");
		query = "INSERT INTO urun (ad, goruntu,kategori, sayi, fiyat,email) VALUES (?,?,?,?,?,?)";
		psmnt = con.prepareStatement(query);
		psmnt.setString(1, urun.getAd());
		psmnt.setString(2,urun.getGoruntu());
		psmnt.setString(3, urun.getKategori());
		psmnt.setInt(4, urun.getSayi());
		psmnt.setDouble(5,urun.getFiyat());
		psmnt.setString(6,urun.getEmail());
		psmnt.execute();
		psmnt.close();
		
	}
	
	public ArrayList<Urun> getMyProducts(Musteri m){
		ArrayList<Urun> UrunList = new ArrayList<>();
		query="SELECT u.urunID,u.ad,u.goruntu,u.email,u.kategori,u.sayi,u.fiyat FROM  musteri m JOIN urun u ON m.email=u.email WHERE u.email=?";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setString(1,m.getEmail());
			rs=psmnt.executeQuery();
			while(rs.next()) {
				Urun urun = new Urun();
				urun.setUrunId(rs.getInt("urunID"));
				urun.setAd(rs.getString("ad"));
				urun.setGoruntu(rs.getString("goruntu"));
				urun.setEmail(rs.getString("email"));
				urun.setKategori(rs.getString("kategori"));
				urun.setSayi(rs.getInt("sayi"));
				urun.setFiyat(rs.getDouble("fiyat"));
				UrunList.add(urun);
				
			}
			psmnt.close();
			return UrunList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public ArrayList<Urun> getProductsByCompany(String email){
		ArrayList<Urun> UrunList = new ArrayList<>();
		query="SELECT * FROM urun WHERE email=?";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setString(1, email);
			rs= psmnt.executeQuery();
			while(rs.next()) {
				Urun urun = new Urun();
				urun.setUrunId(rs.getInt("urunID"));
				urun.setAd(rs.getString("ad"));
				urun.setGoruntu(rs.getString("goruntu"));
				urun.setEmail(rs.getString("email"));
				urun.setKategori(rs.getString("kategori"));
				urun.setSayi(rs.getInt("sayi"));
				urun.setFiyat(rs.getDouble("fiyat"));
				UrunList.add(urun);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return UrunList;
	}
	
  public void UpdateProduct(Urun urun){
	  query="UPDATE urun SET ad=? ,goruntu=? ,kategori=?,sayi=?,fiyat=? WHERE email=? and urunID=?";
	  try {
		  psmnt = con.prepareStatement(query);
		  psmnt.setString(1, urun.getAd());
		  psmnt.setString(2,urun.getGoruntu());
		  psmnt.setString(3, urun.getKategori());
		  psmnt.setInt(4, urun.getSayi());
		  psmnt.setDouble(5,urun.getFiyat());
		  psmnt.setString(6,urun.getEmail());
		  psmnt.setInt(7,urun.getUrunId());
		  psmnt.execute();
		  psmnt.close();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
  }
  
  public void DeleteProduct(String id) {
	  query="DELETE FROM urun WHERE urunID=?";
	  try {
		  psmnt = con.prepareStatement(query);
		  psmnt.setString(1, id);
		  psmnt.execute();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
  }
  
  public void DeleteEmailProduct(String email) {
	  query="DELETE FROM urun WHERE email=?";
	  try {
		  psmnt=con.prepareStatement(query);
		  psmnt.setString(1,email);
		  psmnt.execute();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
  }
  
}
