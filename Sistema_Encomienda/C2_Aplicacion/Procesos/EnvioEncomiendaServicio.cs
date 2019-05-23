using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_Dominio.Entidades;
using C3_Dominio.Contratos;
using C4_Persistencia.DAO;
using C4_Persistencia.FabricaDAO;
namespace C2_Aplicacion.Procesos
{
   public  class EnvioEncomiendaServicio
   {
       private IGestorDAO gestorDAO;
       private IDocumentoEnvioEncomienda documentoEnvioEncomiendaDAO;
       public EnvioEncomiendaServicio() 
        {
            FabricaAbstractaDAO fabricaAbstractaDAO = FabricaAbstractaDAO.getInstancia();
            gestorDAO = fabricaAbstractaDAO.crearGestorDAO();
            documentoEnvioEncomiendaDAO = fabricaAbstractaDAO.crearDocumentoEnvioEncomiendaDAO(gestorDAO);
        }
       public int InsertarEnvioEncomienda(DocumentoEnvioEncomienda documentoEnvio)
       {
           //try
           //{
           String cadxml = "";
           cadxml += "<Envio ";
           cadxml += "idRuta='" + documentoEnvio.Ruta.IdRuta + "' ";
           cadxml += "FechaEnvio='" + documentoEnvio.FechaEnvio + "' ";
           cadxml += "A_Domicilio='" + documentoEnvio.ADomicilio + "' ";
           cadxml += "idClienteEnvio='" + documentoEnvio.ClienteEnvio.IdCliente + "' ";
           cadxml += "idClienteEntrega='" + documentoEnvio.ClienteEntrega.IdCliente + "'>";
           foreach (DetalleDocumentoEnvioEncomienda detalleEnvio in documentoEnvio.detalleEnvio)
           {
               cadxml += "<Det ";
               //   cadxml += "idDocumentoEnvio='" + detalleEnvio.DocumentoEnvio.IdDocumentoEnvioEncomienda + "' ";
               cadxml += "Descripción='" + detalleEnvio.Descripcion + "' ";
               cadxml += "Peso='" + detalleEnvio.Peso + "'/>";
           }
           cadxml += "</Envio>";
           cadxml = "<root>" + cadxml + "</root>";
               int i = documentoEnvioEncomiendaDAO.InsertarEnvioEncomienda(cadxml);
               gestorDAO.cerrarConexion();
               return i;
           //}
           //catch (Exception ex)
           //{
           //    throw ex;
           //}
       }
       public Boolean InsertarEnvioEncomienda2(DocumentoEnvioEncomienda documentoEnvio)
       {
               Boolean insertar = documentoEnvioEncomiendaDAO.InsertarEnvioEncomienda2(documentoEnvio);
               gestorDAO.cerrarConexion();
               return insertar;
        
       }

       public Boolean InsertarDetalleEnvioEncomienda(DetalleDocumentoEnvioEncomienda detalleEnvio)
       {


           try
           {
               Boolean insertar = documentoEnvioEncomiendaDAO.InsertarDetalleEnvioEncomienda(detalleEnvio);
               gestorDAO.cerrarConexion();
               return insertar;
           }
           catch (Exception e)
           {
               throw e;
           }
       }
       public Boolean InsertarDocumentoPago(DocumentoPago documentoPago)
       {


           try
           {
               Boolean insertar = documentoEnvioEncomiendaDAO.InsertarDocumentoPago(documentoPago);
               gestorDAO.cerrarConexion();
               return insertar;
           }
           catch (Exception e)
           {
               throw e;
           }
       }
       public List<DetalleDocumentoEnvioEncomienda> buscarClienteEntregaPendiente(String numDocumento,int idSucursal)
       {
           try
           {
               List<DetalleDocumentoEnvioEncomienda> listaDetalle;
               listaDetalle = documentoEnvioEncomiendaDAO.buscarClienteEntregaPendiente(numDocumento,idSucursal);
               gestorDAO.cerrarConexion();
               return listaDetalle;
           }
           catch (Exception e)
           {
               throw e;
           }
       }

       public List<DocumentoPago> ListarReporte(String Desde, String Hasta)
   //    public List<DocumentoPago> ListarReporte(String Desde, String Hasta)
       {
           try
           {
               List<DocumentoPago> listaReporte;
               listaReporte = documentoEnvioEncomiendaDAO.ListarReporte(Desde,Hasta);
               gestorDAO.cerrarConexion();
               return listaReporte;
           }
           catch (Exception e)
           {
               throw e;
           }

       }

       public Boolean insertarRecepcionEncomienda(int idCliente)
       {


           try
           {
               Boolean insertar = documentoEnvioEncomiendaDAO.insertarRecepcionEncomienda(idCliente);
               gestorDAO.cerrarConexion();
               return insertar;
           }
           catch (Exception e)
           {
               throw e;
           }
       }

       public DocumentoPago MontoTotalReporte(String Desde, String Hasta)
       {
           try
           {
               DocumentoPago documento = documentoEnvioEncomiendaDAO.MontoTotalReporte(Desde, Hasta);
               gestorDAO.cerrarConexion();
               return documento;
           }
           catch (Exception e)
           {
               throw e;
           }
       }
       public DocumentoPago ObtenerNumeros(String tipoDocumento,int idSucursal)
       {
           try
           {
               DocumentoPago documento = documentoEnvioEncomiendaDAO.ObtenerNumeros(tipoDocumento,idSucursal);
               gestorDAO.cerrarConexion();
               return documento;
           }
           catch (Exception e)
           {
               throw e;
           }
       }
   }
}
