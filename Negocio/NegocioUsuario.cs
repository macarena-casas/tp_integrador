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
                datos.setearconsulta("insert into Usuario (Nombre, Contraseña,IDTipo,Activo) values(@Nombre, @Contraseña, 0,0)");
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
               
                datos.setearconsulta("DescontarSaldoPorFormaPago");
                datos.comando.CommandType = CommandType.StoredProcedure;

                datos.setearparametro("@Id_Usuario", id_comprador);
                datos.setearparametro("@Id_Inmueble", id_inmueble);
                datos.setearparametro("@FormaPago", formaPago);

                datos.ejecutaraccion();

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
        public void agregarDatos(DatosPersonales nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("insert into DatosUsuario values(@Email,@Nombre, @Apellido,@Dni,@Celular,@Domicilio,@Fecha,@Activo)");
                datos.setearparametro("@Email", nuevo.Email);
                datos.setearparametro("@Nombre", nuevo.Nombre);
                datos.setearparametro("@Apellido", nuevo.Apellido);
                datos.setearparametro("@Dni", nuevo.DNI);
                datos.setearparametro("@Celular", nuevo.Telefono);
                datos.setearparametro("@Domicilio", nuevo.Domicilio);
                datos.setearparametro("@Fecha", nuevo.FechaNacimiento);
                datos.setearparametro("@Activo", false);
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
        public List<DatosPersonales> listard()
        {
            List<DatosPersonales> lista = new List<DatosPersonales>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Email, Nombres, Apellidos, Dni, Celular, Domicilio, FechaNacimiento, Activo from DatosUsuario where Activo=0");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    DatosPersonales aux = new DatosPersonales();
                    aux.Nombre = (string)datos.lector["Nombres"];
                    aux.Apellido = (string)datos.lector["Apellidos"];
                    aux.Email = (string)datos.lector["Email"];
                    aux.Telefono = (string)datos.lector["Celular"];
                    aux.Domicilio = (string)datos.lector["Domicilio"];
                    aux.DNI = (string)datos.lector["Dni"];
                    aux.FechaNacimiento = (DateTime)datos.lector["FechaNacimiento"];
                    aux.Activo = (bool)datos.lector["Activo"];
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
        public void Confirmar(string email)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update DatosUsuario set Activo = 1 where Email=@email and Activo=0");
                datos.setearparametro("@email", email);
                datos.ejecutaraccion();
                datos.setearconsulta("update Usuario set Activo = 1 where Nombre=@email and Activo=0");
                datos.setearparametro("@email", email);
                datos.ejecutaraccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
