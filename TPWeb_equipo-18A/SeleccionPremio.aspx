<%@ Page Title="Selección de premio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="SeleccionPremio.aspx.cs" Inherits="TPWeb_equipo_18A.SeleccionPremio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .prize-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .prize-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15) !important;
        }
        .carousel-image {
            height: 250px;
            object-fit: contain; 
            width: 100%;
            background-color: #f8f9fa;
            padding: 10px;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .btn-container {
            margin-top: auto;
            padding-top: 15px;
        }
        .carousel-control-prev,
        .carousel-control-next {
            position: absolute;
            z-index: 1;
            background-color: rgba(255,255,255,0.7);
            width: 40px;
            height: 40px;
            top: 50% !important;
            bottom: auto !important;
            transform: translateY(-50%) !important;
            border-radius: 50%;
            border: 1px solid #ddd;
            opacity: 1;
        }

        .carousel-control-prev {
            left: 10px;
        }

        .carousel-control-next {
            right: 10px;
        }

        /* Flechitas en negro */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(1);
            width: 20px;
            height: 20px;
        }

        /* Efecto hover */
        .carousel-control-prev:hover,
        .carousel-control-next:hover {
            background-color: rgba(255,255,255,0.9);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h1 class="text-center mb-4">Selecciona tu premio</h1>
        <div class="row g-4">
            <asp:Repeater ID="repeaterPrizes" runat="server" OnItemCommand="repeaterPrizes_ItemCommand" OnItemDataBound="repeaterPrizes_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm prize-card">
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
                            <div class="card-body">
                                <h5 class="card-title fw-bold"><%# Eval("Nombre") %></h5>
                                <p class="card-text text-muted flex-grow-1"><%# Eval("Descripcion") %></p>
                                <div class="btn-container">
                                    <asp:Button ID="btnSelectPrize" runat="server" Text="Seleccionar Premio"
                                        CssClass="btn btn-primary w-100"
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
