<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="tp_integrador.Pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="content" style="background-color: rgba(144, 148, 150, 0.8); left: 0; bottom: 0; right: 0; top: 0; display: flex; position: fixed; justify-content: center; align-items: center; z-index: 100;">
      <div class="pa ">

          <div class="Pagos" style="background: lightblue; border-radius: 3%;">

              <h1 style="text-align: center; padding: 10px 0 10px 0; border-bottom: 2px double grey;">Sistema de pago</h1>
              <div method="post" style="padding: 0 45px; box-sizing: border-box; left: 20px;">
                  <div class="username" style="top: 50%; color: black; left: 5px; color: black; font-size: 20px;">
                     
                      <asp:TextBox  style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" cssclass="form-control1" ID="txtEmail" />
                      <label>Usuario</label>
                  </div>

                  <div class="contraseña" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">
                      
                      <asp:TextBox style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" cssclass="form-control1" ID="txtPass" />
                      <label>Contraseña</label>
                  </div>

                   <div class="CLAVE UNICA" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">                               
                       <asp:TextBox style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" cssclass="form-control1" ID="TextBox2" />
                       <label>Clave unica</label>
                      </div>
                   

                  <div class="monto" style="margin-top: 5%; left: 5px; color: black; font-size: 20px;">                               
                    <asp:TextBox   Text="$" style="border: hidden; background-color: transparent; position: relative; border-bottom: 2px solid silver; margin-inline: 0px 0;" runat="server" cssclass="form-control1" ID="TextBox1" />
                    <label>Monto a pagar</label>
                   </div>
                   
                

                  <asp:Button Text="Pagar" id="btnPagar" runat="server" onclick="btnPagar_Click" style="width: 100%; height: 50px; margin-top: 10px; border: 2px solid; background-color: midnightblue; border-radius: 25px; font-size: 18px; color: white; cursor: pointer; outline: none;"/>
                              
               
                  <br />
              </div>
          </div>
          <div class="btn " style="width: 100%; margin-top: 15px; display: flex; justify-content: center; align-items: center;">
              <asp:Button ID="cerrar_btn" Text="Cerrar" runat="server" onclick="cerrar_btn_Click" Style="padding: 7px 10px; background-color: #5488a3; color: #fff; border-radius: 25px; cursor: pointer; transition: all 300ms ease;" />
          </div>
      </div>
  </div>


</asp:Content>
