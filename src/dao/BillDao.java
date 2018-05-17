package dao;


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import entities.Bill;
import entities.Cart;
import entities.Item;

public class BillDao extends DbManager{
	public void insertBill(Bill bill) {
		String sql = "insert into bill (cart_detail, address, phone, account_id, checked) values(?, N?, ?, ? , ?)";
		PreparedStatement pstm;
		
		openConnection();
		if(connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				int index = 0;
				pstm.setString(++index, bill.getCart().toString());
				pstm.setString(++index, bill.getAddress());
				pstm.setString(++index, bill.getPhone());
				pstm.setInt(++index, bill.getAccountId());
				pstm.setInt(++index, 0);
				pstm.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConnection();
			}
		}
	}
	
	public void importBill(Bill bill) {
		String sql = "insert into bill (cart_detail, address, phone, account_id, checked) values(?, N?, ?, ? , ?)";
		PreparedStatement pstm;
		
		openConnection();
		if(connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				int index = 0;
				pstm.setString(++index, bill.getCartString());
				pstm.setString(++index, bill.getAddress());
				pstm.setString(++index, bill.getPhone());
				pstm.setInt(++index, bill.getAccountId());
				pstm.setInt(++index, 0);
				pstm.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConnection();
			}
		}
	}
	
	public ArrayList<Bill> getListBill(int numberTrans) {
		ArrayList<Bill> listBill = 	null;
		PreparedStatement pstm;
		ResultSet rs;
		Bill bill;
		String sql = "select * from bill limit ?";
		openConnection();
		if(connection !=  null) {
			try {
				listBill = new ArrayList<>();
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, numberTrans);
				rs = pstm.executeQuery();
				while(rs.next()) {
					bill = new Bill();
					bill.setCartString(rs.getString("cart_detail"));
					bill.setAddress(rs.getString("address"));
					bill.setPhone(rs.getString("phone"));
					bill.setAccountId(rs.getInt("account_id"));
					bill.setTimeStamp(rs.getTimestamp("create_time").toString());
					bill.setChecked(rs.getInt("checked"));
					listBill.add(bill);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConnection();
			}
		}
		return listBill;
	}
	
	public boolean updateItem(String cart_detail, Integer id) {
		boolean result = false;
		PreparedStatement pstm;
		StringBuilder sql = new StringBuilder("");
		
		openConnection();
		if (connection != null) {
		    try {
			sql.append("update bill set cart_detail = ? where id = ?");
			pstm = connection.prepareStatement(sql.toString());
			int i = 0;
			pstm.setString(++i, cart_detail);
			pstm.setInt(++i, id);
			pstm.executeUpdate();
			pstm.clearBatch();
			result = true;
		    } catch (Exception e) {
			e.printStackTrace();
		    } finally {
			closeConnection();
		    }
		}

		return result;
	}
	public void importTransactionFileToCartDB(String ruleFile) {
		try(BufferedReader br = new BufferedReader(new FileReader(ruleFile))) {
		    BillDao billDao = new BillDao();
			int countCart = 0;
			for(String line; (line = br.readLine()) != null; ) {
		    	String[] datas = line.split(Pattern.quote(" "));
		    	Cart cart = new Cart();
		    	
		    	for(String data : datas) {
		    		Item item = new Item(null, 1);  		
		    		cart.addToCart(Integer.parseInt(data), item);
		    	} 
//		    	System.out.println(cart.toString());
		    	billDao.updateItem(cart.toString(), ++countCart);
		    }
			System.out.println("Import rule done!");
		    // line is not visible here.
		} catch (FileNotFoundException e) {
			System.out.println("Import rule fail!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("Import rule fail!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static void main(String []args) {
		
		BillDao billdao = new BillDao();
		String ruleFile = "product_inputx";
		billdao.importTransactionFileToCartDB(ruleFile);
//		BillDao dao = new BillDao();
//		Bill bill = new Bill();
//		bill.setCart(new Cart());
//		bill.setAddress("Kiến Xương");
//		bill.setPhone("092812391");
//		bill.setAccountId(1);
//		dao.insertBill(bill);
	}
}
