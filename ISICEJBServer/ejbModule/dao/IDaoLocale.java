package dao;

import java.util.List;

import entities.Hotel;
import jakarta.ejb.Local;

@Local
public interface IDaoLocale <T> {
	
	boolean create(T o);
	 boolean delete(T o);
	 boolean update(T o);
	 T findById(int id);
	 List<T> findAll();
	List<Hotel> findByVille(String nom);
}
