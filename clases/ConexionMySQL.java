/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author RDragon197
 */
public class ConexionMySQL {
    
    private static Connection conexion;
    /**
     * *
     * @author Ramon Rivera. 
     * metodo que permite generar una conexion con la base de datos
     * @return retorna una conexion como tal <b>Connection</b>
     *
     */    
    
    public static Connection conectar() throws SQLException {
        // Se registra el Driver de MySQL
        DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());

        // Se obtiene una conexión con la base de datos. Hay que
        // cambiar el usuario "root" y la clave "la_clave" por las
        // adecuadas a la base de datos que estemos usando.
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/avisoshn", "root", "");

        return conexion;
    }
     /**
     * *
     * @author Ramon Rivera. 
     * metodo que permite cerrar la conexion
     *
     */
    public static void desconectar() throws SQLException {
        conexion.close();
    }
}
