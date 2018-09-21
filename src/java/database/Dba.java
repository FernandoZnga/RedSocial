package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Dba {

    private String base_datos;
    private Connection dbcon;
    public Statement query;

    public Dba() {
    }

    public void setBase_datos(String base_datos) {
        this.base_datos = base_datos;
    }

    public void conectar() {

        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("oracle.jdbc.OracleDriver");
            String driver = "jdbc:oracle:thin:@";
            base_datos = "142.93.245.77:49161:XE";
            dbcon = DriverManager.getConnection(driver + base_datos, "proy", "proy");
            query = dbcon.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    public void desconectar() {
        try {
            query.close();
            dbcon.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    public void commit() {
        try {
            dbcon.commit();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}
