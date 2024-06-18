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
        /*<script>   
                        function ShowModal(button) {


                            var modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
                            modal.show();
                            return false; // Esto evita que la página se recargue
                        } </script>*/

    }
}