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

        }

        protected void txtDocumento_TextChanged(object sender, EventArgs e)
        {
            ClientesNegocio clienteNegocio = new ClientesNegocio();
            Cliente cliente = new Cliente();

            string dni = txtDocumento.Text.Trim(); // Obtengo dni del lbl
            cliente = clienteNegocio.ObtenerPorDni(dni); //Busco en la db por DNI

            bool existe = cliente != null && cliente.Documento == dni ? true : false;

            if(existe == true)
            {
                txtDocumento.CssClass = "form-control is-valid";
                lblValidacion.Text = "Documento válido";
                lblValidacion.CssClass = "valid-feedback d-block";
                // TODO: autocompletar los campos
            } else
            {
                txtDocumento.CssClass = "form-control is-invalid";
                lblValidacion.Text = "Documento no registrado";
                lblValidacion.CssClass = "invalid-feedback d-block";
            }
        }
    }
}