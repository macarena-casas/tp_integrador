using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_integrador
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
           

            Response.Redirect("~/Default.aspx");
        }
        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            try
            {
                usuario.nombre_u = txtEmail.Text;
                usuario.contra_u = txtPass.Text;

                if (negocioUsuario.Loguear(usuario))
                {

                    Session["usuario"] = usuario;

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
                else
                {

                    Session.Add("error", "usuario o contraseña incorrectos...");


                    Response.Redirect("Login.aspx");

                }


            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }
    }
}