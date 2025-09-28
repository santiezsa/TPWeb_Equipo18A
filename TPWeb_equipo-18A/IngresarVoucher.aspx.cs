using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPWeb_equipo_18A
{
    public partial class IngresarVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            // Si hay errores de validacion no ejecuto el codigo
            if(!Page.IsValid)
            {
                return;
            }

            VouchersNegocio vouchersNegocio = new VouchersNegocio();
            string codigo = txtCodigo.Text.Trim();
            bool disponible = vouchersNegocio.validarVoucher(codigo);
            if(disponible)
            {
                // Lo paso por Session
                Session["voucherCodigo"] = codigo;
                // Pagina de seleccion de premio
                Response.Redirect("SeleccionPremio.aspx", false);
            }
            else
            {
                ltlError.Text = "<div class='alert alert-danger'>El código es inválido o ya fue utilizado.</div>";
            }


        }
    }
}