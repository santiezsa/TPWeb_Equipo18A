<%@ Page Title="Selección de premio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionPremio.aspx.cs" Inherits="TPWeb_equipo_18A.SeleccionPremio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .prize-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .prize-card {
            transition: transform 0.2s ease;
        }

            .prize-card:hover {
                transform: translateY(-5px);
            }

        .carousel-image {
            height: 250px;
            object-fit: contain;
            background-color: #f8f9fa;
            padding: 10px;
        }

        .carousel-control-prev,
        .carousel-control-next {
            background-color: rgba(255,255,255,0.7);
            width: 40px;
            height: 40px;
            top: 50% !important;
            transform: translateY(-50%) !important;
            border-radius: 50%;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(1);
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <!-- Header con gradiente -->
        <div class="prize-gradient text-white rounded-3 p-4 text-center mb-5">
            <h1 class="display-5 fw-bold mb-3">Selecciona tu premio</h1>
            <p class="mb-0 fs-5 opacity-75">Elige entre estos increíbles premios</p>
        </div>

        <div class="row g-4">
            <asp:Repeater ID="repeaterPrizes" runat="server" OnItemCommand="repeaterPrizes_ItemCommand" OnItemDataBound="repeaterPrizes_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm border-0 prize-card">
                            <!-- Carousel de imágenes -->
                            <div id="carouselImages_<%# Eval("Id") %>" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <asp:Repeater ID="repeaterImages" runat="server">
                                        <ItemTemplate>
                                            <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                                <img src='<%# Eval("ImagenUrl") %>' class="d-block w-100 carousel-image" alt="Imagen del premio">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                                <!-- Controles del carousel -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselImages_<%# Eval("Id") %>" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselImages_<%# Eval("Id") %>" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>

                            <!-- Contenido de la card -->
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title fw-bold text-dark"><%# Eval("Nombre") %></h5>
                                <p class="card-text text-muted flex-grow-1"><%# Eval("Descripcion") %></p>
                                <div class="mt-auto pt-3">
                                    <asp:Button ID="btnSelectPrize" runat="server" Text="Seleccionar Premio"
                                        CssClass="btn btn-primary w-100 fw-semibold"
                                        CommandName="SelectPrize"
                                        CommandArgument='<%# Eval("Id") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
