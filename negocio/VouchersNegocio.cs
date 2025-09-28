using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;

namespace negocio
{
    internal class VouchersNegocio
    {
        public List<Voucher> listar()
        {
            List<Voucher> lista = new List<Voucher>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT CodigoVoucher, FECHACANJE, IDCLIENTE, IDARTICULO FROM Vouchers");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
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
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }


        }

        public string validarVoucher(string codigoVoucher)
        {
            List<Voucher> lista = listar();
            foreach(Voucher voucher in lista)
            {
                if(voucher.CodigoVoucher == codigoVoucher)
                {
                    if(voucher.IdCliente == 0 && voucher.IdArticulo == 0)
                    {
                        return "Codigo de voucher válido.";
                    }
                    else
                    {
                        return "El código de voucher ya fue utilizado.";
                    }
                }
            }
            return "Código de voucher invalido";

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
            catch(Exception ex)
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
