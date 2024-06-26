package services;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Models.Musteri;
import jakarta.servlet.http.HttpServletRequest;

public class LgRgService {
	Connection con;
	PreparedStatement psmnt;
	String query;
	
	
	public LgRgService(Connection con) {
		this.con=con;
	}
	
	public  boolean Register(Musteri musteri)  {
		query="INSERT INTO musteri (ad,soyad,email,sifre)VALUES(?,?,?,?)";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setString(1, musteri.getAd());
			psmnt.setString(2, musteri.getSoyad());
			psmnt.setString(3, musteri.getEmail());
			psmnt.setString(4, musteri.getSifre());
			psmnt.execute();
			psmnt.close();	
		}catch(Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
		return true;
		
	}
	
	public Musteri Login(String gmail,String psw) throws Exception {
		query = "SELECT * FROM musteri WHERE email=? and sifre=? ";
		psmnt = con.prepareStatement(query);
		psmnt.setString(1,gmail);
		psmnt.setString(2,psw);
		Musteri musteri = new Musteri();
		ResultSet rs = psmnt.executeQuery(); 
		if(rs.next()) {
			musteri.setAd(rs.getString("ad"));
			musteri.setSoyad(rs.getString("soyad"));
			musteri.setEmail(rs.getString("email"));
		}
		psmnt.close();
		return musteri;
			
	}

}
