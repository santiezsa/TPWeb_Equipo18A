<%@ Page Title="Ingresar voucher" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="IngresarVoucher.aspx.cs" Inherits="TPWeb_equipo_18A.IngresarVoucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title mb-3">Ingresa tu código de voucher</h3>
                        <asp:Literal ID="ltlError" runat="server"></asp:Literal>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
                        <div class="mb-3">
                            <label for="txtCodigo" class="form-label">Código alfanumérico</label>
                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" MaxLength="50"> </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo" CssClass="text-danger" ErrorMessage="El codigo es obligatorio"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnValidar" runat="server" Text="Validar codigo" CssClass="btn btn-primary" OnClick="btnValidar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
