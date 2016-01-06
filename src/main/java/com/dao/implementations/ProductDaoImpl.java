package com.dao.implementations;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProductDao;
import com.model.Product;

import org.hibernate.*;


@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SessionFactory session;
	
	public ProductDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		session.getCurrentSession().save(product);
	}

	@Override
	public void editProduct(Product product) {
		// TODO Auto-generated method stub
		session.getCurrentSession().update(product);
		
	}

	@Override
	public void deleteProduct(Product product) {
		
		session.getCurrentSession().delete(product);
		
		
//		Transaction tr = null;
//		try
//		{
//			tr= ((Session) session).beginTransaction();
//			session.getCurrentSession().delete(product);
//			((Session) session).getTransaction().commit();
//		}
//		catch(RuntimeException e)
//		{
//			if (tr!= null){
//				tr.rollback();
//			}
//			e.printStackTrace();
//		}
//		finally{
//			((Session) session).flush();
//			session.close();
//		}
		
		/*String codigo="";
		Query query = session.getCurrentSession().createQuery("delete from product where productId= :codigo");
		query.setString("codigo", codigo);
		query.executeUpdate(); */
	}
	
//	@Override
//	public void deleteProduct(int codeProduct) 
//	{
//		Product product= getProduct(codeProduct);
//		session.getCurrentSession().delete(product);
//	}

	@Override
	public Product getProduct(int productId) {
		// TODO Auto-generated method stub
		return (Product) session.getCurrentSession().get(Product.class, productId);
	}


	@Override
	public List getAllProducts() {
		
		String query="from Product";
		return session.getCurrentSession().createQuery(query).list();
	}


	
	
}
