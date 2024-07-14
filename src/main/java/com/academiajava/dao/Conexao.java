package com.academiajava.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Conexao {
    public static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("livraria");

    public static EntityManager getEtityManager(){
        return EMF.createEntityManager();
    }
}
