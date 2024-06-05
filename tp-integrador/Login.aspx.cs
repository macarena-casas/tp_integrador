using Dominio;
using Microsoft.Win32;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_integrador
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btIngresar_Click()
        {
            Usuario usuario=new Usuario();
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            try
            {                                            
                    usuario.nombre_u = txtEmail.Text;
                    usuario.contra_u = txtPass.Text;

                    if (negocioUsuario.Loguear(usuario)) 
                    { 
                    Session.Add("activo", usuario);
                    Response.Redirect("Favoritos.aspx",false);
                    }
                    else 
                    {
                        Session.Add("Error", "usuario o contraseña incorrectos...");
                        Response.Redirect("Error.aspx");
                         
                    }
                
              
                
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

        protected void cerrarbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

       
    }
}