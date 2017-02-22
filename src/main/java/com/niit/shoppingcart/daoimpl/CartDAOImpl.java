package com.niit.shoppingcart.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.model.CartItem;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO
{
	@Autowired
	private SessionFactory sf;
	public void setSessionFactory(SessionFactory sf) {
		this.sf = sf;
	}
	@Transactional
	public void add(CartItem cartItem) 
	{
		
		sf.getCurrentSession().save(cartItem);
	}

	@Transactional
	public CartItem get1(int id) {
		Session session = sf.getCurrentSession();
		return (CartItem) session.get(CartItem.class, id);		
	}

	@Transactional
	public List getAllItems()
	{
        Session session =sf.openSession();
        List blist1 = session.createQuery("from CartItem").list();
        return blist1;
	
	}
	@Transactional
	public void remove(int id)
	{
		Session session = sf.openSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		CartItem chartItem=(CartItem)session.load(CartItem.class, id);
		session.delete(chartItem);	
		tx.commit();
		session.close();
				
	}
	
	@Transactional
	public void removeAll() 
	{
		List<CartItem> cartItems = getAllItems();
		for(CartItem item: cartItems) 
		{
			remove(item.cartItemId);
		}
		
		
	}
	@Transactional
	public void update(int cartItemId,int quantity) 
	{
		Session session=sf.openSession();
		org.hibernate.Transaction tx=session.beginTransaction();
		CartItem cartItem=(CartItem)session.load(CartItem.class, cartItemId);
	    session.saveOrUpdate(cartItem);
		tx.commit();
	}
//	public void add(CartDAO cartItem) {
//		
//	}
//	public CartDAO get11(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//	public void add1(CartDAO cartItem) {
//		
//	}
//
//	public CartDAO get111(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	public void add2(CartDAO cartItem) {
//		// TODO Auto-generated method stub
//		
//	}
//	
//	public CartItem get011(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//	public void add00(CartDAO cartItem) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	public CartDAO get10(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	@Override
//	public CartItem get(int id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	@Override
	public CartItem get(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}