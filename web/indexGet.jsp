<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo Consulta GET</title>
    </head>
    <body>
        <%
            try{
                Session sessao = HibernateUtil.getSessionFactory().openSession();
                Transaction transacao = sessao.beginTransaction();
                Integer id = Integer.valueOf(1);
                Cliente cli = (Cliente) sessao.get(Cliente.class, id);
                out.print("Nome : " + cli.getNomCli());
                out.print("<br /> Telefone : " + cli.getTelCli());
                transacao.commit();
                sessao.close();
            }catch(Exception e){
                out.print("Erro na consulta");
            }
        %>
    </body>
</html>
