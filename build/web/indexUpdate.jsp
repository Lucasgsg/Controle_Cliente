<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo Update</title>
    </head>
    <body>
        <%
            Session sessao = HibernateUtil.getSessionFactory().openSession();
            Transaction transacao = sessao.beginTransaction();
            
            Query select = sessao.createQuery("from Cliente as cli where cli.ideCli = :id");
            select.setInteger("id", 2);
            List objeto = select.list();
            Cliente cli = (Cliente) objeto.get(0);
            cli.setNomCli("Evandro Teruel");
            cli.setTelCli("6789-0000");
            sessao.update(cli);
            out.print("Registro modificado com sucesso");
            out.print("<br /> <br />");
            transacao.commit();
            sessao.close();
        %>
    </body>
</html>
