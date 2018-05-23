package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entities.Product;

public class ProductDao extends DbManager {

	// get map product
	public HashMap<Integer, Product> getAllProductMap() {
		HashMap<Integer, Product> map = new HashMap<>();
		String sql = "select * from product";
		PreparedStatement pstm;
		ResultSet rs;
		Product product;

		openConnection();
		if (connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
					map.put(product.getId(), product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return map;
	}

	// get map product id and subCategoryId
	public HashMap<Integer, Integer> getProductMap() {
		String sql = "Select * from product";
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

		openConnection();
		try {
			PreparedStatement pstm = connection.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				map.put(rs.getInt("id"), rs.getInt("sub_category_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return map;
	}

	public ArrayList<Product> getListProductBySubCategoryId(int subCategoryId) {
		ArrayList<Product> listProduct = null;
		String sql = "select * from product where sub_category_id = ?";
		PreparedStatement pstm;
		ResultSet rs;
		Product product;
		openConnection();
		if (connection != null) {
			try {
				listProduct = new ArrayList<>();
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, subCategoryId);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
					listProduct.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listProduct;
	}
	public Product getProductBySubCategoryId(int subCategoryId){
		Product product = null;
		String sql = "select * from product where sub_category_id = ?";
		PreparedStatement pstm;
		ResultSet rs;
		openConnection();
		if (connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, subCategoryId);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
					return product;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return product;
	}

	public Product getProduct(int productId) {
		Product product = null;
		String sql = "select * from product where id = ?";
		PreparedStatement pstm;
		ResultSet rs;
		openConnection();
		if (connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, productId);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return product;
	}

	public ArrayList<Product> getListProduct(int subCategoryId, int first, int max) {
		ArrayList<Product> listProduct = null;
		String sql = "select * from product where sub_category_id = ? limit ?,?";
		PreparedStatement pstm;
		ResultSet rs;
		Product product;
		openConnection();
		if (connection != null) {
			try {
				listProduct = new ArrayList<>();
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, subCategoryId);
				pstm.setInt(2, first);
				pstm.setInt(3, max);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
					listProduct.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listProduct;
	}

	public ArrayList<Product> getLastProduct(int limit) {
		ArrayList<Product> listProduct = null;
		String sql = "select * from product ORDER BY id DESC LIMIT ?";
		PreparedStatement pstm;
		ResultSet rs;
		Product product;
		openConnection();
		if (connection != null) {
			try {
				listProduct = new ArrayList<>();
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, limit);
				rs = pstm.executeQuery();
				while (rs.next()) {
					product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setDescription(rs.getString("description"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getInt("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setSubCategoryId(rs.getInt("sub_category_id"));
					listProduct.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listProduct;
	}

	public int countTotal(int subCategoryId) {
		int count = 0;
		String sql = "select * from product where sub_category_id = ?";
		PreparedStatement pstm;
		ResultSet rs;
		openConnection();
		if (connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				pstm.setInt(1, subCategoryId);
				rs = pstm.executeQuery();
				while (rs.next()) {
					count++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}

	public boolean save(String name, String description, Integer price, String image, Integer quantity, Integer sub_category_id) {
		boolean result = false;
		PreparedStatement pstm;
		StringBuilder sql = new StringBuilder("");

		openConnection();
		if (connection != null) {
		    try {
			sql.append("insert into product (name, description, price, image, quantity, sub_category_id) values(N?,N?,?,?,?,?)");
			pstm = connection.prepareStatement(sql.toString());
			int i = 0;
			pstm.setString(++i, name);
			pstm.setString(++i, description);
			pstm.setInt(++i, price);
			pstm.setString(++i, image);
			pstm.setInt(++i, quantity);
			pstm.setInt(++i, sub_category_id);
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
	
	public int getNumberProduct(){
		String sql = "select * from product";
		PreparedStatement pstm;
		ResultSet rs;
		openConnection();
		int num = 0;
		if(connection != null) {
			try {
				pstm = connection.prepareStatement(sql);
				rs = pstm.executeQuery();
				while(rs.next()) {
					num++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return num;
	}
	
	public static void main(String[] args) {
		ProductDao dao = new ProductDao();
		// dao.getAllProductMap();
		// HashMap map = dao.getProductMap();
		// System.out.print(map.get(new Integer(3)));
		ArrayList<Product> listProduct = dao.getLastProduct(90);
		for (Product product : listProduct) {
			System.out.println(product.getId() + "-" + product.getName());
		}
	}
}
