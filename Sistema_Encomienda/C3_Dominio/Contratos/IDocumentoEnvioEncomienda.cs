using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_Dominio.Entidades;
namespace C3_Dominio.Contratos
{
    public interface IDocumentoEnvioEncomienda
    {
        int InsertarEnvioEncomienda(String cadxml);
        Boolean InsertarEnvioEncomienda2(DocumentoEnvioEncomienda documentoEnvio);
      //  Boolean InsertarDetalleEnvioEncomienda(List<DetalleDocumentoEnvioEncomienda> detalleEnvio);
        Boolean InsertarDetalleEnvioEncomienda(DetalleDocumentoEnvioEncomienda detalleEnvio);
        Boolean InsertarDocumentoPago(DocumentoPago documentoPago);
        List<DetalleDocumentoEnvioEncomienda> buscarClienteEntregaPendiente(String numDocumento,int idSucursal);
        Boolean insertarRecepcionEncomienda(int idCliente);
        List<DocumentoPago> ListarReporte(String Desde, String Hasta);
       // List<DocumentoPago> ListarReporte(String Desde, String Hasta);
        DocumentoPago MontoTotalReporte(String Desde, String Hasta);
        DocumentoPago ObtenerNumeros(String tipoDocumento,int idSucursal);
    }
}
