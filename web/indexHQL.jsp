<%@page import="dominio.Cliente"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo HQL</title>
    </head>
    <body>
        <%
            try{
                Session sessao = HibernateUtil.getSessionFactory().openSession();
                Transaction transacao = sessao.beginTransaction();
                Integer id_cliente = Integer.valueOf(1);
                String hql = "from Cliente as c where c.ideCli = :id";
                Query query = sessao.createQuery(hql);
                query.setInteger("id", id_cliente);
                List clientes = query.list();
                Cliente cli = (Cliente) clientes.get(0);
                out.print("Nome : "+cli.getNomCli());
                out.print("<br /> Telefone : "+cli.getTelCli());
                transacao.commit();
                sessao.close();
            }catch(Exception e){
                out.print("Erro na consulta "+e.getMessage());
            }
        %>
    </body>
</html>
