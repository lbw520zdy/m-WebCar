package com.example;

import com.example.dao.carProductMapper;
import com.example.pojo.carProduct;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

	@Autowired
	public carProductMapper carProductMapper;
	@Test
	public void contextLoads() {
		carProduct carProduct = new carProduct();
		carProduct.setCategoryType(4);
		carProduct.setDescrition("2017款 6.8T 长轴距版");
		carProduct.setName("宾利慕尚");
		carProduct.setMainImage("https://car2.autoimg.cn/cardfs/product/g29/M08/84/A2/1024x0_1_q87_autohomecar__wKgHG1ttl9uAJxm2AAdSgzAw47I196.jpg");
		carProduct.setDetailImage1("https://car3.autoimg.cn/cardfs/product/g27/M04/88/BE/1024x0_1_q87_autohomecar__ChcCQFttl1-AYZPjAAkjD0_fmgo576.jpg");
		carProduct.setDetailImage2("https://car2.autoimg.cn/cardfs/product/g28/M0A/87/9C/1024x0_1_q87_autohomecar__ChcCR1ttl8qALUmCAAghcFPt6tM839.jpg");
		carProduct.setDetailImage3("https://car3.autoimg.cn/cardfs/product/g28/M03/87/9A/1024x0_1_q87_autohomecar__wKgHI1ttl8SAbPLfAAYD1ejocnM039.jpg");
		BigDecimal b1 = new BigDecimal("5500");
		carProduct.setPrice(b1);
		carProduct.setStock(7);
		carProduct.setStatus(1);
		carProductMapper.insert(carProduct);
	}

}
