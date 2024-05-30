<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tp_integrador.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>

        <div class="col" style="height: 100px; width: 600px; justify-content: center;">
            <br />
            <br />

            <div class="mb-3">
                <center>

                    <label for="exampleFormControlInput1" class="form-label">Dirección de correo</label>
                </center>
                <asp:TextBox runat="server" type="email" class="form-control" style="border-color: aqua" id="txtemail" placeholder="Ingrese su correo"/>
            </div>
                

            <center>
                <label for="inputPassword5" class="form-label">Contraseña</label>
            </center>

            <asp:TextBox runat="server" type="password" id="txtContraseña" class="form-control" style="border-color: aqua" aria-describedby="passwordHelpBlock"/>
            <div id="passwordHelpBlock" class="form-text">
                Su contraseña debe tener entre 8 y 20 caracteres, contener letras y números, y no debe contener espacios, caracteres especiales ni emoji.
            </div>
            <br />
           <asp:Button ID="btIngresar" runat="server" Text="Ingresar"  CommandArgument='<%# Eval("") %>'
                UseSubmitBehavior="false"
                class="btn btn-outline-Primary" Style="font-weight: bold; background-color: aqua; font-size: 25px;" />

        </div>
    </center>
</asp:Content>
