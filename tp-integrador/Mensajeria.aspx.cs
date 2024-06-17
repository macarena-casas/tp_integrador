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
            listaemail = negoE.listar(usu.nombre_u);
            Session["Emails"] = listaemail;

            repetir.DataSource = listaemail;
            repetir.DataBind();

            email = listaemail[0];
            txtremitente.Text = "Remitente: " + email.remitente;
            txtasunto.Text = "Asunto: " + email.asunto;
            txtMensaje.Text = email.mensaje;




        }
        protected void repetir_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblIndex = (Label)e.Item.FindControl("txtindice");
            int index = Convert.ToInt32(lblIndex.Text);



        }



        protected void btnResponder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }
        /*      <asp:Label ID="txtindice" runat="server" Text='<%# Container.ItemIndex %>' />*/
    }
}