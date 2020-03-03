/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author RDragon197
 */
public class UsuariosDB {

    /**
     * *
     * @author Ramon Rivera. Se definen los parametros estadicos de la clase
     *
     */
    private int idUsuario;
    private int idMunicipios;
    private String pNombre;
    private String pApellido;
    private String correoElectronico;
    private String numTelefono;
    private Date fechaRegistro;
    private Date fechaNacimiento;
    private String RTN;
    private String contraseña;

    /**
     * *
     * @author Ramon Rivera. Se define el constructor donde se puede instanciar
     * sin pasar los parametros
     */
    public UsuariosDB() {
        this.idUsuario = 0;
        this.idMunicipios = 0;
        this.pNombre = "";
        this.pApellido = "";
        this.correoElectronico = "";
        this.numTelefono = "";
        this.fechaRegistro = null;
        this.fechaNacimiento = null;
        this.RTN = "";
        this.contraseña = "";
    }

    /**
     * *
     * @author Ramon Rivera. Se define el constructor donde se puede instanciar
     * con los parametros
     * @param idUsuario
     * @param idMunicipios
     * @param pNombre
     * @param pApellido
     * @param fechaNacimiento
     * @param correoElectronico
     * @param fechaRegistro
     * @param numeroTelefono
     * @param contraseña
     * @param RTN
     */
    public UsuariosDB(int idUsuario, int idMunicipios, String pNombre, String pApellido, String correoElectronico, String numeroTelefono, Date fechaRegistro, Date fechaNacimiento, String RTN, String contraseña) {
        this.idUsuario = idUsuario;
        this.idMunicipios = idMunicipios;
        this.pNombre = pNombre;
        this.pApellido = pApellido;
        this.correoElectronico = correoElectronico;
        this.numTelefono = numeroTelefono;
        this.fechaRegistro = fechaRegistro;
        this.fechaNacimiento = fechaNacimiento;
        this.RTN = RTN;
        this.contraseña = contraseña;
    }

    /**
     * *
     * @author Ramon Rivera. metodo que permite generar una consulta a la tabla
     * de usuarios
     * @return retorna la tabla como tal en un <b>String</b>
     *
     */
    public String consultarUsuarios() throws SQLException {
        String datos = "-1";
        try {
            // Se crea un Statement, para realizar la consulta
            Statement s = ConexionMySQL.conectar().createStatement();

            // Se realiza la consulta. Los resultados se guardan en el 
            // ResultSet rs
            ResultSet rs = s.executeQuery("select * from usuario");

            // Se recorre el ResultSet, mostrando por pantalla los resultados.
            while (rs.next()) {
                datos += rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3)+ rs.getString(4) + " " + rs.getString(5)+ rs.getString(6) + " " + rs.getString(7)+ rs.getString(8) + " " + rs.getString(9)+ rs.getString(10) + " " + rs.getString(11);
                datos += "<br>";
            }

            // Se cierra la conexión con la base de datos.
            ConexionMySQL.desconectar();
        } catch (Exception e) {
            datos = "Error al hacer la consulta de usuarios:" + e.getMessage();
        }
        return datos;
    }

    /**
     * *
     * @author Ramon Rivera. metodo que permite insertar un nuevo usuario en la
     * tabla de usuarios
     * @return retorna un <b>boolean</b> indicando si la consulta tubo o no
     * exito
     *
     */
    public boolean insertarUsuarios() {
        boolean estado = false;
        try {
            DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());

            // Se crea un Statement, para realizar la consulta
            PreparedStatement s = ConexionMySQL.conectar().prepareStatement("INSERT INTO usuario VALUES (NULL,?,?,?,?,?,?,?,?,?,?)");

            // Se realiza la consulta. Los resultados se guardan en el 
            // ResultSet rs
            s.setInt(1, this.idUsuario);
            s.setInt(2, this.idMunicipios);
            s.setString(3, this.pNombre);
            s.setString(4, this.pApellido);
            s.setString(5, this.correoElectronico);
            s.setString(6, this.numTelefono);
            s.setDate(7, this.fechaRegistro);
            s.setDate(8, this.fechaNacimiento);
            s.setString(9, this.RTN);
            s.setString(10, this.contraseña);
            s.executeUpdate();
            ConexionMySQL.desconectar();

            estado = true;
        } catch (Exception e) {
            estado = false;
            System.out.println(e.getMessage());
        }
        return estado;
    }

    /**
     * @return the idUsuario
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    /**
     * @return the idMunicipios
     */
    public int getIdMunicipios() {
        return idMunicipios;
    }

    /**
     * @param idMunicipios the idMunicipios to set
     */
    public void setIdMunicipios(int idMunicipios) {
        this.idMunicipios = idMunicipios;
    }

    /**
     * @return the pApellido
     */
    public String getpApellido() {
        return pApellido;
    }

    /**
     * @param pApellido the pApellido to set
     */
    public void setpApellido(String pApellido) {
        this.pApellido = pApellido;
    }

    /**
     * @return the correoElectronico
     */
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    /**
     * @param correoElectronico the correoElectronico to set
     */
    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    /**
     * @return the numTelefono
     */
    public String getNumTelefono() {
        return numTelefono;
    }

    /**
     * @param numTelefono the numTelefono to set
     */
    public void setNumTelefono(String numTelefono) {
        this.numTelefono = numTelefono;
    }

    /**
     * @return the fechaRegistro
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * @param fechaRegistro the fechaRegistro to set
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * @return the fechaNacimiento
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * @return the RTN
     */
    public String getRTN() {
        return RTN;
    }

    /**
     * @param RTN the RTN to set
     */
    public void setRTN(String RTN) {
        this.RTN = RTN;
    }

    /**
     * @return the contraseña
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * @param contraseña the contraseña to set
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * @return the pNombre
     */
    public String getpNombre() {
        return pNombre;
    }

    /**
     * @param pNombre the pNombre to set
     */
    public void setpNombre(String pNombre) {
        this.pNombre = pNombre;
    }

}
