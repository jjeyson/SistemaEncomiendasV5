using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_Dominio.Entidades;
namespace C3_Dominio.Contratos
{
  public  interface IUsuarioDAO
    {
      Usuario inicioSesion(String usuarios, String clave);
    }
}
