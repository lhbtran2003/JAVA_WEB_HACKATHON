package liliana.java_web_hackathon.model.service.category;

import liliana.java_web_hackathon.model.dao.category.CategoryDAOImpl;
import liliana.java_web_hackathon.model.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryDAOImpl categoryDAO;

    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public void save(Category category) {
        categoryDAO.save(category);
    }

    @Override
    public List<Category> getByName(String name) {
        return categoryDAO.getByName(name);
    }

    @Override
    public Category getById(Integer id) {
        return null;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
