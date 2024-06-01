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
            <input type="text" class="form-control" style="border-color: aqua" id="txtnombre" placeholder="Ingrese nombre del inmueble" />
        </div>

    </div>
    <br />
    <div class="row g-3">

        <div class="input-group mb-3" style="height: 50px; width: 200px; margin-left: 25px;">
            <span class="input-group-text" style="border-color: aqua"><strong>$</strong></span>
            <input type="text" class="form-control" style="border-color: aqua" id="decimalprecio" placeholder="Ingrese un valor" />
        </div>

    </div>
    <br />
    <div class="col-md-4" style="margin-left: 25px; font-weight: bold;">
        <label for="inputState" class="form-label">Tipo de Propiedad</label>
        <select id="inputpropiedad" class="form-select" style="border-color: aqua">
            <option selected>....</option>
        </select>
    </div>
    <br />
    <div class="row g-3">
        <div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
            <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Ambientes:</label>
            <select class="form-select" id="inputGroupSelect01" style="width: 20px; border-color: aqua; font-weight: bold;">

                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="col-md-6" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="inputdireccion" style="border-color: aqua;">
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="col-md-1" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">CP</label>
            <input type="text" class="form-control" id="inputCp" style="border-color: aqua;">
        </div>
        <div class="col-md-4" style="margin-left: 25px; font-weight: bold;">
            <label for="inputCity" class="form-label">Localidad</label>
            <input type="text" class="form-control" id="inputCity" style="border-color: aqua;">
        </div>
    </div>
    <br />
    <div class="row g-3">
        <div class="col-md-4" style="margin-left: 25px; font-weight: bold; border-color: aqua;">
            <label for="inputState" class="form-label">Tipo de Operación</label>
            <select id="inputState" class="form-select" style="border-color: aqua;">
                <option selected>...</option>
                <option>...</option>
            </select>
        </div>
    </div>
    <br />

    <div class="col-12" style="margin-left: 25px;">
        <div class="form-check">
            <label for="inputState" class="form-label"><strong>Servicio</strong></label>
            <div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="gridCheck">
                    <label class="form-check-label" for="gridCheck">
                        <strong>Agua Corriente</strong>
                    </label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="gasnatural">
                        <label class="form-check-label" for="gridCheck">
                            <strong>Gas natural</strong>
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="luz">
                        <label class="form-check-label" for="gridCheck">
                            <strong>Luz</strong>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="col-12" style="margin-left: 25px;">
            <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
    </div>
    <br />
    <div class="row g-3">
    </div>
</asp:Content>
