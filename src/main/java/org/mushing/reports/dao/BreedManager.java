package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mushing.reports.models.Breed;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by roman on 13.11.16.
 */
@Service
public class BreedManager {
    public Breed create(Breed breed){
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(breed);
            transaction.commit();
            return breed;
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
            Query createQuery = session.createQuery("delete from Breed where id =:id");
            createQuery.setParameter("id", id);
            createQuery.executeUpdate();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Breed get(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Breed where id = :id");
            query.setParameter("id", id);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                return (Breed) queryList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<Breed> getAll(){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Breed");
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Breed>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public void edit(Breed breed){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            session.saveOrUpdate(breed);
            session.flush();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
