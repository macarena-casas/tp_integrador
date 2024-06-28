<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="tp_integrador.Pagos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="registro" style="background: lightblue; border-radius: 3%;">
            <table>
                <tr style="border-block: double;">
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Hierro</label>
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Plata</label>
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Oro</label>
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Diamante</label>
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Platino</label>
                    </td>
                </tr>
                <tr>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">Precio: 500 
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">Precio: 750
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">Precio: 1000
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">Precio: 1500
                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">Precio: 2500
                    </td>

                </tr>
                <tr>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Caracteristicas: permite publicar 1 imagen y la </label>
                        <label>duracion de la publicacion es de 5 dias</label>


                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Caracteristicas: permite publicar 2 imagen y la </label>
                        <label>duracion de la publicacion es de 10 dias</label>


                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Caracteristicas: permite publicar 4 imagen y la </label>
                        <label>duracion de la publicacion es de 15 dias</label>


                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black;">
                        <label>Caracteristicas: permite publicar 5 imagen y la </label>
                        <label>duracion de la publicacion es de 30 dias</label>


                    </td>
                    <td style="border-left: double; border-right: double; font-weight: bold; color: black; border-spacing: initial">
                        <label>Caracteristicas: permite publicar imagenes ilimitadas y la </label>
                        <label>duracion de la publicacion es permanente</label>


                    </td>
                </tr>
            </table>
            <center>
                <asp:Button Text="Cerrar" runat="server" type="submit" class="btn btn-info" ID="btncerrar" OnClick="btncerrar_Click" />
            </center>
        </div>
    </div>
</asp:Content>
