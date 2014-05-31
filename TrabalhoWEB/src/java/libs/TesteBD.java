/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package libs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class TesteBD {

//Objeto que guarda informacoes da conexao com o SGBD.
private Connection conn;
//Objeto usado para enviar comandos SQL no SGBD
private Statement stmt;


public TesteBD() {

	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
        String conexao = "jdbc:mysql://localhost/carona";
        String usuario = "root", senha = "";
        conn = DriverManager.getConnection(conexao, usuario, senha);
    
		stmt = conn.createStatement();

		System.out.println("Conexão OK!!!");

		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("Erro");
	}
}

public static void main(String args[]) {
	TesteBD t = new TesteBD();
}
		
}