package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mushing.reports.models.MemberEvent;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by roman on 15.11.16.
 */
@Service
public class MemberEventManager {
    public MemberEvent create(MemberEvent memberEvent){
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(memberEvent);
            transaction.commit();
            return memberEvent;
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
            Query createQuery = session.createQuery("delete from MemberEvent where id =:id");
            createQuery.setParameter("id", id);
            createQuery.executeUpdate();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public MemberEvent get(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from MemberEvent where id = :id");
            query.setParameter("id", id);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                return (MemberEvent) queryList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<MemberEvent> getByEventId(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from MemberEvent where idevent = :id");
            query.setParameter("id", id);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                return (List<MemberEvent>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<MemberEvent> getAll(){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from MemberEvent");
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<MemberEvent>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public void edit(MemberEvent memberEvent){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            session.saveOrUpdate(memberEvent);
            session.flush();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<MemberEvent> search(String name){
        String search="%"+name+"%";
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from MemberEvent where lower(CONCAT(surname || ' ' || name || ' ' || fathername)) like lower(:name) ");
            query.setParameter("name", search);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<MemberEvent>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
}
