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
    public partial class Alta_Modificacion : System.Web.UI.Page
    {
        public List<Inmueble> listainmueble { get; set; }
        public Inmueble inmueble { get; set; }
        public Categoria categoria { get; set; }

        NegocioInmueble INegocio = new NegocioInmueble();

        protected void Page_Load(object sender, EventArgs e)
        {

            listainmueble = (List<Inmueble>)Session["listainmueble"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            inmueble = listainmueble.FirstOrDefault(i => i.Id_I == Id_I);
            try
            {

                if (inmueble != null && !IsPostBack)
                {

                    txtnombre.Text = inmueble.nombre_I;
                    //txtdireccion.Text = inmueble.categoria_I.nombre_categoria;
                    txtprecio.Text = "$" + inmueble.precio_I.ToString();
                    baños.SelectedValue = inmueble.baños.ToString();
                    ambientes.SelectedValue = inmueble.ambientes.ToString();
                    if (inmueble.aguacorriente == true) { checkagua.Checked = true; }
                    if (inmueble.luz == true) { Checkluz.Checked = true; }
                    if (inmueble.gasnatural == true) { checkgas.Checked = true; }
                    if (inmueble.cochera == true) { Checkcochera.Checked = true; }
                    if (inmueble.aireacondicionado == true) { Checkaire.Checked = true; }
                    if (inmueble.patio == true) { Checkpatio.Checked = true; }
                    if (inmueble.pavimento == true) { Checkpavimento.Checked = true; }
                    if (inmueble.cloacas == true) { Checkcloaca.Checked = true; }
                    if (inmueble.calefaccion == true) { Checkcalefaccion.Checked = true; }
                    // tipoope.SelectedValue = inmueble.tipooperacion.ToString();
                    selpropiedad.SelectedValue = inmueble.categoria_I.nombre_categoria.ToString();
                    txtdescripcion.Text = inmueble.descripcion_I;
                    txtImagenurl.Text = inmueble.Imagenes[0].Nombre_imagen;
                    imginmueble.ImageUrl = txtImagenurl.Text;

                }


                /*
                 if (inmueble == null)
                 {
                     Response.Redirect("~/Default.aspx");
                 }*/

            }

            catch (Exception ex)
            {
                Response.Redirect("~/Default.aspx");
                throw ex;
            }


        }



        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Inmueble inmueble = new Inmueble();
            NegocioInmueble INegocio = new NegocioInmueble();
            inmueble.nombre_I = txtnombre.Text;
            inmueble.categoria_I.nombre_categoria = txtdireccion.Text;
            //inmueble.precio_I = decimal.Parse(txtprecio.Text);
            inmueble.baños = int.Parse(baños.SelectedValue);
            inmueble.ambientes = int.Parse(ambientes.SelectedValue);

            if (checkagua.Checked == true) { inmueble.aguacorriente = true; }
            if (Checkluz.Checked == true) { inmueble.luz = true; }
            if (checkgas.Checked == true) { inmueble.gasnatural = true; }
            if (Checkcochera.Checked == true) { inmueble.cochera = true; }
            if (Checkaire.Checked == true) { inmueble.aireacondicionado = true; }
            if (Checkpatio.Checked == true) { inmueble.patio = true; }
            if (Checkpavimento.Checked == true) { inmueble.pavimento = true; }
            if (Checkcloaca.Checked == true) { inmueble.cloacas = true; }
            if (Checkcalefaccion.Checked == true) { inmueble.calefaccion = true; }
            //  inmueble.tipooperacion = tipoope.SelectedValue ;
            inmueble.categoria_I.nombre_categoria = selpropiedad.SelectedValue;
            inmueble.descripcion_I = txtdescripcion.Text;
            INegocio.modificar(inmueble);
            // INegocio.agregar(inmueble);



            //txtdireccion
            //txtlocalidad
            //txtCp

        }

        protected void txtImagenurl_TextChanged(object sender, EventArgs e)
        {


            string urls = txtImagenurl.Text;
             List<string> imagenes = urls.Split(',').Select(url => url.Trim()).ToList();
           


            if (imagenes.Count > 0)
            {
                inmueble.Imagenes[0].Nombre_imagen = imagenes[0];
            }
            if (imagenes.Count > 1)
            {
                inmueble.Imagenes[1].Nombre_imagen = imagenes[1];
            }
            if (imagenes.Count > 2)
            {
                inmueble.Imagenes[2].Nombre_imagen = imagenes[2];
            }


            Session["Imagenes"] = imagenes;
            Session["ImagenesCount"] = imagenes.Count;
        }



        protected void btnModificar_Click(object sender, EventArgs e)
        {
            inmueble.nombre_I = txtnombre.Text;
            inmueble.categoria_I.nombre_categoria = txtdireccion.Text;

            inmueble.baños = int.Parse(baños.SelectedValue);
            inmueble.ambientes = int.Parse(ambientes.SelectedValue);

            INegocio.modificar(inmueble);
            Response.Redirect("~/Default.aspx");

        }
    }
}