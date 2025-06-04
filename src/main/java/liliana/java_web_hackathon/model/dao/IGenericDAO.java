package liliana.java_web_hackathon.model.dao;

import java.util.List;

public interface IGenericDAO<T,E> {
    List<T> getAll ();
    void save (T t);
    List<T> getByName (String name);
    T getById (E id);
    boolean delete (E id);
}
