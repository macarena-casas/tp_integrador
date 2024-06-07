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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregistrarse_Click(object sender, EventArgs e)
        {
            try
            {    
                NegocioUsuario negocio = new NegocioUsuario();
                Usuario usuario = new Usuario();
                usuario.nombre_u = txtemail.Text;
                usuario.contra_u = txtpass.Text;
                negocio.agregar(usuario);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}