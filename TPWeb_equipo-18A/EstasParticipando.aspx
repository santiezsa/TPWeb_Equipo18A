<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EstasParticipando.aspx.cs" Inherits="TPWeb_equipo_18A.WebForm1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Fireworks.js -->
    <script src="https://cdn.jsdelivr.net/npm/fireworks-js@latest/dist/fireworks.js"></script>
    <style>
        #fireworks-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
            pointer-events: none;
        }

        .mensaje-celebracion {
            font-family: 'Montserrat', 'Roboto', Arial, sans-serif;
            text-align: center;
            padding: 20px 30px;
            border-radius: 10px;
            background: linear-gradient(90deg, #ffe259 0%, #ffa751 100%);
            box-shadow: 0 2px 8px rgba(40,167,69,0.15);
            color: #28a745;
            text-shadow: 2px 2px 8px #fff, 0 0 10px #28a745;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }

        .mensaje-celebracion h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .mensaje-celebracion p {
            font-size: 1.5rem;
            color: #212529;
            margin: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="mensaje-celebracion">
            <h1>¡FELICIDADES! 🎇</h1>
            <p>Estás participando por <asp:Label ID="lblPremio" runat="server" /></p>
        </div>
    </div>

    <div id="fireworks-container"></div>

    <script>
        window.onload = function () {
            const container = document.getElementById('fireworks-container');
            const fireworks = new Fireworks(container, {
                speed: 3,
                acceleration: 1.05,
                friction: 0.95,
                gravity: 1.5,
                particles: 50,
                trace: 3,
                explosion: 5,
                boundaries: {
                    top: 50,
                    bottom: container.clientHeight,
                    left: 50,
                    right: container.clientWidth
                },
                sound: {
                    enabled: false
                }
            });

            fireworks.start();
            setTimeout(() => fireworks.stop(), 5000);
        };
    </script>
    <div class="text-center mt-4">
    <a href="Default.aspx" class="btn btn-outline-secondary">
        <i class="bi bi-arrow-left me-2"></i>
        Volver al inicio
    </a>
</div>
</asp:Content>
