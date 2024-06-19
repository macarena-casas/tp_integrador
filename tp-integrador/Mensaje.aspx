<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Mensaje.aspx.cs" Inherits="tp_integrador.Mensaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <div class="registro" style="text-align: center; background: lightblue; border-radius: 3%; min-height: 500px; min-width: 400px;">
                <div method="post-head" style="padding: 0 45px; box-sizing: border-box; left: 20px;">

                    <div class="row g-3">

                        <div class="col-auto">
                            <asp:Label Text="" ID="txtasunto" runat="server" Style="font-size: 30px; color: darkcyan; font-weight: bold; align-items: flex-start;" />
                        </div>
                        <div class="col-auto ms-auto">
                            <asp:Button runat="server" type="button" class="btn-close" ID="btncerrar" OnClick="btncerrar_Click" data-bs-dismiss="modal" Style="align-items: flex-end;" aria-label="Cerrar"></asp:Button>
                        </div>
                        <div class="row g-2">
                            <asp:Label Text="" ID="txtremitente" runat="server" Style="font-size: 25px; font-weight: bold;" />
                        </div>
                    </div>
                </div>


                <div method="post-body" style="padding: 0 45px; box-sizing: border-box; left: 20px;">

                    <asp:Label Text="" ID="txtmensaje" runat="server" Style="font-size: 15px; font-weight: bold; margin-top: 15px;" />
                </div>
                <div method="post-footer" style="padding: 0 45px; box-sizing: border-box; left: 20px;">

                    <div class="btn " style="width: 100%; margin-top: 15px; align-content: end; display: flex; justify-content: center; align-items: center;">
                    </div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><strong>Cerrar</strong></button>
                    <asp:Button Text="Responder" class="btn btn-primary" ID="Button1" OnClick="btnResponder_Click" runat="server" Style="font-weight: bold;" />
                    <asp:LinkButton ID="btneliminar" runat="server" OnClick="btnEliminarmensaje_Click" UseSubmitBehavior="false" OnClientClick="return confirm('Esta seguro que desea eliminar ?');">
                            <i class="bi bi-trash-fill text-danger"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
