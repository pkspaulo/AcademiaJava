package com.academiajava;

import com.academiajava.dao.Conexao;
import com.academiajava.dao.LivrosDao;
import com.academiajava.dao.UsuarioDao;
import com.academiajava.model.Livros;
import com.academiajava.model.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class LivrariaApp {
    public static void main(String[] args) {

//        //Criando EntityManager
        EntityManager em = Conexao.getEtityManager();

        //cadastrar(em);
        //atualizar(em);
        //excluir(em);
        //cadastrarLivro(em);
        //atualizarLivro(em);
        excluirLivro(em);
    }

    public static void cadastrar(EntityManager em){
        Usuario usuario = new Usuario();
        usuario.setNome("Dayane");
        usuario.setEmail("dayane@gmail.com");
        usuario.setSenha("123456");

        //Criando Instancia DAO
        UsuarioDao usuarioDao = new UsuarioDao(em);

        em.getTransaction().begin();
        usuarioDao.salvar(usuario);
        em.getTransaction().commit();
    }

    public static void atualizar(EntityManager em){
        Usuario usuario = new Usuario();
        usuario.setId(2L);
        usuario.setNome("Paulo");
        usuario.setEmail("paulo.reis@gmail.com");
        usuario.setSenha("3333");

        //Criando Instancia DAO
        UsuarioDao usuarioDao = new UsuarioDao(em);

        em.getTransaction().begin();
        usuarioDao.atualizar(usuario);
        em.getTransaction().commit();
    }

    public static void excluir(EntityManager em){
        Usuario usuario = new Usuario();
        usuario.setId(2L);

        //Criando Instancia DAO
        UsuarioDao usuarioDao = new UsuarioDao(em);

        em.getTransaction().begin();
        usuarioDao.excluir(usuario);
        em.getTransaction().commit();
    }

    public static void cadastrarLivro(EntityManager em){
        Livros livro = new Livros();
        livro.setIsbn("123456875");
        livro.setNome("Persista Em Seus Sonhos");
        livro.setCategoria("Auto Ajuda");
        livro.setQuantidade(2);

        //Criando Instancia DAO
        LivrosDao livrosDao = new LivrosDao(em);

        em.getTransaction().begin();
        livrosDao.salvar(livro);
        em.getTransaction().commit();
    }

    public static void atualizarLivro(EntityManager em){
        Livros livro = new Livros();
        livro.setIsbn("123456875");
        livro.setNome("Persista Em Seus Sonhos");
        livro.setCategoria("AUTO AJUDA");
        livro.setQuantidade(9);

        //Criando Instancia DAO
        LivrosDao livrosDao = new LivrosDao(em);

        em.getTransaction().begin();
        livrosDao.atualizar(livro);
        em.getTransaction().commit();
    }

    public static void excluirLivro(EntityManager em){
        Livros livro = new Livros();
        livro.setIsbn("33333333");


        //Criando Instancia DAO
        LivrosDao livrosDao = new LivrosDao(em);

        em.getTransaction().begin();
        livrosDao.excluir(livro);
        em.getTransaction().commit();
    }

}
