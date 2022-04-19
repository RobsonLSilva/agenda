package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

public class DAO {
	/** M�dulo de conex�o **/
	// Parametros de conex�o

	private String driver = "org.postgresql.Driver";
	private String url = "jdbc:postgresql://127.0.0.1:5432/db_agenda";
	Properties props = new Properties();

	// M�todo de conex�o
	private Connection conectar() {
		Connection conn = null;
		props.setProperty("user", "robson");
		props.setProperty("password", "automa");

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, props);
			return conn;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// teste conex�o
	/*
	 * public void testeConexao() { try { Connection con = conectar();
	 * System.out.println(con); con.close(); } catch (Exception e) {
	 * System.out.println(e); } }
	 */

	/** CRUD CREATE **/
	public void inserirContato(JavaBeans contato) {
		String create = "INSERT INTO tb_contatos (nome_con, fone_con, email_con) VALUES (?, ?, ?);";
		try {
			// Abrir conex�o
			Connection con = conectar();
			// Preparar a query para execu��o no banco de dados
			PreparedStatement pst = con.prepareStatement(create);
			// Substituir os par�metros (?) pelo conte�do das vari�veis JavaBens
			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getFone());
			pst.setString(3, contato.getEmail());
			// Executar a query
			pst.executeUpdate();
			// Encerrar a conex�o com o banco de dados
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<JavaBeans> listarContatos() {
		// Cria��o de um objeto para acesso a classe JavaBeans
		ArrayList<JavaBeans> contatos = new ArrayList<>();
		String read = "SELECT * FROM tb_contatos order by nome_con;";
		try {
			// Abrir conex�o
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			// La�o � executado enquanto houver contatos
			while (rs.next()) {
				// vari�veis de apoio que recebem os dados do banco de dados
				String idcon = rs.getString(1);
				String nome = rs.getString(2);
				String fone = rs.getString(3);
				String email = rs.getString(4);

				//populando um ArrayList de objetos JavaBeans
				contatos.add(new JavaBeans(idcon, nome, fone, email));
			}
			con.close();
			return contatos;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/** CRUD UPDATE **/
	//selecionar o contato
	public void selecionarContato(JavaBeans contato) {
				String read2 = "select * from tb_contatos where id_con = ?;";
				try {
					// Abrir conex�o
					Connection con = conectar();
					PreparedStatement pst = con.prepareStatement(read2);
					pst.setString(1, contato.getIdcon());
					ResultSet rs = pst.executeQuery();
					// La�o � executado enquanto houver contatos
					while (rs.next()) {
						// Setar as vari�veis JavaBeans
						contato.setIdcon(rs.getString(1));
						contato.setNome(rs.getString(2));
						contato.setFone(rs.getString(3));
						contato.setEmail(rs.getString(4));
					}
					con.close();
				} catch (Exception e) {
					System.out.println(e);
				}
		
	}
	

}
