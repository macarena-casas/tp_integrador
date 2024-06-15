using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class NegocioEmail
    {


        public void agregar(Email nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("Insert into Email values(@destinatario,@remitente,@asunto, @mensaje,1)");
                datos.setearparametro("@destinatario", nuevo.destino);
                datos.setearparametro("@remitente", nuevo.remitente);
                datos.setearparametro("@asunto", nuevo.asunto);
                datos.setearparametro("@mensaje", nuevo.mensaje);
                datos.ejecutaraccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarconexion();
            }
        }
        public List<Email> listar(string des)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select destinatario, remitente, Asunto,Mensaje,Estado from Email where destinatario = @desti");
                datos.setearparametro("@desti", des);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }



    }
}