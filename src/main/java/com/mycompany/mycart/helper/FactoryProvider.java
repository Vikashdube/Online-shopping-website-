
package com.mycompany.mycart.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
// import jakarta.ws.rs.core.Configuration;

public class FactoryProvider {
    private static SessionFactory factory ;
    
    public static SessionFactory getFactory(){
        
        try {
            if (factory == null) 
                
            {  factory = (SessionFactory) new Configuration()
                        .configure("hibernate.cfg.xml")
                        .buildSessionFactory();   
                    }
            }
            catch (Exception e){
                    e.printStackTrace();
                    }
            return factory ;
        }
    
}
