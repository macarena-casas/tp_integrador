<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="ConfirmarUsuario.aspx.cs" Inherits="tp_integrador.ConfirmarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="font-weight: bold; color: darkblue; text-align: center; margin-top: 30px; font-size: 60px;"><u>Usuarios</u> <u>a</u> <u>Confirmar:</u></h1>
    <div class="row" style="margin-top: 100px; margin-left: 25px; margin-right: 25px; margin-bottom: 40px;">
        <% foreach (Dominio.DatosPersonales datos in datosusuarios)
            { %>

        <div class="col-12 col-md-6 col-lg-4 mb-2">
            <div class="card border-primary" style="background: lightblue; border-radius: 3%; height: 350px; width: 350px;">

                <div class="card-header " style="font-size: 15px; color: darkblue; border-block-color: blue;">
                    <strong>Nombre y Apellido: <%:datos.Nombre %> <%:datos.Apellido %> </strong>
                </div>
                <div class="card-body " style="margin-bottom: 2px;">
                    <h5 class="card-title" style="font-size: 15px; color: black;">Email: <%:datos.Email %></h5>
                    <p class="card-text" style="font-size: 15px; color: black;">Dni: <%:datos.DNI %></p>
                    <p>Telefono: <%:datos.Telefono %> </p>
                    <p>Domicilio: <%:datos.Domicilio %> </p>
                    <p>Fecha de Nacimiento: <%:datos.FechaNacimiento %></p>
                </div>
                <div class="card-footer" style="border-block-color: blue; align-content: center; text-align: center; height: 50px; margin-top: 5px;">

                    <asp:Button ID="btnconfirmarUsuario" runat="server" Text="Confirmar" OnClick="btnconfirmarUsuario_Click" CommandArgument='<%# Eval("datos.Email") %>' UseSubmitBehavior="false" Class="btn btn-outline-success" Style="font-size: 15px; font-weight: bold; width: 85px; margin-left: 10px; height: 40px;" />
                    <asp:Button ID="btnRechazarUsuario" runat="server" Text="Rechazar" OnClick="btnRechazarUsuario_Click" Class="btn btn-outline-danger" Style="font-size: 15px; font-weight: bold; width: 85px; margin-left: 10px; height: 40px;" />

                </div>

            </div>
        </div>
        <%
            } %>
    </div>

</asp:Content>
