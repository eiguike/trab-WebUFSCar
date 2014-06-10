/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import model.Jogador;
import model.Pais;
import persistence.ConnectionFactory;

/**
 *
 * @author Charmander
 */

public class PaisDAO {
    
    private Connection connection;
    private int numResultados;

    public PaisDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    
    public List<Pais> consultaSegunda(int offset, int limite, String nome) throws SQLException{
        int i = 0;
        List<Pais> listaPais = new ArrayList<Pais>();
        PreparedStatement statement;
        ResultSet set;
        
        String SQL = 
                "SELECT COUNT(*) as total FROM jogador, time, pais, cidade "+
                "WHERE pais.nome like '"+ nome+ "' AND cidade.pais = pais.sigla2letras AND cidade.id = jogador.datanasc_cidade";
        
        System.out.println(SQL);
        
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        set.next();
        //this.setNumResultados(set.getInt(1));
        this.numResultados = set.getInt(1);
        statement.clearParameters();
        
        SQL = "SELECT jogador.nome, jogador.sobrenome, jogador.apelido, time.esporte, jogador_time.time, cidade.nome as cidade_nome, pais.sigla2letras"
                +"FROM jogador, jogador_time, time, cidade, pais "+
                "WHERE pais.nome like '"+ nome+ "' AND cidade.pais = pais.sigla2letras AND cidade.id = jogador.datanasc_cidade"
                + "AND jogador.id_jogador = jogador_time.jogador AND jogador_time.time = time.nome"
                + " ORDER BY sobrenome LIMIT "+limite+" OFFSET "+ offset;
        
        System.out.println(SQL);
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        while (set.next()) {
            Pais pais = new Pais();
            Jogador jogador = new Jogador();
            jogador.setNome(set.getString("nome"));
            jogador.setSobrenome(set.getString("sobrenome"));
            jogador.setApelido(set.getString("apelido"));
            jogador.setEsporte(set.getString("esporte"));
            jogador.setTime(set.getString("time"));
            pais.setJogador(jogador);
            
            pais.setCidade(set.getString("cidade_nome"));
            pais.setNome(set.getString("sigla2letras"));
            listaPais.add(pais);
            i=i+1;
        }
        
        return listaPais;
    }
    
    public int getNumResultados() {
        return numResultados;
    }

    public void setNumResultados(int numResultados) {
        this.numResultados = numResultados;
    }
}
