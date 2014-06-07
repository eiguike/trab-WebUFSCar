/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Jogador;
import persistence.ConnectionFactory;
/**
 *
 * @author acer
 */
public class JogadorDAO {

    private Connection connection;
    private int numResultados;

    public JogadorDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    
    public List<Jogador> consultaPrimeira(int offset, int limite, String nome) throws SQLException{
        int i = 0;
        List<Jogador> listaJogador = new ArrayList<Jogador>();
        PreparedStatement statement;
        ResultSet set;
        
        String SQL = 
                "SELECT COUNT(*) as total FROM jogador, jogador_time, time "+
                "WHERE jogador.nome like '"+ nome+ "' AND jogador_time.jogador = jogador.id_jogador AND jogador_time.time = time.nome" ;
        System.out.println(SQL);
        
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        set.next();
        //this.setNumResultados(set.getInt(1));
        this.numResultados = set.getInt(1);
        statement.clearParameters();
        
        SQL =
                "SELECT jogador.nome, jogador.sobrenome, jogador.apelido, time.esporte, jogador_time.time FROM jogador, jogador_time, time "+
                "WHERE jogador.nome like '"+ nome+ "' AND jogador_time.jogador = jogador.id_jogador AND jogador_time.time = time.nome"
                + " ORDER BY sobrenome LIMIT "+limite+" OFFSET "+ offset;
        
        System.out.println(SQL);
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();

        while (set.next()) {
            Jogador jogador = new Jogador();
            jogador.setNome(set.getString("nome"));
            jogador.setSobrenome(set.getString("sobrenome"));
            jogador.setApelido(set.getString("apelido"));
            jogador.setEsporte(set.getString("esporte"));
            jogador.setTime(set.getString("time"));
            listaJogador.add(jogador);
            i=i+1;
        }        
        return listaJogador;
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

    /**
     * @return the numResultados
     */
    public int getNumResultados() {
        return numResultados;
    }

    /**
     * @param numResultados the numResultados to set
     */
    public void setNumResultados(int numResultados) {
        this.numResultados = numResultados;
    }

}
