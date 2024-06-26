package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Models.Musteri;

public class ClientService {
	
	Connection con;
	String query;
	PreparedStatement psmnt;
	ResultSet rs;
	
	
	public ClientService(Connection con) {
		this.con=con;
		
	}
	
	
	public ArrayList<Musteri> getClients(){
		ArrayList<Musteri> clientList = new ArrayList<>();
		Musteri mus = new Musteri();
		query = "select * FROM musteri WHERE email!=\"super@345\"";
		try {
			psmnt = con.prepareStatement(query);
			rs=psmnt.executeQuery();
			while(rs.next()) {
				Musteri musteri = new Musteri();
				musteri.setAd(rs.getString("ad"));
				musteri.setSoyad(rs.getString("soyad"));
				musteri.setEmail(rs.getString("email"));
				musteri.setSifre(rs.getString("sifre"));
				clientList.add(musteri);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return clientList;
	}
	
	public void removeClient(String email) {
		query="DELETE FROM musteri WHERE email=?";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setString(1,email);
		    psmnt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public  String uptUser(Musteri m) {
		query="UPDATE musteri SET ad=? ,soyad=?,sifre=? WHERE email=? ";
		try {
			psmnt = con.prepareStatement(query);
			psmnt.setString(1, m.getAd());
			psmnt.setString(2, m.getSoyad());
			psmnt.setString(3, m.getSifre());
			psmnt.setString(4,m.getEmail());
			psmnt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "+";
		
		
	}

}
