<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_integrador.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <div class="registro" style="background: lightblue; border-radius: 3%;">

                <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px double grey;">Registrate:</h1>
                <center>
                    <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                        <div class="username" style="top: 50%; color: black; left: 5px; color: black; font-size: 20px;">
                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtemail" />
                            <label>Email</label>
                        </div>

                        <div class="contraseña" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">

                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtpass" />
                            <label>Contraseña</label>
                        </div>
                        <div class="rep-contraseña" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">
                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtpass2" />
                            <label>Repite La Contraseña</label>
                        </div>
                        <br />  
                        <div class="mx-auto d-flex">
                            <label style="font-size: 15px;margin-left: 10px; ">*Mas de 6 caracteres</label>
                            <label style="font-size: 15px;margin-left: 20px;">*Minimo 1 Mayúscula</label>
                            <label style="font-size: 15px;margin-left: 20px;">*Minimo 1 Número</label>
                            
                       
                        </div>


                    </div>

                </center>
            </div>
            <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">

                <asp:Button Text="Registrarse" CssClass="btn btn-reg" ID="btnregistrarse" OnClick="btnregistrarse_Click" runat="server" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button ID="cerrarbtn" Text="Cerrar" runat="server" OnClick="cerrarbtn_Click" Style=" margin-left: 20px; padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
            </div>
        </div>
    </div>


</asp:Content>
