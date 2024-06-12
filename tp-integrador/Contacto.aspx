<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="tp_integrador.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />  
    <br />  

    <div class="container" style="background: lightgrey;">
        <div class="box-info">
            <h1>---------------------------------------------------------------------</h1>
            <h1 style="text-align: center; letter-spacing: 5px;">CONTÁCTATE CON EL PROPIETARIO</h1>
            <div class="data" style="padding-top: 100px">
                <table style="text-align: center; align-items: center">
                    <tr>
                        <td style="padding-right: 100px">
                            <h2>Numero de telefono</h2>
                        </td>

                        <td style="padding-right: 100px">
                            <h2>Email</h2>
                        </td>

                        <td style="padding-right: 100px">
                            <h2>Localidad</h2>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding-right: 90px">
                            <p style="font-size: 1rem;"><i style="color: crimson; margin-right: 10px; font-size: 25px;" class="fa-solid fa-phone"></i>+1 xx xxxx xxxx</p>
                        </td>
                        <td style="padding-right: 90px">
                            <p style="font-size: 1rem;"><i style="color: crimson; margin-right: 10px; font-size: 25px;" class="fa-solid fa-envelope"></i>fulanito@gmial.com</p>
                        </td>
                        <td style="padding-right: 90px">
                            <p style="font-size: 1rem;"><i style="color: crimson; margin-right: 10px; font-size: 25px;" class="fa-solid fa-location-dot"></i>gutemberg 850</p>
                        </td>

                    </tr>
                </table>
            </div>
        </div>
        <div style="display: flex; flex-direction: column; text-align: center; gap: 15px;">
            <div style="position: relative;" class="txt-nombre">
                <label>Nombre y apellido</label>
                <asp:TextBox  style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtnombre" />
                <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: rgba(255 255 255 ); transition: .3s;" class="fa-solid fa-user"></i>
            </div>
            <div style="position: relative;" class="txt-email">
                <label>Email</label>
                 <asp:TextBox  style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtemail" />

                <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: rgba(255 255 255 ); transition: .3s;" class="fa-solid fa-envelope"></i>
            </div>
            <div style="position: relative;" class="txt-asunto">
                <label>Asunto</label>
                <asp:TextBox  style="width: 100%; height: 40px; padding: 0 10px; outline: none; background: lightblue; border: 3px double; border-color: black; letter-spacing: 1px; transition: .3s; color: black;" runat="server" ID="txtasunto" />
                <i style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; color: blue; transition: .3s;" class="fa-solid fa-pen-to-square"></i>
            </div>
            <div style="position: relative;" class="txt-mensaje">
                <label>Mensaje</label>
                 <asp:TextBox  style="width: 100%; height: 130px; padding: 10px; background: lightblue; border: 3px double; letter-spacing: 1px; border-color: black; outline: none; transition: .3s; color: black; letter-spacing: 1.5px;" runat="server" ID="txtmensaje" />

            </div>
            <asp:Button Style="width: 100%; padding: 10px; outline: none; background: blue; color: #fff; border: none; transition: .1s; cursor: pointer; font-size: 1rem;" Text="text" runat="server" ID="btnaceptar" OnClick="btnaceptar_Click" />
            <div>
                <h1>---------------------------------------------------------------------
                </h1>
            </div>
        </div>
    </div>
</asp:Content>





















