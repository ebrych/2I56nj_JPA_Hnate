package com.hibernate.crud.operation;

import java.util.ArrayList;

import javax.persistence.Query;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import java.util.List;

public class DbOperations {

	//configuracion
		static Session sessionObj;
		static SessionFactory sessionFactoryObj;
		
		public final static Logger logger = Logger.getLogger(DbOperations.class);
		
		private static SessionFactory buildSessionFactory() {
			Configuration configObj = new Configuration();
			configObj.configure("hibernate.cfg.xml");
			configObj.addAnnotatedClass(com.hibernate.crud.operation.Student.class);
			BasicConfigurator.configure();
			
			ServiceRegistry serviceRegistryObj = new StandardServiceRegistryBuilder().
					applySettings(configObj.getProperties()).
					build();
			
			sessionFactoryObj = configObj.buildSessionFactory(serviceRegistryObj);
			

			return sessionFactoryObj;
		}
		
		//crud
		
		public static String pruebaMsj(){
			return "hola mundo";
		}
		
		//insertar
		public static void createRecord(String nombre,String apellido,String correo,String fecha,String pension) {
			int count = 0;
			Student studentObj = null;
			try {
				// Getting Session Object From SessionFactory
				sessionObj = buildSessionFactory().openSession();
				// Getting Transaction Object From Session Object
				sessionObj.beginTransaction();

				// Creating Transaction Entities
				studentObj = new Student();
				studentObj.setStudentNombre(nombre);
				studentObj.setStudentApellido(apellido);
				studentObj.setStudentMail(correo);
				studentObj.setStudentFechaNacimiento(fecha);
				studentObj.setStudentPension(pension);
				sessionObj.save(studentObj);
				
				// Committing The Transactions To The Database
				sessionObj.getTransaction().commit();
				logger.info("\nSuccessfully Created '" + count + "' Records In The Database!\n");
			} catch(Exception sqlException) {
				if(null != sessionObj.getTransaction()) {
					logger.info("\n.......Transaction Is Being Rolled Back.......\n");
					sessionObj.getTransaction().rollback();
				}
				sqlException.printStackTrace();
			} finally {
				if(sessionObj != null) {
					sessionObj.close();
				}
			}
		}
		
		// Listar
			@SuppressWarnings("unchecked")
			public static List<Student> displayRecords() {
				List<Student> studentsList = new ArrayList<Student>();		
				try {
					// Getting Session Object From SessionFactory
					sessionObj = buildSessionFactory().openSession();
					// Getting Transaction Object From Session Object
					sessionObj.beginTransaction();
					studentsList = sessionObj.createQuery("FROM Student").list();
					
				} catch(Exception sqlException) {
					if(null != sessionObj.getTransaction()) {
						logger.info("\n.......Transaction Is Being Rolled Back.......\n");
						sessionObj.getTransaction().rollback();
					}
					sqlException.printStackTrace();
				} finally {
					if(sessionObj != null) {
						sessionObj.close();
					}
				}
				return studentsList;
			}
			
			//editar
			public static void updateRecord(int id,String nombre,String apellido,String correo,String fecha,String pension) {		
				Student studentObj = null;
				try {
					// Getting Session Object From SessionFactory
					sessionObj = buildSessionFactory().openSession();
					// Getting Transaction Object From Session Object
					sessionObj.beginTransaction();

					// Creating Transaction Entities
					studentObj = new Student();
					studentObj.setId(id);
					studentObj.setStudentNombre(nombre);
					studentObj.setStudentApellido(apellido);
					studentObj.setStudentMail(correo);
					studentObj.setStudentFechaNacimiento(fecha);
					studentObj.setStudentPension(pension);
					sessionObj.update(studentObj);
					//sessionObj.save(studentObj);
					
					// Committing The Transactions To The Database
					sessionObj.getTransaction().commit();
					
					
					
				} catch(Exception sqlException) {
					if(null != sessionObj.getTransaction()) {
						logger.info("\n.......Transaction Is Being Rolled Back.......\n");
						sessionObj.getTransaction().rollback();
					}
					sqlException.printStackTrace();
				} finally {
					if(sessionObj != null) {
						sessionObj.close();
					}
				}
			}
			
			// delete
			public static void deleteRecord(Integer student_id) {
				try {
					// Getting Session Object From SessionFactory
					sessionObj = buildSessionFactory().openSession();
					// Getting Transaction Object From Session Object
					sessionObj.beginTransaction();

					Student studObj = findRecordById(student_id);
					sessionObj.delete(studObj);

					// Committing The Transactions To The Database
					sessionObj.getTransaction().commit();
					logger.info("\nStudent With Id?= " + student_id + " Is Successfully Deleted From The Database!\n");
				} catch(Exception sqlException) {
					if(null != sessionObj.getTransaction()) {
						logger.info("\n.......Transaction Is Being Rolled Back.......\n");
						sessionObj.getTransaction().rollback();
					}
					sqlException.printStackTrace();
				} finally {
					if(sessionObj != null) {
						sessionObj.close();
					}
				}
			}

			// buscaPor Id
			public static Student findRecordById(Integer id) {
				Student findStudentObj = null;
				try {
					// Getting Session Object From SessionFactory
					sessionObj = buildSessionFactory().openSession();
					// Getting Transaction Object From Session Object
					sessionObj.beginTransaction();
					findStudentObj = sessionObj.load(Student.class, id);
					
				} catch(Exception sqlException) {
					if(null != sessionObj.getTransaction()) {
						logger.info("\n.......Transaction Is Being Rolled Back.......\n");
						sessionObj.getTransaction().rollback();
					}
					sqlException.printStackTrace();
				} 
				return findStudentObj;
			}	
	
}
