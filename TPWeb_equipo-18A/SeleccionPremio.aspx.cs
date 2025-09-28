using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace TPWeb_equipo_18A
{
    public partial class SeleccionPremio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["voucherCodigo"] == null)
                {
                    // Si no viene de IngresarVoucher, lo redirijo
                    Response.Redirect("IngresarVoucher.aspx", false);
                    return;
                }

                // Cargo los premios
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                List<Articulo> listaArticulos = articuloNegocio.listar();

                // Imagenes de cada articulo -> bindeo al repeater
                foreach(var articulo in listaArticulos)
                {
                    articulo.Imagenes = articuloNegocio.listarImagenesPorArticulo(articulo.Id);
                }

                repeaterPrizes.DataSource = listaArticulos;
                repeaterPrizes.DataBind();
            }
        }

        protected void repeaterPrizes_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Bindeo el repeater de imagenes para cada articulo
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Articulo articulo = (Articulo)e.Item.DataItem;
                Repeater repeaterImages = (Repeater)e.Item.FindControl("repeaterImages");
                if (repeaterImages != null)
                {
                    repeaterImages.DataSource = articulo.Imagenes;
                    repeaterImages.DataBind();
                }
            }

        }

        protected void repeaterPrizes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectPrize") // comando del boton en el aspx
            {
                // ID del art
                int idArticulo = Convert.ToInt32(e.CommandArgument);

                // Guardo el ID del art en la sesion
                Session["idArticulo"] = idArticulo;

                // Redirect a pagina de registro
                //Response.Redirect("Registro.aspx", false);
            }
        }

    }
}