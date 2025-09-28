<%@ Page Title="Selección de premio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionPremio.aspx.cs" Inherits="TPWeb_equipo_18A.SeleccionPremio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h1 class="text-center mb-4">Selecciona tu premio</h1>
        <div class="row">
            <asp:Repeater ID="repeaterPrizes" runat="server" OnItemCommand="repeaterPrizes_ItemCommand" OnItemDataBound="repeaterPrizes_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="prize-card">
                            <div id="carouselImages_<%# Eval("Id") %>" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <asp:Repeater ID="repeaterImages" runat="server">
                                        <ItemTemplate>
                                            <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                                <img src='<%# Eval("ImagenUrl") %>' class="d-block w-100" alt="Prize Image">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselImages_<%# Eval("Id") %>" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselImages_<%# Eval("Id") %>" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                            <h3 class="mt-3"><%# Eval("Nombre") %></h3>
                            <p><%# Eval("Descripcion") %></p>
                            <asp:Button ID="btnSelectPrize" runat="server" Text="Seleccionar" CssClass="btn btn-primary" CommandName="SelectPrize" CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
