<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Alta_Modificacion.aspx.cs" Inherits="tp_integrador.Alta_Modificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h1 style="text-align: center; color: midnightblue; font-size: 50px; text-decoration-line: underline"><strong>Mi Inmueble</strong></h1>
    <br />
    <br />
    <div class="row g-3">
        <div class="col-md-6" style="margin-left: 25px;">
            <label for="inputnombre" class="form-label"><strong>Nombre </strong></label>
            <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: aqua" ID="txtnombre" placeholder="Ingrese nombre del inmueble" />
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="input-group mb-3" style="height: 50px; width: 200px; margin-left: 25px;">
            <span class="input-group-text" style="border-color: aqua"><strong>$</strong>
                <asp:TextBox runat="server" ID="txtprecio" Style="border: none;" placeholder=" Ingrese un valor" />
            </span>
        </div>
    </div>
    <br />
    <div class="col-md-4" style="margin-left: 25px; font-weight: bold;">
        <label for="inputState" class="form-label">Tipo de Propiedad</label>
        <asp:DropDownList runat="server" ID="selpropiedad" class="form-select" Style="border-color: aqua">
            <asp:ListItem Text="text1" />
        </asp:DropDownList>
    </div>
    <br />
    <div class="row g-3">
        <div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
            <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Ambientes:</label>
            <asp:DropDownList runat="server" ID="ambientes" class="form-select" Style="width: 20px; border-color: aqua; font-weight: bold;">
                <asp:ListItem Text="1" />
                <asp:ListItem Text="2" />
                <asp:ListItem Text="3" />
                <asp:ListItem Text="4" />
                <asp:ListItem Text="5" />
            </asp:DropDownList>
        </div>
        <div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
            <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Baños:</label>
            <asp:DropDownList runat="server" ID="baños" class="form-select" Style="width: 20px; border-color: aqua; font-weight: bold;">
                <asp:ListItem Text="1" />
                <asp:ListItem Text="2" />
                <asp:ListItem Text="3" />
                <asp:ListItem Text="4" />
                <asp:ListItem Text="5" />
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="col-md-6" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">Dirección</label>
            <asp:TextBox runat="server" type="text" class="form-control" ID="txtdireccion" Style="border-color: aqua;" />
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="col-md-1" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">CP</label>
            <asp:TextBox runat="server" type="text" class="form-control" ID="txtCp" Style="border-color: aqua;" />
        </div>
        <div class="col-md-4" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">Localidad</label>
            <asp:TextBox runat="server" type="text" class="form-control" ID="txtlocalidad" Style="border-color: aqua;" />
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
            <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Tipo de Operación: </label>
            <asp:DropDownList runat="server" ID="tipoope" class="form-select" Style="width: 20px; border-color: aqua; font-weight: bold;">
                <asp:ListItem Text="Alquiler" />
                <asp:ListItem Text="Venta" />
                <asp:ListItem Text="3" />
                <asp:ListItem Text="4" />
                <asp:ListItem Text="5" />
            </asp:DropDownList>
        </div>
    </div>
    <br />
    <div class="col-12" style="margin-left: 25px;">
        <div class="card border-info" style="width: 90%;">
            <div class="form-check" style="text-align: center;">
                <label for="inputState" class="form-label"><strong>Servicios:</strong></label>
                <div class="mx-auto d-flex">
                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Agua Corriente" runat="server" ID="checkagua" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline ">
                        <asp:CheckBox Text="Gas Natural" runat="server" ID="checkgas" Style="font-weight: bold; color: black;" />
                    </div>

                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Luz" runat="server" ID="Checkluz" Style="font-weight: bold; color: black;" />
                    </div>

                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Cochera" runat="server" ID="Checkcochera" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline ">
                        <asp:CheckBox Text="Patio" runat="server" ID="Checkpatio" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Cloaca" runat="server" ID="Checkcloaca" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Pavimento" runat="server" ID="Checkpavimento" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:CheckBox runat="server" ID="Checkcalefaccion" Text="Calefacción" Style="font-weight: bold; color: black;" />
                    </div>
                    <div class="form-check form-check-inline">
                        <asp:CheckBox Text="Aire Acondicionado" runat="server" ID="Checkaire" Style="font-weight: bold; color: black;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-md-10" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">Descripción:</label>
            <asp:TextBox runat="server" type="text" class="form-control" ID="txtdescripcion" Style="border-color: aqua;" />
        </div>
    </div>
    <div>
        <br />
        <div class="col-12" style="margin-left: 25px; color: black;">
            <asp:Button Text="Agregar" runat="server" type="submit" class="btn btn-info" ID="btnAgregar" OnClick="btnAgregar_Click" />
           
        </div>
    </div>
    <br />

</asp:Content>
