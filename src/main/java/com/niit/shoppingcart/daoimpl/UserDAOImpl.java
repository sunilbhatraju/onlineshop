package com.niit.shoppingcart.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Login;
import com.niit.shoppingcart.model.UserDetails;


@Repository("LoginDAO")
public class UserDAOImpl implements UserDAO {
	  Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
		 
		@Autowired
		private SessionFactory sessionFactory;


		public UserDAOImpl(SessionFactory sessionFactory) {
			try {
				this.sessionFactory = sessionFactory;
			} catch (Exception e) {
				log.error(" Unable to connect to db");
				e.printStackTrace();
			}
		}

		@Transactional
		public List<UserDetails> list() {
			@SuppressWarnings("unchecked")
			List<UserDetails> list = (List<UserDetails>) sessionFactory.getCurrentSession()
					.createCriteria(UserDetails.class)
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

			return list;
		}

		@Transactional
		public void save(UserDetails LoginDetails) {
			sessionFactory.getCurrentSession().save(LoginDetails);
		}
		
		@Transactional
		public void delete(int id) {
			UserDetails LoginDetails = new UserDetails();
			LoginDetails.setId(id);
			sessionFactory.getCurrentSession().delete(LoginDetails);
		}

		@Transactional
		public UserDetails get(int id) {
			String hql = "from Register where id=" + "'"+ id+"'";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			
			@SuppressWarnings("unchecked")
			List<UserDetails> list = (List<UserDetails>) query.list();
			
			if (list != null && !list.isEmpty()) {
				return list.get(0);
			}
			
			return null;
		}
		
		@Transactional
		public boolean isValidLoginDetails(int id, String password) {
			String hql = "from Register where id= '" + id + "' and " + " password ='" + password+"'";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			
			@SuppressWarnings("unchecked")
			List<UserDetails> list = (List<UserDetails>) query.list();
			
			if (list != null && !list.isEmpty()) {
				return true;
			}
			
			return false;
		}

		public void update(UserDetails LoginDetails) {
			sessionFactory.getCurrentSession().update(LoginDetails);
			
		}

		@Transactional
		public void saveorUpdate(UserDetails registerLogin) {
			sessionFactory.getCurrentSession().saveOrUpdate(registerLogin);
			
		}
		@Transactional
		public void saveorUpdate(Login loginLogin)
		{
			sessionFactory.getCurrentSession().saveOrUpdate(loginLogin);
		}
		@Transactional

		public Login getSingleLogin1(int id) {
			Session session = sessionFactory.openSession();
			Login Login = (Login) session.load(Login.class, id);
			return Login;
		}
		@Transactional

		public List getAllLogins() {
			Session session = sessionFactory.openSession();
			List list = session.createQuery("from Authorities").list();
			System.out.println(list);
			
			session.close();
			return list;
		}
		@Transactional
		public void update(Login editlogin) {
			sessionFactory.getCurrentSession().update(editlogin);
			
		}
		public void update1(Login editlogin) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public Login getSingleUser(int id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List getAllUsers() {
			// TODO Auto-generated method stub
			return null;
		}

	}
