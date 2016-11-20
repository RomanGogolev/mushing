package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mushing.reports.models.User;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserManager {

    /*
    This method create user by username for authenticate
     */
    public User getUser(String username) {
        Session session=null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from User where username=:username");
            query.setParameter("username",username);
            List<User> list = query.list();
            return list.get(0);
        }finally {
            session.close();
        }

    }

    public User create(User user){
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
