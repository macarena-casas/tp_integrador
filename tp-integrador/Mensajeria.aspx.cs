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
        protected global::System.Web.UI.WebControls.Repeater repetir;
        public List<Email> listaemail { get; set; }
        public Email email { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listartodos(usu.nombre_u);
            Session["Emails"] = listaemail;
            repetir.DataSource = listaemail;
            repetir.DataBind();
        }

        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }

        public void repetir_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Email dataItem = listaemail[index];

                txtasunto.Text = dataItem.asunto;
                txtremitente.Text = dataItem.remitente;
                txtMensaje.Text = dataItem.mensaje;




            }
        }

        protected void btnenviados_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarenviados(usu.nombre_u);
            Session["Emails"] = listaemail;
            repetir.DataSource = listaemail;
            repetir.DataBind();
        }

        protected void btnrecibidos_Click(object sender, EventArgs e)
        {
            Usuario usu = (Usuario)Session["usuario"];
            Email email = new Email();
            NegocioEmail negoE = new NegocioEmail();
            listaemail = negoE.listarrecibidos(usu.nombre_u);
            Session["Emails"] = listaemail;
            repetir.DataSource = listaemail;
            repetir.DataBind();
        }

        protected void btnnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }

        protected void btnEliminarmensaje_Click(object sender, EventArgs e)
        {
            /* NegocioEmail nego = new NegocioEmail();
             LinkButton btn = (LinkButton)sender;
             int id = email.Id;

             nego.BajaLogica(id, false);
             Response.Redirect("~/Mensajeria.aspx");

             txtasunto.Text = dataItem.asunto;
             txtremitente.Text = dataItem.remitente;
             txtMensaje.Text = dataItem.mensaje;*/
        }
    }
}