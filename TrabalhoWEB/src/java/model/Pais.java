/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author Charmander
 */
public class Pais {
    private String Nome;
    private String Cidade;
    private Jogador jogador;

    /**
     * @return the Nome
     */
    public String getNome() {
        return Nome;
    }

    /**
     * @param Nome the Nome to set
     */
    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    /**
     * @return the DDI
     */
    public String getCidade() {
        return Cidade;
    }

    /**
     * @param Cidade the Cidade to set
     */
    public void setCidade(String Cidade) {
        this.Cidade = Cidade;
    }

    /**
     * @return the jogador
     */
    public Jogador getJogador() {
        return jogador;
    }

    /**
     * @param jogador the jogador to set
     */
    public void setJogador(Jogador jogador) {
        this.jogador = jogador;
    }
    
    
    
}
