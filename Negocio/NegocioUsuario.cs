using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class NegocioUsuario
    {

        public void Eliminar(int Id)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("delete from Usuario where Id = @Id ");
                datos.setearparametro("@Id", Id);
                datos.ejecutaraccion();



            }
            catch (Exception ex)
            {

                throw ex;
            }


        }



        public void agregar(Usuario nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("insert into Usuario \r\nvalues ('" + nuevo.nombre_u + "','" + nuevo.contra_u + "','" + nuevo.idtipo_u + "')");
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


        public List<Usuario> listar() { 
        List<Usuario> lista = new List<Usuario>();
        Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Nombre , Contraseña from Usuario");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Usuario aux= new Usuario();
                    aux.nombre_u = (string)datos.lector["Nombre"];
                    aux.contra_u = (string)datos.lector["Contraseña"];
                    lista.Add(aux);
                }
                return lista;
               }
           
            catch (Exception ex)
            {

                throw ex;
                
            }
            finally {
                datos.cerrarconexion();
            }
              
        }
    }
}
