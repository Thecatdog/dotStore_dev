package com.example.jpetstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;
import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.dao.mybatis.mapper.ReviewMapper;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.domain.Review;
import com.example.jpetstore.service.C2PService;
import com.example.jpetstore.service.P2PService;
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
	private OrderMapper orderMapper;
	
	@Autowired
	C2PService c2pService;
	
	@Autowired
	P2PService p2pService;
	
	@Autowired
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

	@RequestMapping("/shop/viewItem.do")
	public String handleRequest(HttpServletRequest request,
			@RequestParam(value="message", defaultValue="d") String message,
			@RequestParam("itemId") String itemId,
			ModelMap model) throws Exception {

		model.put("message", message);
		
		Item item = this.petStore.getItem(itemId);
		Product product = productMapper.getProduct(item.getProductId());
	
		model.put("item", item);
		model.put("product", product);
		
		if(item.getSupplier_cate().equals("member")) {
			model.put("form_type","p2p");
		}else {
			model.put("form_type","c2p");
		}
		
		List<Review> reviewList = reviewMapper.getListByItemId(itemId);
		final UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		
		Boolean isWritable = (userSession != null) && orderMapper.countByUserIdAndItemId(userSession.getAccount().getUsername(), itemId) > 0;
		if(isWritable) {
			for (Review review : reviewList) {
				if(review.getUserId().equals(userSession.getAccount().getUsername())) {
					isWritable = false;
					break;
				}
			}
		}
		
		model.put("isWritable", isWritable);
		model.put("reviewList", reviewList);
		
//		return "Item";
		return "tiles/Item";
	}
	
	@RequestMapping("/shop/itemDelete.do")
	public String itemDelete(@RequestParam("itemId") String itemId,@RequestParam("supplier_cate") String supplier_cate, ModelMap model) throws Exception {
		if(supplier_cate.equals("member")) {
			p2pService.deleteById(itemId);
		}
		else {
			c2pService.deleteById(itemId);
		}
		
		return "redirect:/shop/index.do";
	}

}
