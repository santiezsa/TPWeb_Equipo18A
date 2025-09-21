using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ArticuloNegocio
    {

        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // datos.setearConsulta("SELECT A.Id, Codigo, Nombre, A.Descripcion, Precio, M.Id AS IdMarca, M.Descripcion AS Marca, C.Id AS IdCategoria, C.Descripcion AS Categoria FROM ARTICULOS A, MARCAS M, CATEGORIAS C WHERE A.IdMarca = M.Id AND C.Id = A.IdCategoria");
                
                // Misma consulta usando inner join
                //datos.setearConsulta("SELECT A.Id, A.Codigo, A.Nombre,A.Descripcion,A.Precio,M.Id AS IdMarca,M.Descripcion AS Marca,C.Id AS IdCategoria,C.Descripcion AS Categoria FROM ARTICULOS A INNER JOIN MARCAS M ON A.IdMarca = M.Id INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id");
                
                // Probando con subquery tomando una sola img de un articulo
                datos.setearConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.Precio, M.Id AS IdMarca, M.Descripcion AS Marca, C.Id AS IdCategoria, C.Descripcion AS Categoria, (SELECT TOP 1 I.ImagenUrl FROM IMAGENES I WHERE I.IdArticulo = A.Id ORDER BY I.Id ASC) AS Imagen FROM ARTICULOS A INNER JOIN MARCAS M ON A.IdMarca = M.Id INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id");
                
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    // Datos basicos
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    // Datos de marca
                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"]; // traigo ID de marca para modificar/eliminar
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    // Datos de categoria
                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"]; // traigo ID de categoria para modificar/eliminar
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    // Imagenes
                    aux.Imagenes = this.listarImagenes(aux.Id);

                    lista.Add(aux);

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

        public List<Imagen> listarImagenes(int idArticulo)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ImagenUrl FROM IMAGENES WHERE IdArticulo = @IdArticulo");
                datos.setearParametro("@IdArticulo", idArticulo);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    // VALIDACION NULL
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                    {
                        aux.Url = (string)datos.Lector["ImagenUrl"];
                        lista.Add(aux);
                    }
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

        // INSERT DE DATOS SIMPLES Y CON CATEGORIAS Y MARCAS
        public void agregar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio) VALUES (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio); SELECT SCOPE_IDENTITY()");
                datos.setearParametro("@Codigo", articulo.Codigo);
                datos.setearParametro("@Nombre", articulo.Nombre);
                datos.setearParametro("@Descripcion", articulo.Descripcion);
                datos.setearParametro("@IdMarca", articulo.Marca.Id);
                datos.setearParametro("@IdCategoria", articulo.Categoria.Id);
                datos.setearParametro("@Precio", articulo.Precio);

                int nuevoIdArticulo = Convert.ToInt32(datos.ejecutarLecturaScalar());

                // Insertar las imagenes asociadas al articulo
                foreach (var imagen in articulo.Imagenes)
                {
                    datos.setearConsulta("INSERT INTO IMAGENES (IdArticulo, ImagenUrl) VALUES (@IdArticulo, @ImagenUrl)");
                    datos.setearParametro("@IdArticulo", nuevoIdArticulo);
                    datos.setearParametro("@ImagenUrl", imagen.Url);
                    datos.ejecutarAccion();
                }
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

        public void modificar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Actualizar los datos del articulo principal
                datos.setearConsulta("UPDATE ARTICULOS SET Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMarca = @IdMarca, IdCategoria = @IdCategoria, Precio = @Precio WHERE Id = @Id");
                datos.setearParametro("@Codigo", articulo.Codigo);
                datos.setearParametro("@Nombre", articulo.Nombre);
                datos.setearParametro("@Descripcion", articulo.Descripcion);
                datos.setearParametro("@IdMarca", articulo.Marca.Id);
                datos.setearParametro("@IdCategoria", articulo.Categoria.Id);
                datos.setearParametro("@Precio", articulo.Precio);
                datos.setearParametro("@Id", articulo.Id);
                datos.ejecutarAccion();
                datos.cerrarConexion();

                // Actualizar nuevas imagenes
                if (articulo.Imagenes.Count > 0)
                {
                    AccesoDatos datosImagen = new AccesoDatos();
                    datosImagen.setearConsulta("UPDATE IMAGENES SET ImagenUrl = @ImagenUrl WHERE IdArticulo = @IdArticulo");
                    datosImagen.setearParametro("@ImagenUrl", articulo.Imagenes[0].Url);
                    datosImagen.setearParametro("@IdArticulo", articulo.Id);
                    datosImagen.ejecutarAccion();
                    datosImagen.cerrarConexion();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                // Elimino imagenes asociadas al articulo
                datos.setearConsulta("DELETE FROM Imagenes WHERE IDArticulo = @IDArticulo");
                datos.setearParametro("@IDArticulo", id);
                datos.ejecutarAccion();

                // Elimino articulo               
                datos.setearConsulta("delete from ARTICULOS where id = @id");
                datos.setearParametro("@id", id);
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

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos(); 
            try
            {
                string consulta = "SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.Precio, M.Id AS IdMarca, M.Descripcion AS Marca, C.Id AS IdCategoria, C.Descripcion AS Categoria, (SELECT TOP 1 I.ImagenUrl FROM IMAGENES I WHERE I.IdArticulo = A.Id ORDER BY I.Id ASC) AS Imagen FROM ARTICULOS A INNER JOIN MARCAS M ON A.IdMarca = M.Id INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id WHERE ";

                switch (campo)
                {
                    case "Código":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "A.Codigo LIKE '" + filtro + "%'";
                                break;
                            case "Termina con":
                                consulta += "A.Codigo LIKE '%" + filtro + "'";
                                break;
                            case "Contiene":
                                consulta += "A.Codigo LIKE '%" + filtro + "%'";
                                break;
                        }
                        break;
                    case "Nombre":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "A.Nombre LIKE '" + filtro + "%'";
                                break;
                            case "Termina con":
                                consulta += "A.Nombre LIKE '%" + filtro + "'";
                                break;
                            case "Contiene":
                                consulta += "A.Nombre LIKE '%" + filtro + "%'";
                                break;
                        }
                        break;
                    case "Descripción":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "A.Descripcion LIKE '" + filtro + "%'";
                                break;
                            case "Termina con":
                                consulta += "A.Descripcion LIKE '%" + filtro + "'";
                                break;
                            case "Contiene":
                                consulta += "A.Descripcion LIKE '%" + filtro + "%'";
                                break;
                        }
                        break;
                    case "Marca":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "M.Descripcion LIKE '" + filtro + "%'";
                                break;
                            case "Termina con":
                                consulta += "M.Descripcion LIKE '%" + filtro + "'";
                                break;
                            case "Contiene":
                                consulta += "M.Descripcion LIKE '%" + filtro + "%'";
                                break;
                        }
                        break;
                    case "Categoría":
                        switch (criterio)
                        {
                            case "Comienza con":
                                consulta += "C.Descripcion LIKE '" + filtro + "%'";
                                break;
                            case "Termina con":
                                consulta += "C.Descripcion LIKE '%" + filtro + "'";
                                break;
                            case "Contiene":
                                consulta += "C.Descripcion LIKE '%" + filtro + "%'";
                                break;
                        }
                        break;
                    case "Precio":
                        switch (criterio)
                        {
                            case "Mayor a":
                                consulta += "A.Precio > " + filtro;
                                break;
                            case "Menor a":
                                consulta += "A.Precio < " + filtro;
                                break;
                            case "Igual a":
                                consulta += "A.Precio = " + filtro;
                                break;
                        }
                        break;
                }
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"]; // traigo ID de marca para modificar/eliminar
                    aux.Marca.Descripcion = (string)datos.Lector["Marca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"]; // traigo ID de categoria para modificar/eliminar
                    aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Imagenes = this.listarImagenes(aux.Id);
                    lista.Add(aux);
                }
                return lista;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
