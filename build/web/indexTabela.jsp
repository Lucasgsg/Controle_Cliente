<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo Laço de Repetição(Tabela)</title>
    </head>
    <body>
        <%
            Session sessao = HibernateUtil.getSessionFactory().openSession();
            Transaction transacao = sessao.beginTransaction();
            Query select = sessao.createQuery("from Cliente as cli");
            List clientes = select.list();
            out.print("<table border='1' cellpadding='5'>");
            out.print("<tr bgcolor='#ededed'>");
            out.print("<td>Id</td>");
            out.print("<td>Nome</td>");
            out.print("<td>Telefone</td>");
            out.print("</tr>");
            for (int indice = 0; indice < clientes.size(); indice++) {
                out.print("<tr>");
                Cliente cli = (Cliente) clientes.get(indice);
                out.print("<td>");
                out.println(cli.getIdeCli());
                out.print("</td>");
                out.print("<td>");
                out.println(cli.getNomCli());
                out.print("</td>");
                out.print("<td>");
                out.println(cli.getTelCli());
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table");
            transacao.commit();
            sessao.close();
        %>
    </body>
</html>
