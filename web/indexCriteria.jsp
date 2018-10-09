<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo Criteria</title>
    </head>
    <body>
        <%
            try{
                Session sessao = HibernateUtil.getSessionFactory().openSession();
                Transaction transacao = sessao.beginTransaction();
                Criteria query = sessao.createCriteria(Cliente.class);
                query.add(Restrictions .eq("ideCli", new Integer(1)));
                List clientes = query.list();
                Cliente cliente = (Cliente) clientes.get(0);
                out.print("Nome : " + cliente.getNomCli());
                out.print("<br /> Telefone : " + cliente.getTelCli());
                transacao.commit();
                sessao.close();
            }catch(Exception e){
                out.print("Erro na consulta");
            }
        %>
    </body>
</html>
