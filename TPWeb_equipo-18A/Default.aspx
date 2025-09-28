<%@ Page Title="Web de promos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_equipo_18A.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Animate.css para las animaciones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>

        .bg-gradient-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
        }

        .min-vh-50 {
            min-height: 50vh;
        }

        .hover-shadow {
            transition: all 0.3s ease;
        }

        .hover-shadow:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important;
        }

        .step-number {
            font-weight: bold;
            margin: 0 auto;
        }

        .hero-image {
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .feature-card {
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Hero Section con Gradiente -->
    <section class="hero-section bg-gradient-primary text-white py-5">
        <div class="container py-5">
            <div class="row align-items-center min-vh-50">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4 animate__animated animate__fadeInUp">
                        ¡Tu Oportunidad de Ganar!
                    </h1>
                    <p class="lead mb-4 animate__animated animate__fadeInUp animate__delay-1s">
                        Cada compra es una nueva oportunidad para ganar premios increíbles. 
                        ¡No te quedes fuera del sorteo!
                    </p>
                    <div class="animate__animated animate__fadeInUp animate__delay-2s">
                        <asp:HyperLink ID="hlParticipar" runat="server" 
                            CssClass="btn btn-light btn-lg px-5 py-3 fw-bold shadow" 
                            NavigateUrl="~/IngresarVoucher.aspx">
                            🎯 Participar Ahora
                        </asp:HyperLink>
                    </div>
                </div>
                <div class="col-lg-6 text-center">
                    <div class="hero-image animate__animated animate__zoomIn">
                        <div class="display-1" style="font-size: 8rem;">🎁</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section py-5 bg-light">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-12">
                    <h2 class="fw-bold text-dark mb-3">¿Cómo Funciona?</h2>
                    <p class="text-muted fs-5">Participar es muy sencillo</p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card border-0 shadow-sm h-100 hover-shadow">
                        <div class="card-body text-center p-4">
                            <div class="step-number bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                                 style="width: 60px; height: 60px; font-size: 1.5rem;">
                                1
                            </div>
                            <div class="feature-icon display-4 text-primary mb-3">🛒</div>
                            <h3 class="card-title h5 fw-bold mb-3">Realizá tu Compra</h3>
                            <p class="card-text text-muted">
                                Comprá en nuestro establecimiento y recibí tu voucher de participación.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card border-0 shadow-sm h-100 hover-shadow">
                        <div class="card-body text-center p-4">
                            <div class="step-number bg-success text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                                 style="width: 60px; height: 60px; font-size: 1.5rem;">
                                2
                            </div>
                            <div class="feature-icon display-4 text-success mb-3">📱</div>
                            <h3 class="card-title h5 fw-bold mb-3">Registrá tu Voucher</h3>
                            <p class="card-text text-muted">
                                Ingresá el código de tu voucher en nuestra plataforma online.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card border-0 shadow-sm h-100 hover-shadow">
                        <div class="card-body text-center p-4">
                            <div class="step-number bg-warning text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" 
                                 style="width: 60px; height: 60px; font-size: 1.5rem;">
                                3
                            </div>
                            <div class="feature-icon display-4 text-warning mb-3">🎯</div>
                            <h3 class="card-title h5 fw-bold mb-3">¡Ganá Premios!</h3>
                            <p class="card-text text-muted">
                                Participá del sorteo y ganá increíbles premios cada mes.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
