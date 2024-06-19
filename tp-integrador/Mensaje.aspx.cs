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
    public partial class Mensaje : System.Web.UI.Page
    {
        public List<Email> listaemail { get; set; }
        public Email emailseleccionado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            listaemail = (List<Email>)Session["Emails"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            int Id = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            email = listaemail.FirstOrDefault(i => i.Id == Id);
            emailseleccionado = email;

            txtasunto.Text = email.asunto;
            txtremitente.Text = email.remitente;
            txtmensaje.Text = email.mensaje;

        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarmensaje_Click(object sender, EventArgs e)
        {
            NegocioEmail nego = new NegocioEmail();

            int id = emailseleccionado.Id;

            nego.BajaLogica(id, false);
            Response.Redirect("~/Mensajeria.aspx");

        }


        protected void btncerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mensajeria.aspx");
        }
    }
}