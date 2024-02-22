package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    // now declare a variable
    public static SessionFactory factory;
    public static SessionFactory getFactory()
    {
        // create a factory
        if(factory==null)
        {
            factory=new Configuration().configure("noteTaker.xml").buildSessionFactory();
        }

        return factory;
    }

    public  void closeFactory()
    {
        if(factory.isOpen())
        {
            factory.close();
        }
    }
}
