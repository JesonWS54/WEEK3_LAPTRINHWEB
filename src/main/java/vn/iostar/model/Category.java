package vn.iostar.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Category implements Serializable {
    private int cateid;
    private String catename;
    private String icons;
    
    public Category() {
    }
    
    public Category(int cateid, String catename, String icons) {
        this.cateid = cateid;
        this.catename = catename;
        this.icons = icons;
    }
    
    public int getCateid() {
        return cateid;
    }
    
    public void setCateid(int cateid) {
        this.cateid = cateid;
    }
    
    public String getCatename() {
        return catename;
    }
    
    public void setCatename(String catename) {
        this.catename = catename;
    }
    
    public String getIcons() {
        return icons;
    }
    
    public void setIcons(String icons) {
        this.icons = icons;
    }
}