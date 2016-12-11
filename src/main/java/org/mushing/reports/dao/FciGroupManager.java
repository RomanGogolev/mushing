package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mushing.reports.models.Fcigroup;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by roman on 11.12.16.
 */
@Service
public class FciGroupManager {
    public Fcigroup create(Fcigroup fcigroup){
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(fcigroup);
            transaction.commit();
            return fcigroup;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void delete(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query createQuery = session.createQuery("delete from Fcigroup where id =:id");
            createQuery.setParameter("id", id);
            createQuery.executeUpdate();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Fcigroup get(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Fcigroup where id = :id");
            query.setParameter("id", id);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                return (Fcigroup) queryList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<Fcigroup> getAll(){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Fcigroup");
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Fcigroup>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public void edit(Fcigroup fcigroup){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            session.saveOrUpdate(fcigroup);
            session.flush();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
