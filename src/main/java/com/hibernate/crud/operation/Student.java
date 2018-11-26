package com.hibernate.crud.operation;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="tb_alumno")


public class Student {
	
	@Id
	@Column(name="idAlumno")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="nombre")
	private String studentNombre;
	
	@Column(name="apellido")
	private String studentApellido;
	
	@Column(name="correo")
	private String studentMail;
	
	@Column(name="fechaNacimiento")
	private String studentFechaNacimiento;
	
	@Column(name="pension")
	private String studentPension;

	//objeto Sources
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStudentNombre() {
		return studentNombre;
	}

	public void setStudentNombre(String studentNombre) {
		this.studentNombre = studentNombre;
	}

	public String getStudentApellido() {
		return studentApellido;
	}

	public void setStudentApellido(String studentApellido) {
		this.studentApellido = studentApellido;
	}

	public String getStudentMail() {
		return studentMail;
	}

	public void setStudentMail(String studentMail) {
		this.studentMail = studentMail;
	}

	public String getStudentFechaNacimiento() {
		return studentFechaNacimiento;
	}

	public void setStudentFechaNacimiento(String studentFechaNacimiento) {
		this.studentFechaNacimiento = studentFechaNacimiento;
	}

	public String getStudentPension() {
		return studentPension;
	}

	public void setStudentPension(String studentPension) {
		this.studentPension = studentPension;
	}
	
	
	
	
	
	
}
