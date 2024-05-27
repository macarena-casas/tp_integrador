<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_integrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <% if ((List<Dominio.Inmueble>)Session["inmueblesfiltrados"] != null)
        {
            listainmueble = (List<Dominio.Inmueble>)Session["inmueblesfiltrados"];
            Session.Remove("inmueblesfiltrados");
        }

    %>

    <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">

        <% foreach (Dominio.Inmueble inmueble in listainmueble)

            { %>
        <div class="col-12 col-md-6 col-lg-4 mb-2">

            <div class="card border-success" style="border-color: darkgray; height: 600px; width: 400px">
                <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + inmueble.Id_I) %>">

                    <% if (inmueble.Imagenes[0].Nombre_imagen == "fallacarga")
                        { %>
                    <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="Image">
                    <% }
                        else if (inmueble.Imagenes[0].Nombre_imagen == "sinimagen")
                        { %>
                    <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="Image">
                    <% }
                        else
                        { %>
                    <img src="<%:inmueble.Imagenes[0].Nombre_imagen  %>" class="card-img-top" style="object-fit: scale-down; height: 25vh; width: 100%;" alt="Image">
                    <% }  %>
                </a>


                <center>
                    <div class="card-header text-center" style="font-size: 40px; color: darkgreen;"><strong><%: inmueble.nombre_I  %></strong></div>
                    <div class="card-body text-center" style="margin-bottom: 20px;">
                        <h5 class="card-title" style="font-size: 30px; color: black;">$<%: inmueble.precio_I  %></h5>
                 
                        <p class="card-text" style="font-size: 30px; color: black;"><%:inmueble.categoria_I.nombre_categoria%></p>
                        <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + inmueble.Id_I) %>" class="btn btn-outline-secondary" style="font-weight: bold; border-color: dimgrey;" title="Detalles">+</a>

                    </div>
                </center>
            </div>
        </div>

        <%

            } %>
    </div>
</asp:Content>
