using C2_Aplicacion.Mantenimientos;
using C3_Dominio.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace C1_Presentacion.Controllers
{
    public class UsuarioController : Controller
    {
        //
        // GET: /Usuario/
        GestionarUsuario objUsuario = new GestionarUsuario();
        public ActionResult ListaUsuario()
        {
            List<Usuario> lista = objUsuario.listarUsuario();
            return View(lista);
        }
        
        public ViewResult NuevoUsuario()
        {
            return View();
        }
        public ActionResult modificarCliente()
        {
            return View();
        }
        public ActionResult eliminarCliente()
        {
            return View();
        }
	}
}