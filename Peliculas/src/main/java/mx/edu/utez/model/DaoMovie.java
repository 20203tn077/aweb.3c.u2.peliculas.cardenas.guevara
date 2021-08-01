package mx.edu.utez.model;

import mx.edu.utez.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoMovie {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    static Logger logger = LoggerFactory.getLogger(DaoMovie.class);

    public boolean create(BeanMovie movie) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?)}");
            cstm.setString(1, movie.getName());
            cstm.setString(2, movie.getDescription());
            cstm.setString(3, movie.getReleaseDate());
            cstm.setInt(4, movie.getBoxOffice());
            flag = cstm.execute();
        } catch (SQLException e) {
            System.out.println("DaoMovie error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }
    public boolean update(BeanMovie movie) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?)}");
            cstm.setLong(1, movie.getId());
            cstm.setString(2, movie.getName());
            cstm.setString(3, movie.getDescription());
            cstm.setString(4, movie.getReleaseDate());
            cstm.setInt(5, movie.getBoxOffice());
            flag = cstm.execute();
        } catch (SQLException e) {
            System.out.println("DaoMovie error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }
    public boolean delete(long idMovie) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setLong(1, idMovie);
            flag = cstm.execute();
        } catch (SQLException e) {
            System.out.println("DaoMovie error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }

    public List<BeanMovie> findAll() {
        List<BeanMovie> movieList = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_findAll()}");
            rs = cstm.executeQuery();
            while (rs.next()) {
                BeanMovie movie = new BeanMovie(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("releaseDate"),
                        rs.getInt("boxOffice"),
                        rs.getByte("status")
                );
                movieList.add(movie);
            }
        } catch (SQLException e) {
            System.out.println("DaoMovie error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }
        return movieList;
    }
    public BeanMovie findByID(long idMovie) {
        BeanMovie movie = null;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_findByID(?)}");
            cstm.setLong(1, idMovie);
            rs = cstm.executeQuery();
            if (rs.next()) {
                movie = new BeanMovie(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("releaseDate"),
                        rs.getInt("boxOffice"),
                        rs.getByte("status")
                );
            }
        } catch (SQLException e) {
            System.out.println("DaoMovie error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }
        return movie;
    }


}
