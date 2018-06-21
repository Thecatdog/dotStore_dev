package com.example.jpetstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.dao.mybatis.mapper.ReviewMapper;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.domain.Review;
import com.example.jpetstore.service.PetStoreFacade;

/**
 * @author Juergen Hoeller
 * @since 30.11.2003
 * @modified-by Changsup Park
 */
@Controller
public class ViewItemController { 

	private PetStoreFacade petStore;
	
	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private ReviewMapper reviewMapper;
	

	@Autowired
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

	@RequestMapping("/shop/viewItem.do")
	public String handleRequest(
			@RequestParam("itemId") String itemId,
			ModelMap model) throws Exception {

		
		Item item = this.petStore.getItem(itemId);
		Product product = productMapper.getProduct(item.getProductId());
	
		model.put("item", item);
		model.put("product", product);
		
		List<Review> reviewList = reviewMapper.getListByItemId(itemId);
		
		model.put("reviewList", reviewList);
		
		return "Item";
	}

}
