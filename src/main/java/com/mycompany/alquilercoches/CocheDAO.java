/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.alquilercoches;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.DataSource;

public class CocheDAO {
    private DataSource dataSource;

    public CocheDAO() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/alquiler_db");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    // Consulta para listar coches disponibles en una ubicación y período de tiempo específicos
    public List<Coche> listarCochesDisponibles(String pickupLocation, String pickupDate, String dropoffDate) {
        List<Coche> cochesDisponibles = new ArrayList<>();
        try {
            Connection conn = dataSource.getConnection();
            // Modificar la consulta SQL para filtrar por ubicación y período de tiempo
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM vehiculo");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coche coche = new Coche();
                coche.setId(rs.getInt("id"));
                coche.setMatricula(rs.getString("Matricula"));
                coche.setTipo(rs.getString("Tipo"));
                coche.setColor(rs.getInt("Color"));
                coche.setPrecioPorDia(rs.getDouble("precio_por_dia"));
                // Aquí puedes manejar otros atributos como colores disponibles, etc.
                cochesDisponibles.add(coche);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cochesDisponibles;
    }

    // Métodos para agregar, actualizar y eliminar coches...
}
