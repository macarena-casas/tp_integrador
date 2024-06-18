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
                <li><a class="dropdown-item" href="#"><strong>Recibidos</strong></a></li>
                <li><a class="dropdown-item" href="#"><strong>Enviados</strong></a></li>
                <li><a class="dropdown-item" href="#"><strong>Editar</strong></a></li>

            </ul>
        </li>
    </ul>
    <br />
    <br />
    <asp:Repeater ID="repetir" runat="server" OnItemCommand="repetir_ItemCommand">
        <ItemTemplate>
            <div class="container-fluid " style="height: 50px; width: 98%; margin-left: 10px; margin-right: 10px; margin-top: 10px; border: 2px solid darkcyan; padding: 5px; align-content: center;">
                <div class="row g-3">


                    <div class="col-5 ">
                        <asp:Label Text='<%# Eval("asunto") %>' ID="txtasunt" runat="server" Style="font-size: 30px; color: darkcyan; font-weight: bold; align-items: flex-start;" />
                    </div>
                    <div class="col-5 text-start">
                        <asp:Label Text='<%# Eval("remitente") %>' ID="txtremitent" runat="server" Style="font-size: 25px; font-weight: bold;" />

                    </div>


                    <div class="col-2 d-flex justify-content-end align-items-center">
                        <asp:LinkButton ID="btnSelect" runat="server" CommandName="Select" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-primary d-flex justify-content-center align-items-center" Style="border-radius: 20px; height: 35px; font-size: 20px;">
                         <i class="bi bi-arrow-right-circle"></i>
                        </asp:LinkButton>

                        <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="btn btn-primary d-flex justify-content-center align-items-center" style="border-radius: 20px; height: 35px; font-size: 20px;" >
                            <i class="bi bi-arrow-right-circle"></i>
                        </button>
                    </div>
                    


                </div>
            </div>


        </ItemTemplate>
    </asp:Repeater>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header alert-info">
                    <div class="row g-3">
                        
                        <div class="col-auto">
                            <asp:Label Text="" ID="txtasunto" runat="server" Style="font-size: 30px; color: darkcyan; font-weight: bold; align-items: flex-start;" />
                        </div>
                        <div class="col-auto ms-auto">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" style="align-items: flex-end;" aria-label="Cerar"></button>
                        </div>
                        <div class="row g-2">
                            <asp:Label Text="" ID="txtremitente" runat="server" Style="font-size: 25px; font-weight: bold;" />
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <asp:Label Text="" ID="txtMensaje" runat="server" Style="font-size: 15px; font-weight: bold; margin-top: 15px;" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><strong>Cerrar</strong></button>
                    <asp:Button Text="Responder" class="btn btn-primary" ID="btnResponder" OnClick="btnResponder_Click" runat="server" Style="font-weight: bold;" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
