using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;

namespace negocio
{
    public class VouchersNegocio
    {
        public List<Voucher> listar()
        {
            List<Voucher> lista = new List<Voucher>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT CodigoVoucher, FECHACANJE, IDCLIENTE, IDARTICULO FROM Vouchers");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Voucher voucher = new Voucher();
                    voucher.CodigoVoucher = (string)datos.Lector["CodigoVoucher"];
                    if (!(datos.Lector["FechaCanje"] is DBNull))
                        voucher.FechaCanje = (DateTime)datos.Lector["FechaCanje"];
                    if (!(datos.Lector["IdCliente"] is DBNull))
                        voucher.IdCliente = (int)datos.Lector["IdCliente"];
                    else voucher.IdCliente = 0;

                    if (!(datos.Lector["IdArticulo"] is DBNull))
                        voucher.IdArticulo = (int)datos.Lector["IdArticulo"];
                    else voucher.IdArticulo = 0;

                    lista.Add(voucher);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public Voucher obtenerVoucher(string codigoVoucher)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT CodigoVoucher, FechaCanje, IdCliente, IdArticulo FROM Vouchers WHERE CodigoVoucher = @codigo");
                datos.setearParametro("@codigo", codigoVoucher);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    Voucher voucher = new Voucher();
                    voucher.CodigoVoucher = (string)datos.Lector["CodigoVoucher"];

                    if (!(datos.Lector["FechaCanje"] is DBNull))
                    {
                        voucher.FechaCanje = (DateTime)datos.Lector["FechaCanje"];
                    }
                    if (!(datos.Lector["IdCliente"] is DBNull))
                    {
                        voucher.IdCliente = (int)datos.Lector["IdCliente"];
                    }
                    if (!(datos.Lector["IdArticulo"] is DBNull))
                    {
                        voucher.IdArticulo = (int)datos.Lector["IdArticulo"];
                    }
                    return voucher;
                }
                return null; // Cuando no encuentre el voucher
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool validarVoucher(string codigoVoucher)
        {
            Voucher voucher = obtenerVoucher(codigoVoucher);
            if (voucher == null)
            {
                return false;
            }
            else if (voucher.IdCliente != 0 || voucher.IdArticulo != 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public void canjearVoucher(string codigoVoucher, DateTime fechaCanje, int idCliente, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Vouchers SET FechaCanje = @FechaCanje, IdCliente = @IdCliente, IdArticulo = @IdArticulo WHERE CodigoVoucher = @CodigoVoucher");
                datos.setearParametro("@fechaCanje", fechaCanje);
                datos.setearParametro("@idCliente", idCliente);
                datos.setearParametro("idArticulo", idArticulo);
                datos.setearParametro("@codigoVoucher", codigoVoucher);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
