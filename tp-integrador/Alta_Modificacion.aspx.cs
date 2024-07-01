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
    public partial class Alta_Modificacion : System.Web.UI.Page
    {
        public List<Inmueble> listainmueble { get; set; }
        public List<Categoria> listacategoria { get; set; }
        public List<Inmueble> listaPropia { get; set; }
        public List<Ubicacion> listalocalidades { get; set; }
        public Inmueble inmueble { get; set; }
        public Categoria categoria { get; set; }

        NegocioInmueble INegocio = new NegocioInmueble();
        NegocioCategoria CNegocio = new NegocioCategoria();
        NegocioUbicacion UNegocio = new NegocioUbicacion();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuario"] == null)
            {
                Session.Add("error", "Debes Iniciar Sesión para Ingresar");
                Response.Redirect("Login.aspx");
            }

            listainmueble = (List<Inmueble>)Session["listainmueble"];
            int Id_I = Request.QueryString["Id"] != null && int.TryParse(Request.QueryString["Id"], out int id) ? id : -1;
            inmueble = listainmueble.FirstOrDefault(i => i.Id_I == Id_I);
            listacategoria = CNegocio.listar();
            listalocalidades = UNegocio.listar();
            if (!IsPostBack)
            {
                listacategoria = CNegocio.listar();
                listalocalidades = UNegocio.listar();

                selpropiedad.DataSource = listacategoria;
                selpropiedad.DataTextField = "nombre_categoria"; // Propiedad que representa el texto visible
                selpropiedad.DataValueField = "codigo_categoria";   // Propiedad que representa el valor
                selpropiedad.DataBind();

                codigo_postal.DataSource = listalocalidades;
                codigo_postal.DataTextField = "codigo_postal";

                codigo_postal.DataBind();
                localidad.DataSource = listalocalidades;
                localidad.DataTextField = "Localidad";

                localidad.DataBind();
                string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
                localidad.SelectedValue = local.ToString();
            }
            try
            {

                if (inmueble != null && !IsPostBack)
                {

                    txtnombre.Text = inmueble.nombre_I;
                    txtdireccion.Text = inmueble.ubicacion.Direccion;
                    txtprecio.Text = inmueble.precio_I.ToString();
                    baños.SelectedValue = inmueble.baños.ToString();
                    ambientes.SelectedValue = inmueble.ambientes.ToString();
                    selpropiedad.SelectedValue = inmueble.categoria_I.codigo_categoria.ToString();
                    codigo_postal.SelectedValue = inmueble.ubicacion.Codigo_Postal.ToString();
                    localidad.DataBind();
                    string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
                    localidad.SelectedValue = local.ToString();


                    if (inmueble.aguacorriente == true) { checkagua.Checked = true; }
                    if (inmueble.luz == true) { Checkluz.Checked = true; }
                    if (inmueble.gasnatural == true) { checkgas.Checked = true; }
                    if (inmueble.cochera == true) { Checkcochera.Checked = true; }
                    if (inmueble.aireacondicionado == true) { Checkaire.Checked = true; }
                    if (inmueble.patio == true) { Checkpatio.Checked = true; }
                    if (inmueble.pavimento == true) { Checkpavimento.Checked = true; }
                    if (inmueble.cloacas == true) { Checkcloaca.Checked = true; }
                    if (inmueble.calefaccion == true) { Checkcalefaccion.Checked = true; }
                    tipoope.SelectedValue = inmueble.tipo_operacion.ToString();
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

            Page.Validate();
            if (!Page.IsValid)
                return;

            Inmueble inmueble = new Inmueble();
            NegocioInmueble INegocio = new NegocioInmueble();
            Usuario usu = (Usuario)Session["usuario"];

            inmueble.nombre_I = txtnombre.Text;
            inmueble.ubicacion.Direccion = txtdireccion.Text;
            inmueble.precio_I = decimal.Parse(txtprecio.Text);
            inmueble.baños = int.Parse(baños.SelectedValue);
            inmueble.ambientes = int.Parse(ambientes.SelectedValue);
            inmueble.ubicacion.Codigo_Postal = 1617;

            if (checkagua.Checked == true) { inmueble.aguacorriente = true; }
            if (Checkluz.Checked == true) { inmueble.luz = true; }
            if (checkgas.Checked == true) { inmueble.gasnatural = true; }
            if (Checkcochera.Checked == true) { inmueble.cochera = true; }
            if (Checkaire.Checked == true) { inmueble.aireacondicionado = true; }
            if (Checkpatio.Checked == true) { inmueble.patio = true; }
            if (Checkpavimento.Checked == true) { inmueble.pavimento = true; }
            if (Checkcloaca.Checked == true) { inmueble.cloacas = true; }
            if (Checkcalefaccion.Checked == true) { inmueble.calefaccion = true; }
            inmueble.tipo_operacion = tipoope.SelectedValue ;
            inmueble.categoria_I.codigo_categoria = int.Parse(selpropiedad.SelectedValue);
            inmueble.descripcion_I = txtdescripcion.Text;
            inmueble.NombreUsuario = usu.nombre_u;


            // nuevo agregar acumulado
            List<string> imagenUrls = Session["ImagenUrls"] as List<string> ?? new List<string>();
            INegocio.agregar(inmueble, imagenUrls);
            Session["ImagenUrls"] = null;
            NegocioInmueble iManager = new NegocioInmueble();
            listainmueble = iManager.Listacompleta();
            listainmueble = validarurl(listainmueble);
            Session["listainmueble"] = listainmueble;

            Acceso_Datos datos = new Acceso_Datos();
            int id_inmueble = INegocio.ObtenerUltimoId();


           int idUsuario = usu.id_u;
              
           

            string metodoPago = "";
            if (checkHierro.Checked)
            {
                metodoPago = "Hierro";
            }
            else if (checkPlata.Checked)
            {
                metodoPago = "Plata";
            }
            else if (checkOro.Checked)
            {
                metodoPago = "Oro";
            }
            else if (ceckDiamante.Checked)
            {
                metodoPago = "Diamante";
            }
            else if (checkPlatino.Checked)
            {
                metodoPago = "Platino";
            }


            
            

            NegocioUsuario usuario = new NegocioUsuario();
            usuario.Pagar(idUsuario, id_inmueble, metodoPago);


            Response.Redirect("~/Default.aspx");



        }



        protected void txtImagenurl_TextChanged(object sender, EventArgs e)
        {


        }



        protected void btnModificar_Click(object sender, EventArgs e)
        {
            inmueble.nombre_I = txtnombre.Text;
            inmueble.ubicacion.Direccion = txtdireccion.Text;
            inmueble.ubicacion.Codigo_Postal = int.Parse(codigo_postal.SelectedValue);
            inmueble.baños = int.Parse(baños.SelectedValue);
            inmueble.ambientes = int.Parse(ambientes.SelectedValue);
            inmueble.precio_I = decimal.Parse(txtprecio.Text);
            if (checkagua.Checked == true) { inmueble.aguacorriente = true; }
            else { inmueble.aguacorriente = false; }
            if (Checkluz.Checked == true) { inmueble.luz = true; }
            else { inmueble.luz = false; }
            if (checkgas.Checked == true) { inmueble.gasnatural = true; }
            else { inmueble.gasnatural = false; }
            if (Checkcochera.Checked == true) { inmueble.cochera = true; }
            else { inmueble.cochera = false; }
            if (Checkaire.Checked == true) { inmueble.aireacondicionado = true; }
            else { inmueble.aireacondicionado = false; }
            if (Checkpatio.Checked == true) { inmueble.patio = true; }
            else { inmueble.patio = false; }
            if (Checkpavimento.Checked == true) { inmueble.pavimento = true; }
            else { inmueble.pavimento = false; }
            if (Checkcloaca.Checked == true) { inmueble.cloacas = true; }
            else { inmueble.cloacas = false; }
            if (Checkcalefaccion.Checked == true) { inmueble.calefaccion = true; }
            else { inmueble.calefaccion = false; }
            inmueble.categoria_I.codigo_categoria = int.Parse(selpropiedad.SelectedValue);
            inmueble.descripcion_I = txtdescripcion.Text;
            inmueble.tipo_operacion = tipoope.SelectedValue;


            // nuevo agregar acumulado
            List<string> imagenUrls = Session["ImagenUrls"] as List<string> ?? new List<string>();

            Session["ImagenUrls"] = null;

            INegocio.modificar(inmueble);
            NegocioInmueble iManager = new NegocioInmueble();
            listainmueble = iManager.Listacompleta();
            listainmueble = validarurl(listainmueble);
            Session["listainmueble"] = listainmueble;
            if (Session["listapropia"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                listaPropia = iManager.Listapropia(usuario.nombre_u);
                listaPropia = validarurl(listaPropia);
                Session["listaPropia"] = listaPropia;
                Response.Redirect("~/MisPublicaciones.aspx");
            }
            Response.Redirect("~/Default.aspx");

        }


        protected void Btn_addimg_Click(object sender, EventArgs e)
        {
            List<string> imagenUrls = Session["ImagenUrls"] as List<string> ?? new List<string>();


            if (!string.IsNullOrEmpty(txtImagenurl.Text))
            {
                imagenUrls.Add(txtImagenurl.Text);
            }


            Session["ImagenUrls"] = imagenUrls;


            txtImagenurl.Text = string.Empty;
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
        protected void codigo_postal_SelectedIndexChanged(object sender, EventArgs e)
        {
            string local = UNegocio.listarcodigopostal(int.Parse(codigo_postal.SelectedValue));
            localidad.SelectedValue = local.ToString();
        }


        protected void btnInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pagos.aspx");
        }
    }
}