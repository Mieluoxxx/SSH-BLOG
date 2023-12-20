package com.blog.dao.impl;

import com.blog.dao.BaseDAO;
import com.blog.entity.Essay;
import org.hibernate.FlushMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@Scope("prototype")
public class BaseDAOImpl implements BaseDAO {

    private HibernateTemplate ht;

    @Autowired
    public void setHt(HibernateTemplate ht) {
        this.ht = ht;
    }

    private HibernateTemplate getHt() {
        ht.setCacheQueries(true);
        ht.getSessionFactory().getCurrentSession().setHibernateFlushMode(FlushMode.AUTO);
        return ht;
    }

    @Override
    public boolean add(Object o) {
        try {
            this.getHt().save(o);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Object o) {
        try {
            this.getHt().delete(o);
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Object o) {
        try {
            this.getHt().update(o);
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List find(Object o) {
        return this.getHt().findByExample(o);
    }

    @Override
    public List findByHQL(String queryStr) {
        return this.getHt().find(queryStr);
    }

    @Override
    public List search(String keyword) {
        String hql = "FROM Essay e WHERE e.title LIKE :keyword ORDER BY e.time DESC";
        return getHt().findByNamedParam(hql, "keyword", "%" + keyword + "%");
    }
}
