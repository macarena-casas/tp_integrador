<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tp_integrador.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
        <div class="reg ">

            <%if (Session["usuario"] == null)
                { %>
            <div class="registro" style="background: lightblue; border-radius: 3%;">

                <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px double grey;">Registrate:</h1>
                <center>
                    <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                        <div class="username" style="top: 50%; color: black; left: 5px; color: black; font-size: 20px;">
                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="txtemail" />
                            <label>Email</label>
                        </div>

                        <div class="contraseña" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">

                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server"  type="password" CssClass="form-control1" ID="txtpass" />
                            <label>Contraseña</label>
                        </div>
                        <div class="rep-contraseña" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">
                            <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" type="password" CssClass="form-control1" ID="txtpass2" />
                            <label>Repite La Contraseña</label>
                        </div>
                        <br />
                        <div class="mx-auto d-flex">
                            <label style="font-size: 15px; margin-left: 10px;">*Mas de 6 caracteres</label>
                            <label style="font-size: 15px; margin-left: 20px;">*Minimo 1 Mayúscula</label>
                            <label style="font-size: 15px; margin-left: 20px;">*Minimo 1 Número</label>


                        </div>


                    </div>

                </center>
            </div>
             <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">

                <asp:Button Text="Registrarse" CssClass="btn btn-reg" ID="btnregistrarse" OnClick="btnregistrarse_Click" runat="server" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
                <asp:Button ID="cerrarbtn" Text="Cerrar" runat="server" OnClick="cerrarbtn_Click" Style="margin-left: 20px; padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
            </div>
            <%} %>
            <%if (Session["usuario"] != null)

                { %>
            <div class="card border-primary" style="background: lightblue; border-radius: 3%; height: 450px; width: 400px;">
                <center>
                    <div class="mail" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">
                        <asp:Label ID="txtmail" runat="server" Style="margin-top: 10px; font-size: 20px; color: darkcyan; font-weight: bold;" />
                    </div>
                    <div class="mensaje" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">
                        <asp:Label ID="txtmensaje" runat="server" Style="margin-top: 10px; font-size: 15px; color: darkred; font-weight: bold;" />
                    </div>
                </center>
                <div class="nombre" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 20px;">
                    <asp:Label Text="Nombre: " ID="txtnom" runat="server" Style="margin-top: 10px; font-size: 15px; color: black; font-weight: bold;" />
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="TxtNombre" />
                </div>
                <div class="apellido" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 15px; font-weight: bold;">
                    <label>Apellido: </label>
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="TxtApellido" />
                </div>
                <div class="domicilio" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 15px; font-weight: bold;">
                    <label>Domicilio: </label>
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="TxtDomicilio" />
                </div>
                <div class="dni" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 15px; font-weight: bold;">
                    <label>Dni: </label>
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="TxtDni" />
                </div>
                <div class="telefono" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 15px; font-weight: bold;">
                    <label>Telefono: </label>
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="form-control1" ID="TxtTel" />
                </div>
                <div class="Fecha" style="margin-top: 5%; margin-left: 10px; color: black; font-size: 15px; font-weight: bold;">
                    <label>Fecha de Nacimiento: </label>
                    <asp:TextBox Style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" CssClass="date" ID="TxtFecha" TextMode="Date" />
                </div>
            </div>
             <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">
                <asp:Button Text="Finalizar" CssClass="btn btn-reg" ID="btnFinalizar" OnClick="btnFinalizar_Click" runat="server" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
        </div>
            <%} %>           
        </div>
    </div>

</asp:Content>
