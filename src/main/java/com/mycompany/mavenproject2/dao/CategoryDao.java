
package com.mycompany.mavenproject2.dao;

import com.mycompany.mavenproject2.entities.Category;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    public SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat)
    {
        
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        int catId  =(int) session.save(cat);
        
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("From Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int cId)
    {
        Category cat = null;
        try {
            
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cId);
            session.close();
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cat;
    }
}
