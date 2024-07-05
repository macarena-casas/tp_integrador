﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Alta_Modificacion.aspx.cs" Inherits="tp_integrador.Alta_Modificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .Validacion {
            color: red;
            font-size: 14px;
        }
    </style>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <h1 style="text-align: center; color: midnightblue; font-size: 50px; text-decoration-line: underline"><strong>Mi Inmueble</strong></h1>
    <br />
    <br />

    <div class="row g-3">
        <div class="col-md-6">
            <div class="row g-3" style="margin-left: 15px; font-weight: bold; height: 100px;">
                <label for="inputnombre" class="form-label"><strong>Nombre </strong></label>
                <asp:TextBox runat="server" type="text" class="form-control" Style="border-color: aqua" ID="txtnombre" placeholder="Ingrese nombre del inmueble" required="true" />
                <asp:RequiredFieldValidator CssClass="Validacion" ErrorMessage="Campo obligatorio" ControlToValidate="txtnombre" runat="server" />
               
            </div>
            <br />
               <br />
            <div class="row g-3">
                <div class="input-group mb-3" style="height: 50px; width: 200px; margin-left: 25px; margin-top: 15px;">
                    <span class="input-group-text" style="border-color: aqua"><strong>$</strong>
                        <asp:TextBox runat="server" ID="txtprecio" Style="border: none;" placeholder=" Ingrese un valor" />
                        <asp:RegularExpressionValidator ErrorMessage="El precio solo admite numeros" ValidationGroup="GroupRegistro" ControlToValidate="txtprecio" runat="server" ValidationExpression="^[0-9]+$" CssClass="text-danger" Display="Dynamic" />
                    </span>
                </div>
            </div>
            <div class="row g-3" style="margin-left: 25px; font-weight: bold;">

                <label for="inputGroupSelect01" class="form-label">Tipo de Propiedad</label>
                <asp:DropDownList runat="server" ID="selpropiedad" AppendDataBoundItems="true" class="form-select" Style="border-color: aqua">
                </asp:DropDownList>

            </div>
            <br />
            <div class="row g-3">
                <div class="input-group mb-3" style="height: 45px; width: 280px; border-color: aqua; margin-left: 25px; font-weight: bold;">
                    <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Ambientes:</label>
                    <asp:DropDownList runat="server" ID="ambientes" class="form-select" Style="width: 15px; border-color: aqua; font-weight: bold;" required="true">
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                        <asp:ListItem Text="5" />
                    </asp:DropDownList>
                </div>
                <div class="input-group mb-3" style="height: 45px; width: 280px; border-color: aqua; margin-left: 25px; font-weight: bold;">
                    <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Baños:</label>
                    <asp:DropDownList runat="server" ID="baños" class="form-select" Style="width: 15px; border-color: aqua; font-weight: bold;" required="true">
                        <asp:ListItem Text="1" />
                        <asp:ListItem Text="2" />
                        <asp:ListItem Text="3" />
                        <asp:ListItem Text="4" />
                        <asp:ListItem Text="5" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row g-3">
                <div class="col-md-6" style="margin-left: 25px; font-weight: bold;">
                    <label for="inputCity" class="form-label" style="">Dirección</label>
                    <asp:TextBox runat="server" type="text" class="form-control" ID="txtdireccion" Style="border-color: aqua;" />
                </div>
            </div>
            <asp:UpdatePanel ID="Updatepanel2" runat="server" style="margin-left: 50px;">
                <ContentTemplate>
                    <div class="row g-3">
                        <div class="col-md-3" style="margin-left: 25px; font-weight: bold;">
                            <label for="inputGroupSelect01" class="form-label">Codigo Postal</label>
                            <asp:DropDownList runat="server" ID="codigo_postal" OnSelectedIndexChanged="codigo_postal_SelectedIndexChanged" AutoPostBack="true" class="form-select" Style="border-color: aqua" required="true">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-8" style="margin-left: 25px; font-weight: bold;">
                            <label for="inputGroupSelect01" class="form-label">Localidad</label>
                            <asp:DropDownList runat="server" ID="localidad" class="form-select" Style="border-color: aqua" required="true">
                            </asp:DropDownList>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


        <div class="col-10 col-md-6">

            <asp:UpdatePanel ID="Updatepanel1" runat="server" style="margin-left: 50px;">
                <ContentTemplate>
                    <div class="row g-3" style="margin-left: 15px; font-weight: bold; height: 100px; border-radius: 20px;">
                        <label for="txtImagenurl" class="form-label"><strong>Url imagen</strong></label>
                        <asp:TextBox runat="server" type="text" ID="txtImagenurl" CssClass="from-control" Style="width: 80%; border-color: aqua;"
                            AutoPostBack="true" OnTextChanged="txtImagenurl_TextChanged" />
                        <asp:Button Text="Agregar imagenes" runat="server" type="submit" Style="width: 80%" class="btn btn-info" ID="Btn_addimg" OnClick="Btn_addimg_Click" />
                    </div>
                    <br />
                    <br />
                    <center>
                        <div id="carouselExample" class="carousel carousel-dark slide" style="height: 300px; width: 300px;">
                            <div class="carousel-inner">
                                <asp:Repeater ID="rptImages" runat="server">
                                    <ItemTemplate>
                                        <div class="carousel-item active" style="margin-top: 40px;">
                                            <img src='<%# Container.DataItem %>' alt="Imagen" id="imgselec" style="height: 300px; width: 300px;" />
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="btneliminarfoto" CssClass="btn btn-outline-danger" runat="server" OnClick="btneliminarfoto_Click" CommandArgument='<%# Container.DataItem %>' UseSubmitBehavior="false">
                                            Rechazar 
                                        </asp:LinkButton>
                                    </FooterTemplate>

                                </asp:Repeater>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </center>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </div>

    <br />

    <div class="row g-3">
        <div class="input-group mb-3" style="height: 50px; width: 300px; border-color: aqua; margin-left: 25px; font-weight: bold;">
            <label class="input-group-text" style="border-color: aqua; font-weight: bold;" for="inputGroupSelect01">Tipo de Operación:</label>
            <asp:DropDownList runat="server" ID="tipoope" class="form-select" Style="width: 20px; border-color: aqua; font-weight: bold;">
                <asp:ListItem Text="Alquiler" />
                <asp:ListItem Text="Venta" />

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
    <div class="col-5">


        <div class="row g-3">
            <div class="col-md-10" style="margin-left: 25px; font-weight: bold;">
                <label for="inputCity" class="form-label">Descripción:</label>
                <asp:TextBox runat="server" type="text" class="form-control" ID="txtdescripcion" Style="border-color: aqua;" />
            </div>
        </div>
        <br />
        <br />

    </div>
    <div>
        <br />




        <div class="col-12" style="margin-left: 25px;">
            <div class="card border-info" style="width: 90%;">
                <div class="form-check" style="text-align: center;">
                    <label for="inputState" class="form-label"><strong>Opcion de pago:</strong></label>
                    <div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton Text="Hierro" runat="server" GroupName="Pago" ID="checkHierro" Style="font-weight: bold; color: black;" AutoPostBack="true" />
                        </div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton Text="Plata" runat="server" GroupName="Pago" ID="checkPlata" Style="font-weight: bold; color: black;" AutoPostBack="true" />
                        </div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton Text="Oro" runat="server" GroupName="Pago" ID="checkOro" Style="font-weight: bold; color: black;" AutoPostBack="true" />
                        </div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton Text="Diamante" runat="server" GroupName="Pago" ID="ceckDiamante" Style="font-weight: bold; color: black;" AutoPostBack="true" />
                        </div>
                        <div class="form-check form-check-inline">
                            <asp:RadioButton Text="Platino" runat="server" GroupName="Pago" ID="checkPlatino" Style="font-weight: bold; color: black;" AutoPostBack="true" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div style="margin-left: 25px; color: black; padding-top: 30px">
            <center>
                <asp:Button Text="Nuesrtos planes de publicacion" runat="server" type="submit" class="btn btn-info" ID="btnInfo" OnClick="btnInfo_Click" />

            </center>
        </div>


        <div class="col-12" style="margin-left: 25px; color: black; padding-top: 30px">
            <asp:Button Text="Agregar" runat="server" type="submit" class="btn btn-info" ID="btnAgregar" OnClick="btnAgregar_Click" Visible="true" />
            <asp:Button Text="Modificar" runat="server" type="submit" class="btn btn-info" ID="btnModificar" OnClick="btnModificar_Click" Visible="false" />
        </div>
    </div>
    <br />
</asp:Content>
