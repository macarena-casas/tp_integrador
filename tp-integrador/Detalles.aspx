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
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="previous">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">next</span>
                        </button>
                    </div>
                    <br />
                    <center>
                        <asp:Button ID="btnagregarfavorito" runat="server" Text="Agregar a Favorito" OnClick="btnagregarfavorito_Click" CssClass="btn btn-primary" Style="background-color: aqua; color: black; font-weight: bold; border-color: dimgrey; width: 30%" />
                        <a class="btn btn-primary text-light text-decoration-none" href="Default.aspx" style="margin-bottom: 2px; width: 30%"><strong>Atrás</strong></a>
                    </center>
                </div>


                <div class="card border-primary" style="border-color: blue; height: 600px; width: 350px">
                    <center>
                        <div id="Datosdelinmueble">
                            <div class="card-header text-center" style="font-size: 30px; text-align: center; color: midnightblue; border-block-color: blue;">
                                <p><strong id="lblprecio" runat="server"></strong></p>
                            </div>
                            <div class="card-body text-center" style="margin-bottom: 20px;">
                                <div class="card-title">
                                    <h2><strong id="lblnombre" runat="server" style="font-size: 25px; color: midnightblue; border-block-color: blue;"></strong></h2>
                                </div>
                                <p><strong id="lblcategoria" runat="server" style="font-size: 20px; color: darkblue;"></strong></p>
                                <p><strong id="lblDescripcion" runat="server" style="font-size: 16px; color: navy;"></strong></p>
                                   <div class="row g-12">      
                                <div class="input-group mb-3" style=" width: 50%; border-color: aqua; margin-left: 10px; font-weight: bold;">
                                <asp:Label Text="Ambientes: " runat="server" Style="font-size: 20px; color: darkblue; " />
                                    <asp:Label Text="" runat="server" ID="lblambientes" Style="font-size: 20px; color: darkblue;" />
                               </div>
                                <div class="input-group mb-3" style=" width: 40%; border-color: aqua; font-weight: bold;">
                                <asp:Label Text="Baños: " runat="server" Style="font-size: 20px; color: darkblue; " />
                                <asp:Label Text="" runat="server" ID="lblbaños" Style="font-size: 20px; color: darkblue;" />
                                 </div>
                                 </div>
                                     <br />
                                <div class="form-check" style="text-align: center;">
                                    <label for="inputState" class="form-label" style="color: navy;"><strong>Servicio:</strong></label>

                                    <div class="mx-auto d-flex" style="justify-content: center;">
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox Text="Agua Corriente" runat="server" ID="checkagua" disabilited="true" BorderColor="Turquoise" Style="font-weight: bold;" />
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox Text="Gas Natural" runat="server" ID="checkgas" BorderColor="Turquoise" Style="font-weight: bold;" />
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <asp:CheckBox Text="Luz" runat="server" ID="Checkluz" Style="font-weight: bold; border-color: aqua;" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row g-3">
                                        <div class="mx-auto d-flex" style="justify-content: center;">
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Cochera" runat="server" ID="Checkcochera" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Patio" runat="server" ID="Checkpatio" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row g-3">
                                        <div class="mx-auto d-flex" style="justify-content: center;">
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Calefacción" runat="server" ID="Checkcalefaccion" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <asp:CheckBox Text="Aire" runat="server" ID="Checkaire" BorderColor="Turquoise" Style="font-weight: bold;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </center>
                </div>
            </div>
        </center>
    </div>
</asp:Content>
