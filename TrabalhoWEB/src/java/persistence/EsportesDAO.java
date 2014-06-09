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
 * @author schultz
 */
public class EsportesDAO {

    private Connection connection;
    private int numResultados;

    public EsportesDAO() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    
    public List<Time> consultaTres(int offset, int limite, String nome) throws SQLException{
        int i = 0;
        List<Time> listaTime = new ArrayList<Time>();
        PreparedStatement statement;
        ResultSet set;
        
        String SQL = 
            "select count(*) from time, pais "+ 
            "where time.esporte like '"+nome+"%' AND pais.sigla2letras = time.pais";
        System.out.println(SQL);
        
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();
        
        set.next();
        //this.setNumResultados(set.getInt(1));
        this.numResultados = set.getInt(1);
        statement.clearParameters();
        
        SQL =
        "select time.nome, time.esporte, pais.nome AS pais from time, pais "+ 
        "where time.esporte like '"+nome+"%' AND pais.sigla2letras = time.pais ORDER BY time.nome"
                + " LIMIT "+limite+" OFFSET "+ offset;      

        System.out.println(SQL);
        statement = connection.prepareStatement(SQL);
        set = statement.executeQuery();

        while (set.next()) {
            Time time = new Time();
            time.setNome(set.getString("nome"));
            time.setEsporte(set.getString("esporte"));
            time.setPais(set.getString("pais"));
            listaTime.add(time);
            i=i+1;
        }        
        return listaTime;
    }

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
