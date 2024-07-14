package com.academiajava.dao;

import com.academiajava.model.Livros;
import jakarta.persistence.EntityManager;

public class LivrosDao {
    private EntityManager em;

    public LivrosDao(EntityManager em) {
        this.em = em;
    }

    public void salvar(Livros livro) {
        em.persist(livro);
    }

    public void atualizar(Livros livro) {
        em.merge(livro);
    }

    public void excluir(Livros livro) {
        Livros livroExcluir = em.find(Livros.class, livro.getIsbn());
        em.remove(livroExcluir);
    }
}
