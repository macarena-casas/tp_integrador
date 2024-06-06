<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_integrador.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if ((List<Dominio.Inmueble>)Session["inmueblesfiltrados"] != null)
        {
            listainmueble = (List<Dominio.Inmueble>)Session["inmueblesfiltrados"];
            Session.Remove("inmueblesfiltrados");
        }%>


    <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">

        <% foreach (Dominio.Inmueble inmueble in listainmueble)
            { %>

        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card border-primary" style="border-color: blue; height: 550px; width: 350px">
                <div id="carouselExampleDark" class="carousel carousel-dark slide">
                    <div class="carousel-indicators">


                        <% for (int i = 0; i < inmueble.Imagenes.Count(); i++)
                            { %>
                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="<%= i %>"
                            <% if (i == 0)
                            { %>
                            class="active" aria-current="true" <% } %> aria-label="Slide <%= i + 1 %>">
                        </button>
                        <% } %>
                    </div>
                    <div class="carousel-inner">
                        <%
                            bool first = true;
                            for (int i = 0; i < inmueble.Imagenes.Count(); i++)
                            {
                                if (first)
                                {
                                    first = false; %>
                        <div class="carousel-item active">

                            <% if (inmueble.Imagenes[i].Nombre_imagen == "fallacarga")
                                { %>
                            <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }
                                else if (inmueble.Imagenes[i].Nombre_imagen == "sinimagen")
                                { %>
                            <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }
                                else
                                { %>
                            <img src="<%: inmueble.Imagenes[i] %>" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }  %>
                        </div>
                        <%}
                            else
                            {%>
                        <div class="carousel-item ">
                            <% if (inmueble.Imagenes[0].Nombre_imagen == "fallacarga")
                                { %>
                            <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% }
                                else if (inmueble.Imagenes[0].Nombre_imagen == "sinimagen")
                                { %>
                            <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: fill; height: 300px; width: 400px;" alt="">
                            <% }
                                else
                                { %>
                            <img src=" <%: inmueble.Imagenes[i]%>" class="d-block w-100" style="object-fit: fill; height: 250px; width: 350px;" alt="">
                            <% } %>
                        </div>
                        <% }
                            } %>
                    </div>

                    <button class="carousel-control-prev" id="ant" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="Anterior">
                        <span class="carousel-control-prev-icon " aria-hidden="true"></span>
                        <span class="visually-hidden">Anterior</span>
                    </button>

                    <button class="carousel-control-next" id="sig" type="button" data-bs-target="#carouselExampleDark " data-bs-slide="Siguiente">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Siguiente</span>
                    </button>

                </div>
                 <center>
                    <div class="card-header text-center" style="font-size: 30px; color: darkblue; border-block-color: blue;"><strong><%: inmueble.nombre_I  %></strong></div>
                    <div class="card-body text-center" style="margin-bottom: 20px;">
                        <h5 class="card-title" style="font-size: 20px; color: black;">$<%: inmueble.precio_I  %></h5>
                        <p class="card-text" style="font-size: 20px; color: black;"><%:inmueble.categoria_I.nombre_categoria%></p>
                        <a href="<%: ResolveUrl("~/Detalles.aspx?id=" + inmueble.Id_I) %>" class="btn btn-outline-info" style="font-weight: bold; border-color: Highlight;" title="Detalles">+</a>
                        <a href="<%: ResolveUrl("~/Alta_Modificacion.aspx?id=" + inmueble.Id_I) %>" class="btn btn-outline-info" style="font-weight: bold; border-color: Highlight;" title="modif">modificar</a>
                        <br />  
                        <br />  

                        <a href="Default.aspx?id=<%:inmueble.Id_I %>" class="btn btn-outline-light" usesubmitbehavior="false" commandargument='<%=inmueble.Id_I%>'
                            style="background-color: aqua; color: black; font-weight: bold; border-color: dimgray">Agregar a Favoritos <i class="bi bi-star-fill "></i></a>
                    </div>
                </center>

            </div>
        </div>

        <%
            } %>
    </div>
</asp:Content>
