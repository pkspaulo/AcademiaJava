package com.academiajava.dao;

import com.academiajava.model.Usuario;
import jakarta.persistence.EntityManager;

public class UsuarioDao {
    private EntityManager em;

    public UsuarioDao(EntityManager em) {
        this.em = em;
    }

    public void salvar(Usuario usuario) {
        em.persist(usuario);
    }

    public void atualizar(Usuario usuario) {
        em.merge(usuario);
    }

    public void excluir(Usuario usuario) {
        Usuario usuarioEcluir = em.find(Usuario.class, usuario.getId());
        em.remove(usuarioEcluir);
    }
}
