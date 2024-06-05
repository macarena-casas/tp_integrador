<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_integrador.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h2>Registrate</h2>
            <div class="mb-3">
                <label class="label-reg">Email</label>
                <asp:TextBox runat="server" cssclass="form-control1" ID="txtEmail" />
            </div>
            <div class="mb-3">
    <label class="label-reg">Contraseña</label>
    <asp:TextBox runat="server" cssclass="form-control1" ID="TxtPass" />
</div>
        </div>

        <asp:Button Text="Registrarse" CssClass="btn btn-reg" ID="btnregistrarse" OnClick="btnregistrarse_Click" runat="server"/>
        <a href="Default.aspx">Cancelar</a>
    </div>


</asp:Content>
