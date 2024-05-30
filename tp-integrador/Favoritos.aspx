<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="tp_integrador.Favoritos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row aling-items-center">
            <div class="col">
                <h1>Mis Favoritos  </h1>
            </div>
            <div class="col-auto">
                <a href="<%:ResolveUrl("~/Default.aspx?") %>" class="btn btn-success" style="background-color: seagreen; color: ghostwhite; font-weight: bold; border-color: darkslategray">Salir</a>
            </div>
        </div>

    </div>
    <div class="table-responsive">
        <table class="table items-favoritos" style="text-align: center; vertical-align: middle; width: 70%; margin-left: 15%; margin-right: 15%;">
            <thead>
                <tr>
                    <th scope="col" style="color: mediumseagreen; width: 50%;"><strong>Producto</strong></th>
                    <th scope="col" style="width: 50%;"></th>
                    <th scope="col" style="color: mediumseagreen; width: 50%; font: 100;"><strong>Precio</strong></th>
                    <th scope="col" style="color: mediumseagreen; width: 30%;"></th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repetirinmuebles" runat="server">
                    <ItemTemplate>

                        <tr>
                            <td>
                                <asp:Image ID="imgenarticulo" runat="server" ImageUrl='<%# (Eval("inmueble.Imagenes[0].Nombre_imagen").ToString() == "fallacarga") ? "https://previews.123rf.com/images/yoginta/yoginta2301/yoginta230100567/196853824-imagen-no-encontrada-ilustraci%C3%B3n-vectorial.jpg" 
                                        : (Eval("inmueble.Imagenes[0].Nombre_imagen").ToString() == "sinimagen") ? "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg" 
                                        : Eval("inmueble.Imagenes[0].Nombre_imagen") %>'
                                    CssClass="card-img-top" Style="object-fit: scale-down; height: 25vh; width: 50%" alt="Imagen" />
                            </td>
                            <td>
                                <%# Eval("inmueble.nombre_I") %><br />
                                <p style="color: dimgray; font-size: small;"><%# Eval("inmueble.categoria_I.nombre_categoria") %></p>

                            </td>

                            <td style="font-weight: bold;">$<%# Eval("inmueble.precio_I") %></td>
                            <td>
                                <div style="margin-top: 6%; font-size: 20px; margin-left: 7%;">
                                </div>

                                <asp:LinkButton ID="btnEliminarFavorito" runat="server" OnClick="btnEliminarFavorito_Click" CommandArgument='<%# Eval("inmueble.Id_I") %>' UseSubmitBehavior="false" OnClientClick="return confirm('Esta seguro que desea eliminar el inmueble de la lista?');">
                            <i class="bi bi-trash-fill text-danger"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>




    <center>

        <asp:LinkButton ID="FinalizarCompra" runat="server" CommandArgument='<%# Eval("inmueble.codigo_I") %>' UseSubmitBehavior="false">
                           <a class="btn btn-outline-info text-dark text-decoration-none" href="FinalizarCompra.aspx"><strong><strong>Comprar</strong></strong></a>
        </asp:LinkButton>

    </center>
</asp:Content>
