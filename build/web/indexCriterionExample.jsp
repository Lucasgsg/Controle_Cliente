<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="org.hibernate.criterion.Example"%>
<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo Criterion Example</title>
    </head>
    <body>
        <%
            try{
                Session sessao = HibernateUtil.getSessionFactory().openSession();
                Transaction transacao = sessao.beginTransaction();
                Cliente bean_parametros = new Cliente();
                bean_parametros.setNomCli("An");
                bean_parametros.setTelCli("(11)");
                Example exemplo = Example.create(bean_parametros);
                exemplo.enableLike(MatchMode.START);
                exemplo.ignoreCase();
                Criteria query = sessao.createCriteria(Cliente.class);
                query.add(exemplo);
                List clientes = query.list();
                for (Object objeto_cliente : clientes) {
                    Cliente cli = (Cliente) objeto_cliente;
                    out.print("Nome : " + cli.getNomCli());
                    out.print("<br /> Telefone : " + cli.getTelCli());
                    out.print("<br /> <br />");
                }
                transacao.commit();
                sessao.close();
            }catch(Exception e){
                out.print("Erro na consulta");
            }
        %>
    </body>
</html>
