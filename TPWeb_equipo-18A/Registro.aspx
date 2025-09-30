<%@ Page Title="Registrá tus datos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPWeb_equipo_18A.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtDocumento" class="form-label">Documento</label>
                <asp:TextBox runat="server" ID="txtDocumento" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtDocumento_TextChanged" />
                <asp:Label Text="" ID="lblValidacion" runat="server"></asp:Label>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="txtEmail" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">No compartiremos tu e-mail con nadie.</div>
            </div>
            <div class="mb-3">
                <label for="txtDireccion" class="form-label">Dirección</label>
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCiudad" class="form-label">Ciudad</label>
                <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCp" class="form-label">Código postal</label>
                <asp:TextBox runat="server" ID="txtCp" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Button Text="Participar" ID="btnParticipar" CssClass="btn btn-primary" OnClick="btnParticipar_Click" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
