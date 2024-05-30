using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Net;

namespace tp_integrador
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Inmueble> listainmueble { get; set; }
        public Favorito favoritoactual { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listainmueble"] == null)
            {
                NegocioInmueble iManager = new NegocioInmueble();
                listainmueble = iManager.Listacompleta();
                listainmueble = validarurl(listainmueble);
                Session["listainmueble"] = listainmueble;
            }
            else
            {

                listainmueble = (List<Inmueble>)Session["listainmueble"];
            }
            favoritoactual = (Favorito)Session["inmueble"];
            if (Request.QueryString["id"] != null)
            {
                addInmueble();
            }

        }
        private void addInmueble()
        {
            try
            {
                NegocioFavorito fnegocio = new NegocioFavorito();
                listainmueble = (List<Inmueble>)Session["listainmueble"];
                Inmueble inmueble;
                int Id_I = int.Parse(Request.QueryString["id"]);

                inmueble = fnegocio.encontrarInmueble(Id_I, listainmueble);
                Session["inmueble"] = fnegocio.AguegarAFavorito(inmueble, favoritoactual, 1);

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }
        }


        public List<Inmueble> validarurl(List<Inmueble> aux)
        {
            foreach (Inmueble art in aux)
            {
                foreach (Imagen image in art.Imagenes)
                {


                    try
                    {
                        if (image.Nombre_imagen != "sinimagen")
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Nombre_imagen);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            if (response.StatusCode != HttpStatusCode.OK)
                            {

                                image.Nombre_imagen = "fallacarga";
                            }
                        }
                    }
                    catch (WebException)
                    {

                        image.Nombre_imagen = "fallacarga";

                    }

                }

            }

            return aux;
        }
    }
}