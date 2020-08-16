package com.example.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by 李本维 on 2019/11/22.
 */
@Data
public class carCategory {


    private Integer categoryId;

    private String categoryName;

    private Integer categoryType;

    private Date createTime;

    private Date updateTime;

    public carCategory() {
    }

    public carCategory(Integer categoryId, String categoryName, Integer categoryType, Date createTime, Date updateTime) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryType = categoryType;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
}
