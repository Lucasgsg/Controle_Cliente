<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo HQL Multipla</title>
    </head>
    <body>
        <%
            try{
                Session sessao = HibernateUtil.getSessionFactory().openSession();
                Transaction transacao = sessao.beginTransaction();
                String hql = "from Cliente c order by c.getnomCli";
                Query query = sessao.createQuery(hql);
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
                out.print("Erro na consulta "+e.getMessage());
            }
        %>
    </body>
</html>
