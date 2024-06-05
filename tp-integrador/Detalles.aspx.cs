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
            if (Session["usuario"] == null)
            {
                Session.Add("error", "debes loguaerte para entrar");
                Response.Redirect("Login.aspx");
            }


            listainmueble = (List<Inmueble>)Session["listainmueble"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            inmueble = listainmueble.FirstOrDefault(i => i.Id_I == Id_I);
            try
            {

                if (inmueble != null && !IsPostBack)
                {
                    lblnombre.InnerText = inmueble.nombre_I;
                    lblDescripcion.InnerText = inmueble.descripcion_I;
                    lblprecio.InnerText = "$" + inmueble.precio_I.ToString();
                    lblcategoria.InnerText = inmueble.categoria_I.nombre_categoria;
                    lblambientes.Text = inmueble.ambientes.ToString();
                    lblbaños.Text = inmueble.baños.ToString();

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
        protected void btnagregarfavorito_Click(object sender, EventArgs e)
        {
            
            Favorito favoritoactual;
            favoritoactual = (Favorito)Session["inmueble"];
            NegocioFavorito fNegocio = new NegocioFavorito();

            try
            {

                favoritoactual = fNegocio.AguegarAFavorito(inmueble, favoritoactual,1);
                Session["inmueble"] = favoritoactual;
                Response.Redirect("~/Detalles.aspx?id=" + inmueble.Id_I);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}