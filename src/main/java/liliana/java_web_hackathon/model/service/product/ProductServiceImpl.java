package liliana.java_web_hackathon.model.service.product;

import liliana.java_web_hackathon.model.dao.product.ProductDAOImpl;
import liliana.java_web_hackathon.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductDAOImpl productDAO;
    @Override
    public List<Product> getAll() {
        return productDAO.getAll();
    }

    @Override
    public void save(Product product) {

    }

    @Override
    public List<Product> getByName(String name) {
        return productDAO.getByName(name);
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
