﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CarritoWeb.aspx.cs" Inherits="tp3_equipo25.CarritoWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <% if (ListaCarrito != null)
        {%>
    <div class="container-sm">
        <h2>Tu carrito:</h2>
        <div class="row">
            <div class="col-6">
                <asp:GridView ID="dgvCarrito" runat="server" CssClass="table mb-3" DataKeyNames=""
                    AutoGenerateColumns="true" OnSelectedIndexChanged="dgvCarrito_SelectedIndexChanged"
                    OnPageIndexChanging="dgvCarrito_PageIndexChanging" AllowPaging="true" PageSize="3">
                    <Columns>

                        <%--Imagen en columna--%>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Articulo.Imagenes[0].UrlImagen")%>' Style="height: 100px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- <asp:BoundField HeaderText="" DataField="Articulo.Imagenes[0].UrlImagen"/>--%>
                        <asp:BoundField DataField="Articulo.Nombre" />
             <%--           <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />--%>

                        <%--CONTROLES--%>
                        <asp:TemplateField HeaderText="Agregar/Quitar">
                            <ItemTemplate>
                                <asp:Button ID="btnAgregar" runat="server" Text="+" OnClick="btnAgregar_Click" />
                                <asp:Button ID="btnQuitar" runat="server" Text="-" OnClick="btnQuitar_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- PRECIO /// VER CONFIGURACION carrito.cantidad * articulo.precio--%>
                        <asp:BoundField HeaderText="Total" DataField="Articulo.Precio" />

                   
                        

                    </Columns>
                   
                </asp:GridView>

                <asp:GridView OnPreRender="grd_Pre" CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" ></asp:GridView>

            </div>

            <asp:ScriptManager ID="ScripManager1" runat="server"></asp:ScriptManager>

            <div class="col-6">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%#Eval("ListaCarrito.Articulo.Imagenes[0].UrlImagen")%>' Style="width: 100%" />
                    </ContentTemplate>


                </asp:UpdatePanel>
            </div>




        </div>

        <a class="btn btn-primary"></a>
        <a class="btn btn-primary">CHECK OUT</a>

    </div>


    <%}
        else
        {%>

    <div class="sinCarrito">
        <a class="sinCarritoTitulo">Tu carrito está vacio... </a>
        <div>
            <a href="Default.aspx" class="sinCarritoBoton">ver catalogo</a>
        </div>
    </div>

    <%}%>
</asp:Content>
