package org.mushing.reports.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.mushing.reports.services.HibernateUtil;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/**
 * Created by roman on 11.12.16.
 */
@Service
public class TimeManager {
    public Date getCurDate() {
        Session session=null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("select CURENT_DATE()");
            Date date = (Date) query.list().get(0);
            return date;
        }finally {
            session.close();
        }

    }
}
