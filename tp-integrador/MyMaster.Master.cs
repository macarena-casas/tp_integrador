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
        public Favorito lista { get; set; }
        public Usuario usuario { get; set; }
        public string TotalProductosCarro { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["inmueble"] == null)
            {
                lista = new Favorito();

                Session.Add("inmueble", lista);
            }
            else
            {
                lista = (Favorito)Session["inmueble"];

            }
            favoritos.Text = lista.TotalProductos.ToString();
            usuario = (Usuario)Session["usuario"];
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

        protected void cerrar_Click(object sender, EventArgs e)
        {

            Session["usuario"] = null;
            string previousUrl = Session["ReturnUrl"] as string;
            if (previousUrl != null)
            {
                Response.Redirect(previousUrl);

            }

            else
            {
                Response.Redirect("Default.aspx");
            }

        }


    }
}