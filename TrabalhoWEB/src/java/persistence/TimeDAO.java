/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Time;
import persistence.ConnectionFactory;
/**
 *
 * @author floss
 */
public class TimeDAO {
    private Connection connection;
    private int numResultados;
    
    public TimeDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    
    
    public List<Time> consultaQuarta(int offset, int limite, String nome) throws SQLException{
        List<Time> listaTime = new ArrayList<Time>();
        PreparedStatement statement;
        ResultSet set;
        
        String SQL = 
                "SELECT COUNT(*) FROM time, pais WHERE pais.nome like '"+nome+"%' AND time.pais=pais.sigla2letras";
                
        System.out.println(SQL);
        
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        set.next();
        this.numResultados = set.getInt(1);
        System.out.println("NUMERO DE RESULTADOS:"+this.numResultados);
        statement.clearParameters();
        //time.nome='"+nome+"' AND
        SQL =   
                "SELECT time.nome,esporte,estadio,pais.nome AS pais FROM time, pais WHERE pais.nome like '"+nome+"%' AND time.pais=pais.sigla2letras"
                + " ORDER BY time.nome LIMIT "+limite+" OFFSET "+offset;
        
        System.out.println(SQL);
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        // há times que não tem estadio
        // no caso, esta printando no website como null
        // isso é apenas uma forma de corrigir isso...
        String estadio = null;
        while (set.next()) {
            Time time = new Time();
            time.setNome(set.getString("nome"));
            time.setEsporte(set.getString("esporte"));
            estadio = set.getString("estadio");
            if(estadio == null)
                time.setEstadio(" ");
            else
                time.setEstadio(estadio);
            time.setPais(set.getString("pais"));
            listaTime.add(time);
            estadio = null;
        }        
        return listaTime;
    }
    public List<Time> consultaQuinta(int offset, int limite, String nome) throws SQLException{
        List<Time> listaTime = new ArrayList<Time>();
        PreparedStatement statement;
        ResultSet set;
        
        String SQL = 
                "SELECT COUNT(*) FROM time, pais WHERE pais.nome like '"+nome+"' AND time.pais=pais.sigla2letras";
                
        System.out.println(SQL);
        
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        set.next();
        this.numResultados = set.getInt(1);
        System.out.println("NUMERO DE RESULTADOS:"+this.numResultados);
        statement.clearParameters();
        //time.nome='"+nome+"' AND
        SQL =   
                "SELECT time.nome,esporte,estadio,pais.nome AS pais FROM time, pais WHERE pais.nome ='"+nome+"' AND time.pais=pais.sigla2letras"
                + " ORDER BY time.nome LIMIT "+limite+" OFFSET "+offset;
        
        System.out.println(SQL);
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();

        while (set.next()) {
            Time time = new Time();
            time.setNome(set.getString("nome"));
            time.setEsporte(set.getString("esporte"));
            time.setEstadio(set.getString("estadio"));
            time.setPais(set.getString("pais"));
            listaTime.add(time);
        }        
        return listaTime;
    }
    /**
     * @return the numResultados
     */
    public int getNumResultados() {
        return numResultados;
    }
}
