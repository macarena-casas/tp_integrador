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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Repeater repetirinmuebles;

        public Favorito favoritoactual { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {Usuario usuario = new Usuario();
            NegocioUsuario usario=new NegocioUsuario();
            if (Session["usuario"] == null)
            {
                Session.Add("error", "debes loguaerte para entrar");
                Response.Redirect("Login.aspx");
            }
            {

            }
            favoritoactual = (Favorito)Session["inmueble"];
            if (favoritoactual.TotalProductos == 0)
            {
                Response.Redirect("~/FavoritosVacio.aspx");
            }
            else if (favoritoactual != null && favoritoactual.TotalProductos > 0)
            {
                repetirinmuebles.DataSource = favoritoactual.listainmueble;
                repetirinmuebles.DataBind();
            }
        }


        private void AgregarAFavorito(int id)
        {


            

            


            try
            {
                for (int i = 0; i < favoritoactual.listainmueble.Count(); i++)
                {
                    if (favoritoactual.listainmueble[i].inmueble.Id_I == id)
                    {

                        Session["inmueble"] = favoritoactual;
                        repetirinmuebles.DataSource = favoritoactual.listainmueble;
                        repetirinmuebles.DataBind();
                        break;
                    }
                }

                updateLabelCart();

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }
        }
        
        private void EliminardeFavorito(int id, bool todo)
        {
            for (int i = 0; i < favoritoactual.listainmueble.Count(); i++)
            {
                if (favoritoactual.listainmueble[i].inmueble.Id_I == id)
                {
                    if (todo == true)
                    {
                        favoritoactual.TotalProductos = favoritoactual.TotalProductos -1;

                        favoritoactual.listainmueble.RemoveAt(i);
                        Session["inmueble"] = favoritoactual;
                        repetirinmuebles.DataSource = favoritoactual.listainmueble;
                        repetirinmuebles.DataBind();
                        break;
                    }
                    else
                    {

                        if (favoritoactual.listainmueble[i].cantidad == 0)
                        {
                            favoritoactual.listainmueble.RemoveAt(i);
                        }
                        Session["inmueble"] = favoritoactual;
                        repetirinmuebles.DataSource = favoritoactual.listainmueble;
                        repetirinmuebles.DataBind();
                        break;
                    }
                }
            }
            updateLabelCart();
            if (favoritoactual.TotalProductos == 0)
            {
                Response.Redirect("~/FavoritosVacio.aspx");
            }
        }
        private void updateLabelCart()
        {
            var masterPage = this.Master;
            var lblHeader = masterPage.FindControl("Label1") as Label;
            if (lblHeader != null)
            {
                lblHeader.Text = favoritoactual.TotalProductos.ToString();
            }
        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument);
            EliminardeFavorito(id, true);
            repetirinmuebles.DataSource = favoritoactual.listainmueble;
            repetirinmuebles.DataBind();
        }
        
    }
}