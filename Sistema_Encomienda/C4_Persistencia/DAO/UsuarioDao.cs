using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using C3_Dominio.Entidades;
using C3_Dominio.Contratos;
using System.Data;
using System.Data.SqlClient;
namespace C4_Persistencia.DAO
{
   public class UsuarioDao : IUsuarioDAO
    {
        private IGestorDAO gestorDAOSQL;
        public UsuarioDao(IGestorDAO gestorDAOSQL)
        {
            this.gestorDAOSQL = gestorDAOSQL;
        }
       #region Metodos
        public Usuario inicioSesion(String usuarios, String clave)
       {
           SqlCommand cmd = null;
           Usuario usuario = null;
           SqlConnection cn = null;
           try
           {
               cn = new SqlConnection();
          cn = gestorDAOSQL.abrirConexion();
          cmd = new SqlCommand("sp_IniciarSesion", cn);
           cmd.CommandType = CommandType.StoredProcedure;
   
           cmd.Parameters.AddWithValue("@usuario", usuarios);
           cmd.Parameters.AddWithValue("@clave", clave);
           //  cn.Open();
           SqlDataReader dr = cmd.ExecuteReader();
           if (dr.Read())
           {
               usuario = new Usuario();
               usuario.IdUsuario = Convert.ToInt32(dr["idUsuario"]);
               usuario.Usuarios = dr["Usuario"].ToString();
               usuario.Clave = dr["Clave"].ToString();
               usuario.NombreUsuario = dr["NombreUsuario"].ToString();
               usuario.ApellidosUsuario = dr["ApellidosUsuario"].ToString();
               usuario.DNI = dr["DNI"].ToString();
               usuario.Direccion = dr["Direccion"].ToString();
               usuario.Telefono = dr["Telefono"].ToString();
               usuario.Cargo = dr["Cargo"].ToString();
               Sucursal sucursal = new Sucursal();
               sucursal.IdSucursal = Convert.ToInt32(dr["idSucursal"]);
               sucursal.Ciudad = dr["Ciudad"].ToString();
               sucursal.Direccion = dr["SucursalDireccion"].ToString();
               sucursal.Telefono = dr["Telefono"].ToString();
               usuario.sucursal = sucursal;
               TipoUsuario tipoUsuario = new TipoUsuario();
               tipoUsuario.id = Convert.ToInt32(dr["tipoUsuario"]);
               tipoUsuario.nombre = Convert.ToString(dr["nombre"]);
               usuario.tipoUsuario = tipoUsuario;
                   }
               }catch(Exception e){
                   throw e;
               }
               // finally { cmd.Connection.Close(); }
               return usuario;
           
       }
        public List<Usuario> listarUsuarios()
        {
            SqlCommand comando = null;
            SqlDataReader dr = null;
            SqlConnection conexion = null;
            Usuario usuario = null;

            try
            {
                List<Usuario> lista = new List<Usuario>();
                conexion = gestorDAOSQL.abrirConexion();
                comando = new SqlCommand("sp_listarUsuarios",conexion);
                comando.CommandType = CommandType.StoredProcedure;
                dr = comando.ExecuteReader();
                while (dr.Read())
                {
                    usuario = new Usuario();
                    usuario.IdUsuario = Convert.ToInt32(dr["idUsuario"]);
                    usuario.Usuarios = dr["Usuario"].ToString();
                    usuario.Clave = dr["Clave"].ToString();
                    usuario.NombreUsuario = dr["NombreUsuario"].ToString();
                    usuario.ApellidosUsuario = dr["ApellidosUsuario"].ToString();
                    usuario.DNI = dr["DNI"].ToString();
                    usuario.Direccion = dr["Direccion"].ToString();
                    usuario.Telefono = dr["Telefono"].ToString();
                    usuario.Cargo = dr["Cargo"].ToString();
                    Sucursal sucursal = new Sucursal();
                    sucursal.IdSucursal = Convert.ToInt32(dr["idSucursal"]);
                    sucursal.Ciudad = Convert.ToString(dr["ciudad"]);
                    usuario.sucursal = sucursal;
                    TipoUsuario tipoUsuario = new TipoUsuario();
                    tipoUsuario.id = Convert.ToInt32(dr["tipoUsuario"]);
                    tipoUsuario.nombre = Convert.ToString(dr["nombre"]);
                    usuario.tipoUsuario = tipoUsuario;
                    lista.Add(usuario);
                    
                }
                return lista;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        #endregion Metodos
    }
}
