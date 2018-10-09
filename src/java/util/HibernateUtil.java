package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    
    private static SessionFactory sf;
    
    static{
        try{
            sf = new Configuration().configure().buildSessionFactory();
        }catch(Throwable ex){
            ex.printStackTrace();
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory(){
        return sf;
    }
    
    public static void fechar(){
        getSessionFactory().close();
    }
}
