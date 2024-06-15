<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Mensajeria.aspx.cs" Inherits="tp_integrador.Mensajeria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="display: flex; flex-direction: column; text-align: center; gap: 15px;">
        <div style="position: relative;" class="txt-nombre">
            <label>Nombre y apellido</label>
            <asp:TextBox style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtnombre" />
            <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: rgba(255 255 255 ); transition: .3s;" class="fa-solid fa-user"></i>
        </div>
        <div style="position: relative;" class="txt-email">
            <label>Email</label>
            <asp:TextBox style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtemail" />

            <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: rgba(255 255 255 ); transition: .3s;" class="fa-solid fa-envelope"></i>
        </div>
        <div style="position: relative;" class="txt-asunto">
            <label>Asunto</label>
            <asp:TextBox style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtasunto" />
            <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: blue; transition: .3s;" class="fa-solid fa-pen-to-square"></i>
        </div>
        <div style="position: relative;" class="txt-mensaje">
            <label>Mensaje</label>
            <asp:TextBox style="width: 100%; height: 130px; padding: 10px; background: lightblue; border: 3px double; letter-spacing: 1px; border-color: black; outline: none; transition: .3s; color: black; letter-spacing: 1.5px;" runat="server" ID="txtmensaje" />

        </div>
        <asp:Button Style="width: 100%; padding: 10px; outline: none; background: blue; color:black; border: none; transition: .1s; cursor: pointer; font-size: 1rem;" Text="text" runat="server" ID="btnaceptar" />
    </div>


</asp:Content>
