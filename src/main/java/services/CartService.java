package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Models.Cart;

public class CartService {
	Connection con;
	PreparedStatement psmnt;
	String query;
	ResultSet rs;
	public CartService() {
	}
	
	public CartService(Connection con) {
		this.con=con;
	}
	
	
	public void addToCart(Cart cart)  {
		query="UPDATE cart SET Say=Say+1 WHERE urunID=? AND email=?";
	    try {
			psmnt = con.prepareStatement(query);
			psmnt.setInt(1, cart.getUrunId());
			psmnt.setString(2,cart.getEmail());
			int s = psmnt.executeUpdate();
			if(s==0) {
				
				query="INSERT INTO cart(urunID,Say,email) VALUES(?,?,?)";
				try {
					psmnt=con.prepareStatement(query);
					psmnt.setInt(1,cart.getUrunId());
					psmnt.setInt(2,cart.getSayi());
					psmnt.setString(3,cart.getEmail());
					psmnt.execute();
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	}
	
	public ArrayList<Cart> getCartProducts(String email){
		ArrayList<Cart> cartList= new ArrayList<>();
		query="SELECT u.urunID,u.ad,u.kategori,u.fiyat,c.Say,u.email FROM urun u JOIN cart c  ON u.urunID =c.urunID WHERE c.email=?";
		try {
			psmnt=con.prepareStatement(query);
			psmnt.setString(1,email);
			rs=psmnt.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setUrunId(rs.getInt("urunId"));
				cart.setAd(rs.getString("ad"));
				cart.setKategori(rs.getString("kategori"));
				cart.setFiyat(rs.getDouble("fiyat"));
				cart.setSayi(rs.getInt("Say"));
				cart.setEmail(rs.getString("email"));
				cartList.add(cart);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return cartList;
		
	}
	
	public void deleteCartProduct(int id,String email) {
		query="DELETE FROM cart WHERE urunID=? AND email=?";
		try {
			psmnt=con.prepareStatement(query);
			psmnt.setInt(1,id);
			psmnt.setString(2,email);
			psmnt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void uptQuantity(int id,int say,String gmail) {
		query="UPDATE cart SET Say=? WHERE urunID=? AND email=?";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setInt(1,say);
			psmnt.setInt(2,id);
			psmnt.setString(3,gmail);
			psmnt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public double cartCost(ArrayList<Cart> list) {
		double sum=0;
		for(Cart cart:list) {
			sum+=cart.getFiyat()*cart.getSayi();
		}
		return sum;
	}
	
	public int getCount(ArrayList<Cart> list) {
		int sum=0;
		for(Cart cart:list) {
			sum+=cart.getSayi();
		}
		return sum;
		
	}

}
