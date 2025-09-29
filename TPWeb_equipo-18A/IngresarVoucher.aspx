<%@ Page Title="Ingreso de voucher" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="IngresarVoucher.aspx.cs" Inherits="TPWeb_equipo_18A.IngresarVoucher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .voucher-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .card-hover {
            transition: transform 0.2s ease-in-out;
        }

            .card-hover:hover {
                transform: translateY(-3px);
            }

        .btn-glow:hover {
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <!-- Header con gradiente -->
                <div class="voucher-gradient text-white rounded-3 p-4 text-center mb-4">
                    <div class="display-1 mb-3">🎫</div>
                    <h1 class="h2 mb-2">Ingresar Voucher</h1>
                    <p class="mb-0 opacity-75">Ingresa tu código para participar en el sorteo</p>
                </div>

                <!-- Card del formulario -->
                <div class="card shadow-lg border-0 card-hover">
                    <div class="card-body p-4 p-md-5">
                        <div class="mb-4">
                            <label class="form-label fw-bold fs-5">Código del voucher</label>
                            <div class="input-group input-group-lg">
                                <span class="input-group-text bg-light border-end-0">
                                    <i class="bi bi-key text-primary"></i>
                                </span>
                                <asp:TextBox ID="txtCodigo" runat="server"
                                    CssClass="form-control border-start-0"
                                    placeholder="XXXXXXXX"
                                    MaxLength="50">
                                </asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtCodigo"
                                CssClass="text-danger small mt-2"
                                ErrorMessage="El código es obligatorio"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                            <asp:CustomValidator ID="cvVoucherInvalido" runat="server"
                                ControlToValidate="txtCodigo"
                                CssClass="text-danger small mt-2"
                                ErrorMessage="El codigo es invalido o ya fue utilizado"
                                Display="Dynamic"
                                OnServerValidate="cvVoucherInvalido_ServerValidate">
                            </asp:CustomValidator>
                        </div>

                        <asp:Button ID="btnValidar" runat="server"
                            Text="Validar Voucher"
                            CssClass="btn btn-primary btn-lg w-100 py-3 fw-bold btn-glow"
                            OnClick="btnValidar_Click" />
                    </div>
                </div>

                <!-- Enlace volver -->
                <div class="text-center mt-4">
                    <a href="Default.aspx" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-2"></i>
                        Volver al inicio
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
