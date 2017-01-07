package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mushing.reports.models.Member;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by roman on 15.11.16.
 */
@Service
public class MemberManager {
    public Member create(Member member){
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(member);
            transaction.commit();
            return member;
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
            Query createQuery = session.createQuery("delete from Member where id =:id");
            createQuery.setParameter("id", id);
            createQuery.executeUpdate();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Member get(int id){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Member where id = :id");
            query.setParameter("id", id);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                return (Member) queryList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<Member> getAllFromFeder(){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Member where inFeder=TRUE");
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Member>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<Member> getAllFromNotFeder(){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Member where inFeder=FALSE");
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Member>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public void edit(Member member){
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            session.saveOrUpdate(member);
            session.flush();
            beginTransaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<Member> birthMembers() {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("from Member where MONTH(datebirth)=MONTH(CURRENT_DATE) and inFeder=TRUE");
            List<Member> list = query.list();
            return list;
        } finally {
            session.close();
        }
    }

    public List<Member> searchFeder(String name){
        String search="%"+name+"%";
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Member where lower(CONCAT(surname || ' ' || name || ' ' || fathername)) like lower(:name) and inFeder=TRUE");
            query.setParameter("name", search);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Member>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    public List<Member> searchNotFeder(String name){
        String search="%"+name+"%";
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Transaction beginTransaction = session.beginTransaction();
            Query query = session.createQuery("from Member where lower(CONCAT(surname || ' ' || name || ' ' || fathername)) like lower(:name) and inFeder=FALSE");
            query.setParameter("name", search);
            List queryList = query.list();
            beginTransaction.commit();
            if (queryList != null && queryList.isEmpty()) {
                return null;
            } else {
                System.out.println("list " + queryList);
                return (List<Member>) queryList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
}
