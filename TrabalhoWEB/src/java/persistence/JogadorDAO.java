/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import model.Jogador;
import java.sql.*;

/**
 *
 * @author acer
 */
public class JogadorDAO {

    private Connection connection;

    public JogadorDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    public void salvar(Jogador usuario) throws SQLException {
        PreparedStatement statement;
        String SQL = "INSERT INTO usuario"
                + "(username, email, senha) VALUES(' "
                + usuario.getUsuario() + " ', ' "
                + usuario.getEmail() + " ', ' "
                + usuario.getSenha() + " ' )";
        statement = connection.prepareStatement(SQL);

        statement.executeUpdate();
    }

}
