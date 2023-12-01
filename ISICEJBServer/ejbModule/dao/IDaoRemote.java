package dao;

import java.util.List;

import entities.Hotel;
import entities.Ville;
import jakarta.ejb.Remote;

@Remote
public interface IDaoRemote <T> {
	
	 boolean create(T o);
	 boolean delete(T o);
	 boolean update(T o);
	 T findById(int id);
	 List<T> findAll();
	List<Hotel> findByVille(String nom);

}
