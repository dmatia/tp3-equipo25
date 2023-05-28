﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp3_equipo25.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%--Main--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

<header>
    <div class="row">
        <div class="col-md-3">
            <div class="form-check form-switch">
                <div class="row">
                    <div class="col-9 align-self-center">
                        <label class="form-check-label" for="ChkBusquedaAvanzada">Búsqueda Avanzada</label>
                    </div>
                    <div class="col-3">
                        <asp:CheckBox ID="ChkBusquedaAvanzada" runat="server" AutoPostBack="true" role="switch" />
                    </div>
                </div>
            </div>
        </div>
        <% if (!ChkBusquedaAvanzada.Checked) { %>
        <div class="col-md-6">
            <div class="row">
                <div class="col-12">
                    <asp:Textbox ID="TxtBusquedaRapida" type="text" class="form-control" placeholder="Ingresa una búsqueda rápida" runat="server"/>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</header>



<div class="row">
    <% if (ChkBusquedaAvanzada.Checked)
        { %>
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="d-flex flex-column">
            <div class="d-inline-flex align-items-center">
                <asp:Label Text="Búsqueda" runat="server"></asp:Label>
            </div>
            <div class="row">
                <div class="col">
                    <asp:TextBox CssClass="form-control TxtBusqueda" ID="TxtBusqueda" runat="server"></asp:TextBox>
                </div>
                <div class="col-4">
                    <asp:Button CssClass="form-control btn btn-secondary btn-sm" ID="BtnBusqueda" runat="server" Text="Buscar" OnClick="BtnBusqueda_Click" Autopostback="false" />
                    <asp:CheckBox ID="ChkCheckDescripcion" CssClass="form-check" Text="Incluir descripción" runat="server" />
                </div>
                <div class="d-inline-flex align-items-center">
                    <asp:Label Text="Precio" runat="server"></asp:Label>
                </div>
                <div class="row">
                    <div class="col-6">
                        <asp:Label Text="Mínimo:" runat="server"></asp:Label>
                        <asp:TextBox CssClass="form-control" type="number" ID="TxtPreciomin" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-6">
                        <asp:Label Text="Máximo" runat="server"></asp:Label>
                        <asp:TextBox CssClass="form-control" type="number" ID="TxtPreciomax" runat="server" OnTextChanged="TxtPreciomax_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <asp:DropDownList ID="DdlMarca" CssClass="form-control" runat="server"></asp:DropDownList>
                <asp:DropDownList ID="DdlCategoria" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
    </div>
    <% } %>

    <div class="col-lg-<% if (ChkBusquedaAvanzada.Checked)
        { %>9<% }
        else
        { %>12<% } %> col-md-6 col-sm-12">
        <div class="row row-cols-1 row-cols-md-<% if (ChkBusquedaAvanzada.Checked)
            { %>3<% }
            else
            { %>4<% } %>">
            <%--Repeater--%>
            <asp:Repeater ID="RepCards" runat="server">
                <ItemTemplate>
                    <div class="col-6 mt-4">
                        <%--Card--%>
                        <div class="card" style="width: 18rem;">
                            <img src="<%#Eval("Imagenes[0].UrlImagen")%>" cssclass="card-img-top img-fluid" style="max-height: 130px" alt="imagen" onerror="this.src='https://www.freeiconspng.com/uploads/no-image-icon-23.jpg'">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                <h5 class="card-title">$<%#Eval("Precio")%></h5>
                                <% if (ChkCheckDescripcion.Checked)
                                    { %>
                                <p class="card-text">Descripción: <%#Eval("Descripcion")%></p>
                                <% } %>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2">
                                    <asp:Button Text="Ver Detalle" runat="server" class="btndetalle" ID="BtnDetalle" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId" OnClick="BtnDetalle_Click" />
                                </div>
                            </div>
                        </div>
                        <%--Card--%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <%--Repeater--%>
        </div>
    </div>
</div>

</asp:Content>
<%--Fin Main--%>