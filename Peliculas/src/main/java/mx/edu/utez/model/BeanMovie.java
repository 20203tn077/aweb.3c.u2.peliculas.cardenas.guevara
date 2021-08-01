package mx.edu.utez.model;

public class BeanMovie {
    //Id, Nombre, Descripción, Fecha de estreno, Recaudación (cuánto dinero generó), Estado (activo/inactivo).
    private long id;
    private String name;
    private String description;
    private String releaseDate;
    private int boxOffice;
    private byte status;

    public BeanMovie() {
    }

    public BeanMovie(long id, String name, String description, String releaseDate, int boxOffice, byte status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.releaseDate = releaseDate;
        this.boxOffice = boxOffice;
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getBoxOffice() {
        return boxOffice;
    }

    public void setBoxOffice(int boxOffice) {
        this.boxOffice = boxOffice;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
}
