package liliana.java_web_hackathon.model.service;

import java.util.List;

public interface IGenericService<T,E> {
    List<T> getAll ();
    void save (T t);
    List<T> getByName (String name);
    T getById (E id);
    boolean delete (E id);
}
