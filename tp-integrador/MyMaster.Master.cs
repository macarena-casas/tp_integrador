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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public List<Inmueble> listafiltrada { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Buscar(string text)
        {
            List<Inmueble> aux = (List<Inmueble>)Session["listainmueble"];
            listafiltrada = aux.FindAll(x => x.nombre_I.ToUpper().Contains(text.ToUpper()) ||
           x.categoria_I.nombre_categoria.ToUpper().Contains(text.ToUpper()));
            Session.Add("inmueblesfiltrados", listafiltrada);
            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"Default.aspx");
            }



        }

       

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (tbBuscar.Text != "")
            {
                Buscar(tbBuscar.Text);
            }
        }
    }
}