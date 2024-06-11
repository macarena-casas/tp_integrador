﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using System.Net;

namespace tp_integrador
{
    public partial class MisPublicaciones : System.Web.UI.Page
    {
        public List<Inmueble> listaPropia { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listainmueble"] != null)
            {
                NegocioInmueble iManager = new NegocioInmueble();
                listaPropia = iManager.Listapropia("Normal");// cuando el login funcione recibiria el nombre de usuario y listaria las publicacione del usuario
                listaPropia = validarurl(listaPropia);
                Session["listaPropia"] = listaPropia;
            }
            else
            {

                listaPropia = (List<Inmueble>)Session["listaPropia"];
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