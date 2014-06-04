/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import persistence.ConnectionFactory;
import java.sql.*;
import model.Jogador;
/**
 *
 * @author acer
 */
public class JogadorDAO {

    private Connection connection;

    public JogadorDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    
    public Jogador consultaPrimeira(String nome) throws SQLException{
        Jogador jogador;
        PreparedStatement statement;
        ResultSet set;
        String SQL = "SELECT * FROM jogador  ";
                                      //  + "WHERE nome = ' " + nome +  " ' ";
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();

        if (set.next()) {
            jogador = new Jogador();
            jogador.setNome(set.getString("nome"));
            jogador.setSobrenome(set.getString("sobrenome"));
            jogador.setApelido(set.getString("apelido"));
            jogador.setEsporte(set.getString("esporte"));
            jogador.setTime(set.getString("time"));
        } else {
            jogador = null;
        }
        
        return jogador;
    }
    /*public void salvar(Jogador usuario) throws SQLException {
        PreparedStatement statement;
        String SQL = "INSERT INTO usuario"
                + "(username, email, senha) VALUES(' "
                + usuario.getUsuario() + " ', ' "
                + usuario.getEmail() + " ', ' "
                + usuario.getSenha() + " ' )";
        statement = connection.prepareStatement(SQL);

        statement.executeUpdate();
    }*/

}
