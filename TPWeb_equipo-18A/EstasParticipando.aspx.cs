using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_equipo_18A
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idArticulo"] == null)
                {
                    Response.Redirect("SeleccionPremio.aspx", false);
                    return;
                }

                int idArticulo = (int)Session["idArticulo"];
                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo premioSeleccionado = negocio.listar().Find(a => a.Id == idArticulo);

                if (premioSeleccionado != null)
                {
                    lblPremio.Text = premioSeleccionado.Nombre;
                }
                else
                {
                    lblPremio.Text = "Premio no encontrado";
                }
            }
        }
    }
}