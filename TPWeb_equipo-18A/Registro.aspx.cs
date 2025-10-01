using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPWeb_equipo_18A
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            ClientesNegocio clienteNegocio = new ClientesNegocio();
            Cliente cliente = new Cliente();
          
            string dni = txtDocumento.Text.Trim();
            Cliente existente = clienteNegocio.ObtenerPorDni(dni);

            // Armo el objeto Cliente con lo que hay en los textbox
            //cliente.ID = int.Parse(txtId.Text);  ------------------------- TODO: Pensar si hace falta tener en cuenta el ID o no ya que lo genera la DB
            cliente.Documento = txtDocumento.Text.Trim();
            cliente.Nombre = txtNombre.Text.Trim();
            cliente.Apellido = txtApellido.Text.Trim();
            cliente.Email = txtEmail.Text.Trim();
            cliente.Direccion = txtDireccion.Text.Trim();
            cliente.Ciudad = txtCiudad.Text.Trim();
            //cliente.CP = int.Parse(txtCp.Text); ---------------------------- TODO: Verificar porque se esta rompiendo 

            if (existente != null)
            {
                clienteNegocio.actualizar(cliente);
                LimpiarCampos(mantenerDni: false);
            }
            else
            {
                clienteNegocio.agregar(cliente);
                LimpiarCampos(mantenerDni: false);
            }
        }

        protected void txtDocumento_TextChanged(object sender, EventArgs e)
        {
            ClientesNegocio clienteNegocio = new ClientesNegocio();
            Cliente cliente = new Cliente();

            string dni = txtDocumento.Text.Trim(); // Obtengo dni del lbl
            cliente = clienteNegocio.ObtenerPorDni(dni); //Busco en la db por DNI

            bool existe = cliente != null && cliente.Documento == dni ? true : false;

            if (existe == true)
            {
                txtDocumento.CssClass = "form-control is-valid";
                lblValidacion.Text = "Documento existente.";
                lblValidacion.CssClass = "valid-feedback d-block";

                // Autocompleto campos 
                txtId.Text = cliente.ID.ToString();
                txtNombre.Text = cliente.Nombre;
                txtApellido.Text = cliente.Apellido;
                txtEmail.Text = cliente.Email;
                txtDireccion.Text = cliente.Direccion;
                txtCiudad.Text = cliente.Ciudad;
                txtCp.Text = cliente.CP.ToString();
            }
            else
            {
                txtDocumento.CssClass = "form-control is-valid";
                lblValidacion.Text = "Nuevo documento, completá los datos para dar de alta.";
                lblValidacion.CssClass = "valid-feedback d-block";

                LimpiarCampos(mantenerDni: true);
            }
        }

        private void LimpiarCampos(bool mantenerDni)
        {
            if (!mantenerDni) txtDocumento.Text = "";

            txtId.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtDireccion.Text = "";
            txtCiudad.Text = "";
            txtCp.Text = "";
        }
    }
}