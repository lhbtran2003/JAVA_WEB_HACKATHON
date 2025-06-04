package liliana.java_web_hackathon.model.dao.product;

import liliana.java_web_hackathon.configs.DBConnection;
import liliana.java_web_hackathon.model.entity.Category;
import liliana.java_web_hackathon.model.entity.Product;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ProductDAOImpl implements IProductDAO {
    private final String GETALL = "{CALL GetLatestProduct()}";
    private final String INSERT = "{CALL AddProduct(?,?,?,?,?) }";
    private final String UPDATE = "{CALL UpdateProduct(?,?,?,?) }";
    private final String DELETE = "{CALL DeleteProductById(?) }";
    private final String GETBY_NAME = "{CALL SearchProductByName(?) }";


    private List<Product> addProductInList(List<Product> list, ResultSet rs) throws SQLException {
        while (rs.next()) {
            int statusInDB = rs.getInt("status");
            boolean status = statusInDB == 1;
            Product product = new Product(
                    rs.getInt("product_id"),
                    rs.getString("product_name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getString("image_url"), // Directly pass imageUrl from database
                    status,
                    rs.getString("created_at"),
                    rs.getInt("category_id")
            );
            list.add(product);
        }
        return list;
    }

    @Override
    public List<Product> getAll() {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(GETALL);
            ResultSet rs = call.executeQuery();
            List<Product> products = new ArrayList<>();
            return addProductInList(products, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void save(Product product) {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(INSERT);
            call.setString(1, product.getName());
            call.setString(2, product.getDescription());
            call.setDouble(3, product.getPrice());
            call.setString(4, product.getImg_url());
            call.setInt(5, product.getCategory_id());
            call.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> getByName(String name) {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(GETBY_NAME);
            call.setString(1, name);
            ResultSet rs = call.executeQuery();
            List<Product> products = new ArrayList<>();
            return addProductInList(products, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product getById(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
