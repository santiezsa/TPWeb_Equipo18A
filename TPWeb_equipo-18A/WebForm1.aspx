<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TPWeb_equipo_18A.WebForm1" %>

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
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center mt-5">
        <h1 class="display-4 text-success">¡FELICIDADES! 🎇</h1>
        <p class="lead">Estas participando por @@@@@@@@@@.</p> <!--TODO: TRAER EL PREMIO DESDE LA BASE DE DATOS-->
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

            // Detener después de 10 segundos
            setTimeout(() => fireworks.stop(), 5000);
        };
    </script>
</asp:Content>