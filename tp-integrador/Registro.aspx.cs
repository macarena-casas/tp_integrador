﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace tp_integrador
{
    public partial class Registro : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        DatosPersonales datospersonales = new DatosPersonales();
        NegocioUsuario Unegocio = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                usuario = (Usuario)Session["usuario"];
                txtmail.Text = "Bienvenido: " + usuario.nombre_u;
                txtmensaje.Text = "Para continuar es necesario registrar algunos datos extra!";
            }
        }

        protected void btnregistrarse_Click(object sender, EventArgs e)
        {
            try
            {

                usuario.nombre_u = txtemail.Text;
                usuario.contra_u = txtpass.Text;
                Unegocio.agregar(usuario);
                Session["usuario"] = usuario;
                if (Session["usuario"] != null)
                {
                    Response.Redirect("~/Registro.aspx");

                }
                Response.Redirect("~/Default.aspx");
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

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            datospersonales.Nombre = TxtNombre.Text;
            datospersonales.Apellido = TxtApellido.Text;
            datospersonales.DNI = TxtDni.Text;
            datospersonales.Domicilio = TxtDomicilio.Text;
            datospersonales.Telefono = TxtTel.Text;
            datospersonales.Email = usuario.nombre_u;
            datospersonales.FechaNacimiento = DateTime.Parse(TxtFecha.Text);
            Unegocio.agregarDatos(datospersonales);
            Response.Redirect("~/Default.aspx");
        }
    }
}