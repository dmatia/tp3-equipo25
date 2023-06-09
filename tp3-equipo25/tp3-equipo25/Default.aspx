﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp3_equipo25.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%----%>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <%--Panel superior--%>
    <div class="row">
        <div class="col-3">
            <%--Switch Busqueda avanzada--%>
            <asp:LinkButton ID="BtnBusquedaAvanzada" runat="server" style="display: flex; justify-content: center; align-items: center; height: 101%; width: 99%; position: relative; z-index: 1; margin-bottom: 20px;" Cssclass="btn btn-outline-primary" AutoPostback="true" OnClick="BtnBusquedaAvanzada_Click"><i class="fa-solid fa-sliders"></i>&nbsp;Búsqueda Avanzada</asp:LinkButton>

        </div>
        <div class="col-5">
            <%--Input Busqueda Rapida--%>
            <asp:TextBox ID="TxtBusquedaRapida" type="text" CssClass="form-control form-control-lg" placeholder="Ingresa lo que estas buscando" runat="server" OnTextChanged="TxtBusquedaRapida_TextChanged" AutoPostBack="true" style="height: 101%; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:TextBox>

        </div>
        <div class="col-1">
            <%--Boton Busqueda Rapida--%>
            <asp:LinkButton ID="BtnBusquedaRapida" CssClass="btn btn-primary btm-lg" runat="server" OnClick="BtnBusquedaRapida_Click" style="display: flex; justify-content: center; align-items: center; height: 101%"><i class="fa-solid fa-magnifying-glass"></i></asp:LinkButton>

        </div>

        <div class="col-3" style="justify-content: stretch">
            <%--Dropdown ordenamiento --%>
            <asp:DropDownList ID="DDLOrdenar" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDLOrdenar_SelectedIndexChanged" style="width: 101%; height: 100%; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:DropDownList>

        </div>

        <%--Panel Lateral de busqueda Avanzada--%>

        <% if (CheckbusquedaAvanzada())
            { %>

        <div class="row">
            <div class="col-lg-3" style="display: flex;">
                <div class="d-flex flex-column">
                      <div style="background-color: #c2d6df; border-radius: 10px; padding: 20px; margin-top: 22px;">
                        <div class="row" style="margin-bottom: 10px;">
                             <div class="col">
                                      <%--Input Busqueda Avanzada --%>
                                <asp:TextBox CssClass="form-control TxtBusqueda" ID="TxtBusqueda" placeholder="Ingresa tu busqueda..." style="height: 101%; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);" runat="server"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-8" style="display: flex; justify-content: flex-start; align-items: center; padding: 0px;">
                                      <%--CheckBox Descripcion --%>
                                <asp:CheckBox ID="ChkCheckDescripcion" CssClass="form-check" Text=" Incluir descripción" runat="server" />

                            </div>
                            <div class="col-md-4">
                                <%--Boton Descripcion --%>
                                <asp:Button CssClass="form-control btn btn-primary btn-sm" ID="BtnBusqueda" runat="server" Text="Buscar" OnClick="BtnBusqueda_Click" Autopostback="true" />

                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 5px;">
                            <div class="col">
                                <%--Lbl Precios --%>
                                <asp:Label Text="Precios:" runat="server"></asp:Label>

                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-md-6">
                                <%--Input Minimo --%>                                  
                                <asp:Label Text="Minimo" runat="server"></asp:Label>
                                <asp:TextBox CssClass="form-control" type="number" ID="TxtPreciomin" runat="server" Text="Minimo" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <%--Input Maximo --%>
                                <asp:Label Text="Máximo" runat="server"></asp:Label>
                                <asp:TextBox CssClass="form-control" type="number" ID="TxtPreciomax" runat="server" Text="Maximo" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col">
                                <%--DDL Marca --%>
                                <asp:Label Text="Marca:" runat="server"></asp:Label>
                                <asp:DropDownList ID="DdlMarca" CssClass="form-control" runat="server" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <%--DDL Categoria --%>
                                <asp:Label Text="Categoria:" runat="server"></asp:Label>
                                <asp:DropDownList ID="DdlCategoria" CssClass="form-control" runat="server" style="box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <% } %>


            <div class="col-lg-<% if (CheckbusquedaAvanzada())        
                { %>9<% }
                else
                { %>12<% } %> ">    <%--Si el menu de busqueda Avanzada esta activiado ocupa 9 columnas, si no 12--%>
                <div class="row ">
                    <%--Repeater--%>
                    <asp:Repeater ID="RepCards" runat="server">
                        <itemtemplate>
                            <div class="col mt-4 d-flex" style="justify-content: flex-start; ">
                                <%--Card--%>
                                <div class="card" style="width: 18rem; height: 100%; padding: 10px;">
                                              <%--Imagen centrada--%>
                                       <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                                        <img src='<%#Eval("Imagenes[0].UrlImagen")%>' cssclass="card-img-top img-fluid content-object-cover" style="border-radius: 10px; width: 200px;" alt="imagen" onerror="this.src='https://www.freeiconspng.com/uploads/no-image-icon-23.jpg'">
                                      </div>
                                    <div class="card-body"> <%--Nombre y Preco--%>
                                        <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                        <h5 class="card-title"><%# String.Format(new System.Globalization.CultureInfo("es-AR"), "{0:C}", Eval("Precio")) %></h5>
                                         <%--Descripcion Opcional--%>
                                        <% if (ChkCheckDescripcion.Checked)
                                            { %>
                                        <p class="card-text">Descripción: <%#Eval("Descripcion")%></p>
                                        <% } %>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-grid gap-2"><%--Boton Detalle con Command Argument--%>
                                            <asp:Button Text="Ver Detalle" runat="server" Cssclass="btn btn-primary btm-lg" ID="BtnDetalle" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId" OnClick="BtnDetalle_Click" />
                                        </div>
                                    </div>
                                </div>                        
                           </div>
                        </itemtemplate>
                    </asp:Repeater>
                  </div>

            </div>
            <% if (CheckbusquedaAvanzada())
                { %>
        </div>

        <%}%>
</asp:Content>
