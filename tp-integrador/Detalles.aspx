<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="tp_integrador.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <center>
            <div class="row" style="margin-top: 10%; margin-bottom: 10%">
                <div class="col-md-8">


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
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else if (inmueble.Imagenes[i].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else
                                    { %>
                                <img src="<%: inmueble.Imagenes[i] %>" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }  %>
                            </div>
                            <%}
                                else
                                {%>


                            <div class="carousel-item ">
                                <% if (inmueble.Imagenes[0].Nombre_imagen == "fallacarga")
                                    { %>
                                <img src="https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else if (inmueble.Imagenes[0].Nombre_imagen == "sinimagen")
                                    { %>
                                <img src="https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% }
                                    else
                                    { %>

                                <img src=" <%: inmueble.Imagenes[i]%>" class="d-block w-100" style="object-fit: scale-down; height: 50vh; width: 100%;" alt="">
                                <% } %>
                            </div>
                            <% }

                                } %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="Anterior">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="Siguiente">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>


                <div class="card border-primary" style="border-color: blue; height: 500px; width: 350px">
                    <center>
                        <div id="Datosdelinmueble">
                            <div class="card-header text-center" style="font-size: 30px; text-align:center; color: midnightblue; border-block-color: blue;">
                                <p><strong id="lblprecio" runat="server" ></strong></p>
                            </div>
                            <div class="card-body text-center" style="margin-bottom: 20px;">
                                <div class="card-title">
                                    <h2><strong id="lblnombre" runat="server" style="font-size: 25px; color: midnightblue; border-block-color: blue;"></strong></h2>
                                </div>
                                <p><strong id="lblcategoria" runat="server" style="font-size: 20px; color:darkblue ;"></strong></p>
                                <p id="lblDescripcion" runat="server"></p>
                                <div class="card-text"></div>





                                <div class="card-footer text-center" style="font-size: 30px; color: darkblue; border-block-color: blue; margin-top: 160px; margin-bottom: 5px;">
                                    <a class="btn btn-primary text-light text-decoration-none" href="Default.aspx" style="margin-bottom: 2px;"><strong>Atrás</strong></a>
                                </div>
                            </div>
                        </div>
                    </center>
                </div>

            </div>

        </center>
    </div>

</asp:Content>
