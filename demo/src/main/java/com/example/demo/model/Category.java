package com.example.demo.model;


import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.*;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @Column(name = "category_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer categoryId;

    @Column(name = "category_name")
    private String categoryName;

    @ManyToMany(mappedBy = "listCategory",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Set<Post> listPost = new HashSet<>();

    public Set<Post> getListPost() {
        return listPost;
    }

    public void setListPost(Set<Post> listPost) {
        this.listPost = listPost;
    }

    public Integer getCategoryId() {
        return this.categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return this.categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
