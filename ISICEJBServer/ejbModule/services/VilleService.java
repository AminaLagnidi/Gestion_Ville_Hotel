package services;

import java.util.List;

import dao.IDaoLocale;
import dao.IDaoRemote;
import entities.Hotel;
import entities.Ville;
import jakarta.annotation.security.PermitAll;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Stateless
public class VilleService implements IDaoRemote<Ville>, IDaoLocale<Ville> {
    
    @PersistenceContext
    private EntityManager em;

    @Override
	@PermitAll
    public boolean create(Ville o) {
        em.persist(o);
        return true;
    }

    @Override
    @PermitAll
    public boolean delete(Ville o) {
    	em.remove(em.contains(o) ? o: em.merge(o));
		return true;
    }

    @Override
	@PermitAll
	@Transactional
    public boolean update(Ville o) {
    	try {
	        em.merge(o);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
    }

    @Override
	@PermitAll
    public Ville findById(int id) {
        return em.find(Ville.class, id);
    }

    @Override
	@PermitAll
    public List<Ville> findAll() {
        Query query = em.createQuery("select v from Ville v");
        return query.getResultList();
    }

	@Override
	public List<Hotel> findByVille(String nom) {
		// TODO Auto-generated method stub
		return null;
	}
}
