using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_integrador
{
    public partial class Detalles : System.Web.UI.Page
    {
        public List<Inmueble> listainmueble { get; set; }
        public Inmueble inmueble { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            NegocioUsuario usario = new NegocioUsuario();

            Session["ReturnUrl"] = Request.Url.ToString();

            listainmueble = (List<Inmueble>)Session["listainmueble"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            inmueble = listainmueble.FirstOrDefault(i => i.Id_I == Id_I);
            try
            {

                if (inmueble != null && !IsPostBack)
                {
                    lblnombre.InnerText = inmueble.nombre_I;
                    lblDescripcion.InnerText = inmueble.descripcion_I;
                    lblDireccion.InnerText = "Ubicación: " + inmueble.ubicacion.Direccion + "," + inmueble.ubicacion.Localidad + "(" + inmueble.ubicacion.Codigo_Postal.ToString() + "), " + inmueble.ubicacion.Partido;
                    lblprecio.InnerText = "$" + inmueble.precio_I.ToString();
                    lblcategoriaytipo.InnerText = inmueble.categoria_I.nombre_categoria + " en: " + inmueble.tipo_operacion;
                    lblambientes.Text = "Ambientes: " + inmueble.ambientes.ToString();
                    lblbaños.Text = "Baños: " + inmueble.baños.ToString();

                    checkagua.Enabled = false;
                    Checkluz.Enabled = false;
                    checkgas.Enabled = false;
                    Checkcochera.Enabled = false;
                    Checkaire.Enabled = false;
                    Checkpatio.Enabled = false;
                    Checkpavimento.Enabled = false;
                    Checkcalefaccion.Enabled = false;
                    Checkcloaca.Enabled = false;

                    if (inmueble.aguacorriente == true) { checkagua.Checked = true; }
                    if (inmueble.luz == true) { Checkluz.Checked = true; }
                    if (inmueble.gasnatural == true) { checkgas.Checked = true; }
                    if (inmueble.cochera == true) { Checkcochera.Checked = true; }
                    if (inmueble.aireacondicionado == true) { Checkaire.Checked = true; }
                    if (inmueble.patio == true) { Checkpatio.Checked = true; }
                    if (inmueble.pavimento == true) { Checkpavimento.Checked = true; }
                    if (inmueble.cloacas == true) { Checkcloaca.Checked = true; }
                    if (inmueble.calefaccion == true) { Checkcalefaccion.Checked = true; }


                }

                if (inmueble == null)
                {
                    Response.Redirect("~/Default.aspx");
                }



            }
            catch (Exception ex)
            {
                Response.Redirect("~/Default.aspx");
                throw ex;
            }
        }
        public bool verificarusuario(int id)
        {
            if (Session["usuario"] != null)
            {
                try
                {

                    Usuario usuario = (Usuario)Session["usuario"];
                    NegocioInmueble fnegocio = new NegocioInmueble();

                    if (fnegocio.verificarusuario(usuario.nombre_u, id) == true)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                }
                catch (Exception ex)
                {
                    Response.Redirect("~/Error.aspx");
                    throw ex;
                }
            }
            else
            {
                return false;
            }


        }

        protected void btnagregarfavorito_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {

                Favorito favoritoactual;
                favoritoactual = (Favorito)Session["inmueble"];
                NegocioFavorito fNegocio = new NegocioFavorito();

                try
                {

                    favoritoactual = fNegocio.AguegarAFavorito(inmueble, favoritoactual, 1);
                    Session["inmueble"] = favoritoactual;
                    Response.Redirect("~/Detalles.aspx?id=" + inmueble.Id_I);

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else
            {
                Session.Add("error", "Debes Iniciar Sesión.");
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnContacto_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                try
                {


                    Response.Redirect("~/Contacto.aspx?id=" + inmueble.Id_I);

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else
            {
                Session.Add("error", "Debes Iniciar Sesión.");
                Response.Redirect("Login.aspx");
            }
        }
    }
}