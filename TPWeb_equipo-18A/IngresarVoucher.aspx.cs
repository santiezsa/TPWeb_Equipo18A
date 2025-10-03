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
                Session["voucherCodigo"] = codigo;
                Response.Redirect("SeleccionPremio.aspx", false);
            }
            else
            {
                cvVoucherInvalido.IsValid = false;
            }
        }

        protected void cvVoucherInvalido_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;
        }
    }
}