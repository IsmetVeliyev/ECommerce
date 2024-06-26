package services;
import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderService {
	Connection con;
	PreparedStatement psmnt;
	String query;
	ResultSet rs;
	
	public OrderService(Connection con) {
		this.con=con;
	}
	
	public void setOrders(Order order){
		query="INSERT INTO orders(email,urunID,tarih,Say,odeme)VALUES(?,?,?,?,?)";
		try {
			psmnt=con.prepareStatement(query);
			psmnt.setString(1,order.getEmail());
			psmnt.setInt(2,order.getUrunId());
			psmnt.setString(3,order.getTarih());
			psmnt.setInt(4,order.getSayi());
			psmnt.setString(5,order.getYontem());
			psmnt.execute();
			psmnt.close();
			System.out.println("burdayim");
			CartService cservice = new CartService(this.con);
			cservice.deleteCartProduct(order.getUrunId(),order.getEmail());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	public ArrayList<Order> getOrders(String email){
		ArrayList<Order> listOrder = new ArrayList<>();
		System.out.println("getOrders fonksiyonu "+email);
		query = "select * FROM orders o JOIN urun u ON u.urunID=o.urunID where o.email=?";
		try {
			psmnt=con.prepareStatement(query);
			psmnt.setString(1, email);
			rs = psmnt.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setEmail(rs.getString("email"));
				order.setUrunId(rs.getInt("urunID"));
				order.setTarih(rs.getString("tarih"));
				order.setSayi(rs.getInt("Say"));
				order.setYontem(rs.getString("odeme"));
				order.setAd(rs.getString("ad"));
				order.setFiyat(rs.getDouble("fiyat"));
				order.setKategori(rs.getString("kategori"));
				listOrder.add(order);
			}
			psmnt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listOrder;
		
	}
	
	public void deleteOrder(String id,String gmail,String tarih) {
		query="DELETE FROM orders WHERE urunID=? AND email=? AND tarih=?";
		try {
			psmnt=con.prepareStatement(query);
			psmnt.setString(1,id);
			psmnt.setString(2,gmail);
			psmnt.setString(3,tarih);
			psmnt.execute();
			psmnt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
   public void UptOrder(int id,int say,String Tarih,String gmail) {
	   query="UPDATE orders SET Say=? WHERE urunID=? AND tarih=? AND email=?";
	   try {
		   psmnt=con.prepareStatement(query);
		   psmnt.setInt(1,say);
		   psmnt.setInt(2,id);
		   psmnt.setString(3, Tarih);
		   psmnt.setString(4,gmail);
		   psmnt.execute();
		   psmnt.close();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
   }

}
