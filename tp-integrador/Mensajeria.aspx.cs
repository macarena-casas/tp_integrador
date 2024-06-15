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
    public partial class Mensajeria : System.Web.UI.Page
    {
        public List<Email> listaemail { get; set; }
        public Email email { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listar(usu.nombre_u);
            email = listaemail[0];

            txtnombre.Text = email.destino;
            txtemail.Text = email.remitente;
            txtasunto.Text = email.asunto;
            txtmensaje.Text = email.mensaje;


        }
    }
}