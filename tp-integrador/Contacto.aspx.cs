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
    public partial class Contacto : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnUrl"] = Request.Url.ToString();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            Email email = new Email();
            email.mensaje = txtmensaje.Text;
            email.remitente = txtemail.Text;
            email.asunto = txtasunto.Text;
            email.destino = "admin";
            NegocioEmail negoE = new NegocioEmail();
            negoE.agregar(email);
        }
    }
}