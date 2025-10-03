<%@ Page Title="Registrá tus datos" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPWeb_equipo_18A.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .prize-gradient {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <!-- Header con gradiente -->
        <div class="prize-gradient text-white rounded-3 p-4 text-center mb-5">
            <h1 class="display-5 fw-bold mb-3">Carga tus datos</h1>
        </div>
        <div class="col-6">
            <!-- Documento -->
            <div class="mb-3">
                <label for="txtDocumento" class="form-label">Documento</label>
                <asp:TextBox runat="server" ID="txtDocumento" AutoPostBack="true" CssClass="form-control form-control-lg" OnTextChanged="txtDocumento_TextChanged" />
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server"
                    ControlToValidate="txtDocumento"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El documento es obligatorio"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revDocumento" runat="server"
                    ControlToValidate="txtDocumento"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El documento debe contener solo numeros"
                    ValidationExpression="^\d+$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
                <asp:Label Text="" ID="lblValidacion" runat="server"></asp:Label>
            </div>

            <!-- Nombre -->
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control form-control-lg" />
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                    ControlToValidate="txtNombre"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El nombre es obligatorio"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revNombre" runat="server"
                    ControlToValidate="txtNombre"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El nombre solo puede contener letras y espacios"
                    ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>

            <!-- Apellido -->
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control form-control-lg" />
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server"
                    ControlToValidate="txtApellido"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El apellido es obligatorio"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revApellido" runat="server"
                    ControlToValidate="txtApellido"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El apellido solo puede contener letras y espacios"
                    ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>


            <!--Email -->
            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control form-control-lg" TextMode="Email" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El email es obligatorio"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="Formato de email inválido"
                    ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
                <div id="emailHelp" class="form-text">No compartiremos tu e-mail con nadie.</div>
            </div>

            <!-- Direccion -->
            <div class="mb-3">
                <label for="txtDireccion" class="form-label">Dirección</label>
                <asp:TextBox runat="server" ID="txtDireccion" CssClass="form-control form-control-lg" />
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server"
                    ControlToValidate="txtDireccion"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="La dirección es obligatoria"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Ciudad -->
            <div class="mb-3">
                <label for="txtCiudad" class="form-label">Ciudad</label>
                <asp:TextBox runat="server" ID="txtCiudad" CssClass="form-control form-control-lg" />
                <asp:RequiredFieldValidator ID="rfvCiudad" runat="server"
                    ControlToValidate="txtCiudad"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="La ciudad es obligatoria"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCiudad" runat="server"
                    ControlToValidate="txtCiudad"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="La ciudad solo puede contener letras y espacios"
                    ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>

            <!-- Codigo postal -->
            <div class="mb-3">
                <label for="txtCp" class="form-label">Código postal</label>
                <asp:TextBox runat="server" ID="txtCp" CssClass="form-control form-control-lg" />
                <asp:RequiredFieldValidator ID="rfvCp" runat="server"
                    ControlToValidate="txtCp"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El código postal es obligatorio"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCp" runat="server"
                    ControlToValidate="txtCp"
                    CssClass="text-danger small mt-1"
                    ErrorMessage="El código postal debe contener solo números"
                    ValidationExpression="^\d+$"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>

            <div class="mb-3">
                <asp:Button Text="Participar" ID="btnParticipar" CssClass="btn btn-primary" OnClick="btnParticipar_Click" runat="server" />
            </div>
            <div class="text-center mt-4">
                <a href="Default.aspx" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-2"></i>
                    Volver al inicio
                </a>
            </div>
        </div>
    </div>
</asp:Content>
