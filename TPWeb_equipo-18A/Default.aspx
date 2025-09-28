<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_equipo_18A.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero-section">
        <div class="container">
            <h1>¡Bienvenido!</h1>
            <p>Participa en nuestro sorteo y gana premios increíbles.</p>
            <a class="btn-hero" href="IngresarVoucher.aspx">Participar</a>
        </div>
    </div>

    <div class="features-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">🎫</div>
                        <h3>Voucher de compra</h3>
                        <p>Podes obtener tu voucher con cada compra realizada en nuestro establecimiento.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">🎁</div>
                        <h3>Premios increíbles</h3>
                        <p>Selecciona entre una gran variedad de premios.</p>
                    </div>
                </div>
                <div class ="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">🏆</div>
                        <h3>Fácil de participar</h3>
                        <p>Registrate fácilmente y participá en el sorteo de grandiosos premios</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
