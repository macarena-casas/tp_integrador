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
    public partial class ConfirmarUsuario : System.Web.UI.Page
    {
        public List<DatosPersonales> datosusuarios { get; set; }
        NegocioUsuario Unegocio = new NegocioUsuario();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario.nombre_u == "admin")
                {
                    datosusuarios = Unegocio.listard();
                    Session["listaUsuariosAutorizar"] = datosusuarios;

                    if (datosusuarios.Count() == 0)
                    {
                        Response.Redirect("SinPublicaciones.aspx");
                    }
                }
            }
        }

        protected void btnconfirmarUsuario_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string em = btn.CommandArgument;
            string i = btnconfirmarUsuario.CommandArgument;
            Unegocio.Confirmar(em);

            Response.Redirect("ConfirmarUsuario");
        }

        protected void btnRechazarUsuario_Click(object sender, EventArgs e)
        {

        }
    }
}