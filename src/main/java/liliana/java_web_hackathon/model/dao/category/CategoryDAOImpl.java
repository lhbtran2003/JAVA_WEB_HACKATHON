package liliana.java_web_hackathon.model.dao.category;

import liliana.java_web_hackathon.configs.DBConnection;
import liliana.java_web_hackathon.model.entity.Category;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoryDAOImpl implements ICategoryDAO {
    private final String GETALL = "{CALL GetLatestCategories()}";
    private final String INSERT = "{CALL AddCategory(?,?) }";
    private final String UPDATE = "{CALL UpdateCategory(?,?,?,?) }";
    private final String DELETE = "{CALL DeleteCategoryById(?) }";
    private final String GETBY_ID = "{CALL GetCategoryById(?) }";
    private final String GETBY_NAME = "{CALL SearchCategoryByName(?) }";

    @Override
    public List<Category> getAll() {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(GETALL);
            ResultSet rs = call.executeQuery();
            List<Category> categories = new ArrayList<>();
            return addCategoryInList(categories, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void save(Category category) {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(INSERT);
            call.setString(1, category.getCategoryName());
            call.setString(2, category.getDescription());
            call.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Category> getByName(String name) {
        Connection con = DBConnection.getConnection();
        List<Category> list = new ArrayList<>();
        try {
            CallableStatement call = con.prepareCall(GETBY_NAME);
            call.setString(1, name);
            ResultSet rs = call.executeQuery();
            return addCategoryInList(list, rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private List<Category> addCategoryInList(List<Category> list, ResultSet rs) throws SQLException {
        while (rs.next()) {
            int statusInDB = rs.getInt("status");
            boolean status = statusInDB == 1;
            Category category = new Category(
                    rs.getInt("category_id"),
                    rs.getString("category_name"),
                    rs.getString("description"),
                    status
            );
            list.add(category);
        }
        return list;
    }

    @Override
    public Category getById(Integer id) {
        Connection con = DBConnection.getConnection();
        try {
            CallableStatement call = con.prepareCall(GETBY_ID);
            call.setInt(1, id);
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                int statusInDB = rs.getInt("status");
                boolean status = statusInDB == 1;
                return new Category(
                        rs.getInt("category_id"),
                        rs.getString("category_name"),
                        rs.getString("description"),
                        status
                );
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean delete(Integer id) {
      Connection con = DBConnection.getConnection();
        try {
            if (getById(id) != null) {
                CallableStatement call = con.prepareCall(DELETE);
                call.setInt(1, id);
                call.execute();
                return true;
            } else {
                return false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
