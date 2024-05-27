using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegocioInmueble
    {
        public List<Inmueble> uploadInmuebleList(string query)
        {
            List<Inmueble> inm = new List<Inmueble>();
            try
            {
                Acceso_Datos inmunegocio = new Acceso_Datos();
                NegocioImagen inegocio = new NegocioImagen();

                inmunegocio.setearconsulta(query);
                inmunegocio.ejecutarlectura();

                while (inmunegocio.lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Imagen aux = new Imagen();

                    inmueble.Imagenes = new List<Imagen>();
                    inmueble.Id_I = (int)inmunegocio.lector["Id"];
                    inmueble.nombre_I = (string)inmunegocio.lector["Nombre"];
                    inmueble.descripcion_I = (string)inmunegocio.lector["Descripcion"];
                    if (inmunegocio.lector.IsDBNull(inmunegocio.lector.GetOrdinal("Categoria")))
                    {
                        inmueble.categoria_I.nombre_categoria = " ";
                    }
                    else
                    {
                        inmueble.categoria_I.nombre_categoria = (string)inmunegocio.lector["Categoria"];
                        // inmueble.categoria_I.codigo_categoria =(int)inmunegocio.lector["IdCategoria"];
                    }

                    inmueble.precio_I = (decimal)inmunegocio.lector["Precio"];
                    inmueble.precio_I = Math.Round(inmueble.precio_I, 2);
                    inmueble.Imagenes = inegocio.ListarItems(inmueble.Id_I);
                    if (inmueble.Imagenes.Count() == 0)
                    {
                        aux.Nombre_imagen = "sinimagen";
                        inmueble.Imagenes.Add(aux);
                    }
                    inm.Add(inmueble);
                }
                return inm;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public List<Inmueble> Listacompleta()
        {
            return uploadInmuebleList("select I.Id As Id, I.Nombre As Nombre ,I.Descripcion As Descripcion, C.Nombre As Categoria, C.Id As IdCategoria, I.Precio  As Precio FROM  Inmueble I left join Categoria C on C.Id= I.Id_categoria");

        }

        public List<Inmueble> listar()
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select I.Nombre, I.Precio, I.Id , I.Descripcion, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble AS I left join Categoria C ON I.Id_categoria = C.Id ");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }

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


        public void agregar(Inmueble nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("insert into Inmueble values ('" + nuevo.nombre_I + "','" + nuevo.descripcion_I + "', @categoria , " + nuevo.precio_I + ")");
                datos.setearparametro("@categoria", nuevo.categoria_I.codigo_categoria);
                datos.ejecutaraccion();

                datos.setearconsulta("select top 1 * from Inmueble order by Id desc");
                int id = Convert.ToInt32(datos.ejecutarScalar());

                datos.setearconsulta("insert into Imagen(IdInmueble, ImagenUrl) values(@Id,@url)");
                datos.setearparametro("@Id", id);
                datos.setearparametro("@url", nuevo.urlimagen);
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


        public List<Inmueble> listarid(int id)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select  I.Id , I.Nombre, I.Precio, I.Descripcion Detalle, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Id=@Id  and C.Id = I.Id_categoria ");
                datos.setearparametro("@Id", id);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                return null;

            }
            finally { datos.cerrarconexion(); }
        }
        public List<Inmueble> listarno(string nom)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select I.Id , I.Nombre, I.Precio, I.Descripcion Detalle, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Nombre = @nombre and C.Id = I.Id_categoria");
                datos.setearparametro("@nombre", nom);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                return null;

            }
            finally { datos.cerrarconexion(); }
        }

        public List<Inmueble> listarcategoria(Categoria id)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select I.Id, I.Nombre, I.Precio, I.Descripcion, C.Nombre Categoria, i.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Id_categoria = @Id and C.Id = @Id");
                datos.setearparametro("@Id", id.codigo_categoria);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;

            }
            finally { datos.cerrarconexion(); }

        }
        public void modificar(Inmueble articulo)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Inmueble set  Nombre= @Nombre, Descripcion =@Descripcion, Id_categoria= @IdCategoria, Precio= @Precio where Id=@Id ");
                datos.setearparametro("@Nombre", articulo.nombre_I);
                datos.setearparametro("@Descripcion", articulo.descripcion_I);
                datos.setearparametro("@IdCategoria", articulo.categoria_I.codigo_categoria);
                datos.setearparametro("@Precio", articulo.precio_I);
                datos.setearparametro("@Id", articulo.Id_I);
                datos.ejecutaraccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Eliminar(int Id)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("delete from Inmueble where Id = @Id ");
                datos.setearparametro("@Id", Id);
                datos.ejecutaraccion();



            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}