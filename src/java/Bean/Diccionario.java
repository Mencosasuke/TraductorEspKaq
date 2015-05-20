package Bean;

public class Diccionario {
    private int id;
    private String espanol;
    private String kakchiquel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEspanol() {
        return espanol;
    }

    public void setEspanol(String espanol) {
        this.espanol = espanol;
    }

    public String getKakchiquel() {
        return kakchiquel;
    }

    public void setKakchiquel(String kakchiquel) {
        this.kakchiquel = kakchiquel;
    }
    
    public Diccionario(){}
    
    public Diccionario(int _id, String _esp, String _kak){
        this.id = _id;
        this.espanol = _esp;
        this.kakchiquel = _kak;
    }
    
}
