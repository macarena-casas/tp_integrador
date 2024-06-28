using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
                datos.setearconsulta("insert into Usuario  values(@Nombre, @Contraseña, 0)");
                datos.setearparametro("@Nombre", nuevo.nombre_u);
                datos.setearparametro("@Contraseña", nuevo.contra_u);
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


        public List<Usuario> listar()
        {
            List<Usuario> lista = new List<Usuario>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Nombre , Contraseña from Usuario");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Usuario aux = new Usuario();
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
            finally
            {
                datos.cerrarconexion();
            }

        }

        public bool Loguear(Usuario usuario)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id, Nombre, Contraseña, IDTipo from Usuario where Nombre = @Nombre and Contraseña= @Contraseña");
                datos.setearparametro("@Nombre", usuario.nombre_u);
                datos.setearparametro("@Contraseña", usuario.contra_u);

                datos.ejecutarlectura();

                if (datos.lector.Read())
                {
                    usuario.id_u = (int)datos.lector["Id"];
                    


                    return true;
                }
                else
                {
                    return false;
                }

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

        public void Pagar(int id_comprador, int id_inmueble, string formaPago)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.abrir();
                datos.setearconsulta("DescontarSaldoPorFormaPago");
                datos.comando.CommandType = CommandType.StoredProcedure;

                datos.setearparametro("@Id_Usuario", id_comprador);
                datos.setearparametro("@Id_Inmueble", id_inmueble);
                datos.setearparametro("@FormaPago", formaPago);

                datos.ejecutaraccion2();

                Console.WriteLine("Pago exitoso y registrado en PagosInmobiliaria");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al ejecutar el pago: " + ex.Message);
                throw ex;
            }
            finally
            {
                datos.cerrarconexion();
            }
        }
    }
}
