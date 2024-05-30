<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="FavoritosVacio.aspx.cs" Inherits="tp_integrador.FavoritosVacio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 style="text-align:center;font-family:Ananda;color:black;text-decoration-line:underline">No se agregaron favoritos</h1>
    <img style="width:100%;height:600px" src="https://imgs.search.brave.com/9nEUrgj_dCbX4qPy0FMP8FoOEpxN_xRqOD0h0L4qFXU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/cGl4YWJheS5jb20v/cGhvdG8vMjAxNy8x/MS8xNi8xNi8yOS9y/ZWFsLWVzdGF0ZS0y/OTU1MDU3XzY0MC5q/cGc" alt="" />
    
  
 <div class="btn-container" style="display: flex; justify-content: center; padding-bottom: 40px;">
     <a href="<%: ResolveUrl("~/Default.aspx") %>" class="btn btn-outline-light btn-lg" style="font-weight: bold; border-color: dimgray; color: white; background-color:blue;"><strong>Volver al Inicio </strong></a>
 </div>
</asp:Content>
