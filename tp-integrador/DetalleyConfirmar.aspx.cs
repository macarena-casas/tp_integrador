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
    public partial class DetalleyConfirmar : System.Web.UI.Page
    {
        public List<Inmueble> listaautorizar { get; set; }
        public Inmueble inmueble { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            NegocioUsuario usario = new NegocioUsuario();

            Session["ReturnUrl"] = Request.Url.ToString();

            listaautorizar = (List<Inmueble>)Session["listaautorizar"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            inmueble = listaautorizar.FirstOrDefault(i => i.Id_I == Id_I);
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
     


        protected void btnagregarfavorito_Click1(object sender, EventArgs e)
        {

            if (Session["usuario"] != null)
            {
                NegocioInmueble iManager = new NegocioInmueble();
                iManager.AdminElimina_Activa(inmueble.Id_I, true);
                Response.Redirect("~/ConfirmarPublicaciones.aspx");

            }

        }

        protected void btnContacto_Click1(object sender, EventArgs e)
        {

        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {

        }
    }
}