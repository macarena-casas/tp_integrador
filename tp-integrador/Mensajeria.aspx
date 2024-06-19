<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Mensajeria.aspx.cs" Inherits="tp_integrador.Mensajeria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <ul class="nav nav-tabs" style="border-color: aqua">
        <li class="nav-item" style="font-size: 20px;">
            <a class="nav-link active" aria-current="page" href="#" style="color: black; border-color: aqua;"><strong>Principal</strong></a>
        </li>
        <li class="nav-item dropdown" style="font-size: 20px;">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black; border-color: aqua;"><strong>Mensajes</strong></a>
            <ul class="dropdown-menu">
                <asp:Button class="dropdown-item" Text="Bandeja de Salida" runat="server" ID="btnenviados" OnClick="btnenviados_Click" Style="padding: 7px 10px; color: black; background-color: turquoise; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button class="dropdown-item" Text="Bandeja de Entrada" runat="server" ID="btnrecibidos" OnClick="btnrecibidos_Click" Style="padding: 7px 10px; color: black; background-color: turquoise; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button class="dropdown-item" Text="Todos" runat="server" ID="btntodos" OnClick="btntodos_Click" Style="padding: 7px 10px; color: black; background-color: turquoise; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button class="dropdown-item" Text="Papelera" runat="server" ID="btnPapelera" OnClick="btnPapelera_Click" Style="padding: 7px 10px; color: black; background-color: turquoise; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button class="dropdown-item" Text="Nuevo Mensaje" runat="server" ID="btnnuevo" OnClick="btnnuevo_Click" Style="padding: 7px 10px; color: black; background-color: turquoise; font-weight: bold; text-align: center; border: 2px solid darkcyan; cursor: pointer; transition: all 300ms ease;" />

            </ul>
        </li>
    </ul>
    <br />
    <br />
 
    <% foreach (Dominio.Email email in listaemail)
        { %>
    <div class="container-fluid " style="height: 50px; width: 98%; margin-left: 10px; margin-right: 10px; margin-top: 10px; border: 2px solid darkcyan; padding: 5px; align-content: center;">
        <div class="row g-3">

            <div class="col-5 ">
                <p class="card-text" style="font-size: 30px; color: darkcyan; font-weight: bold; align-items: flex-start;"><%:email.asunto%></p>
            </div>
            <div class="col-5 text-start">
                <p class="card-text" style="font-size: 30px; color: darkcyan; font-weight: bold; align-items: flex-start;"><%:email.remitente%></p>
            </div>
            <div class="col-2 d-flex justify-content-end align-items-center">

                <a href="<%:ResolveUrl("~/Mensaje.aspx?id=" + email.Id) %>" class="btn btn-outline-info" style="border-radius: 20px; height: 35px; font-size: 20px; font-weight: bold; border-color: darkturquoise;" title="modif"><i class="bi bi-arrow-right-circle"></i></a>

              
            </div>
        </div>
    </div>
    <%} %>

</asp:Content>
