<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo</title>
    </head>
    <body>
        <%
            Session sessao = HibernateUtil.getSessionFactory().openSession();
            Transaction transacao = sessao.beginTransaction();

            //Salva Registro na Tabela
            Cliente cli = new Cliente();
            cli.setIdeCli(1);
            cli.setNomCli("Ana Luiza");
            cli.setTelCli("1234-8765");
            sessao.save(cli);
            out.print("Registro Salvo com Sucesso!");
            out.print("<br /> <br />");

            transacao.commit();
            sessao.close();

            Session novaSessao = HibernateUtil.getSessionFactory().openSession();
            Transaction novaTransacao = novaSessao.beginTransaction();

            //Consulta um Registro na Tabela
            Query select = novaSessao.createQuery("from Cliente as cli where cli.ideCli = :id");
            select.setInteger("id", 1);
            List objetos = select.list();
            Cliente cliente = (Cliente) objetos.get(0);
            out.println("ID: " + cliente.getIdeCli() + "<br />");
            out.println("NOME: " + cliente.getNomCli() + "<br />");
            out.println("TELEFONE: " + cliente.getTelCli() + "<br />");

            novaTransacao.commit();
            novaSessao.close();

        %>
    </body>
</html>
