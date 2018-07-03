package com.flfw.cart.json;

import net.sf.json.JSONArray;

public class Json_Transformation {
	public void ChangeJson(String Cartlist){
		JSONArray myJsonArray1 = JSONArray.fromObject(Cartlist);
		System.out.println(myJsonArray1);
		 for(int i = 0 ; i < myJsonArray1.size() ; i++){
			 JSONArray myJsonArray2 = JSONArray.fromObject(myJsonArray1.get(i));
             String productId = myJsonArray2.get(0).toString();
             System.out.println(productId);
             String quantity = myJsonArray2.get(1).toString();
             System.out.println(quantity);
         }
		
	}
}
