using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_Dominio.Entidades;
using C3_Dominio.Contratos;
using C4_Persistencia.DAO;
using C4_Persistencia.FabricaDAO;
namespace C2_Aplicacion.Mantenimientos
{
   public class GestionarUsuario
    {

        private IGestorDAO gestorDAO;
        private IUsuarioDAO usuarioDAO;

        public GestionarUsuario()
        {
            FabricaAbstractaDAO fabricaAbstractaDAO = FabricaAbstractaDAO.getInstancia();
            gestorDAO = fabricaAbstractaDAO.crearGestorDAO();
            usuarioDAO = fabricaAbstractaDAO.crearUsuarioDAO(gestorDAO);
        }
        #region Metodos
        public Usuario inicioSesion(String usuario, String clave)
        {
            try
            {
                Usuario objUsuario = usuarioDAO.inicioSesion(usuario, clave);    
                    gestorDAO.cerrarConexion();
                    return objUsuario; 
            }catch(ApplicationException z){
                throw z;
            }catch (Exception e) {
                throw e; 
            }
        }
        public List<Usuario> listarUsuario()
        {
            try
            {
                List<Usuario> lista = usuarioDAO.listarUsuarios();
                gestorDAO.cerrarConexion();
                return lista;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        #endregion
    }
}
