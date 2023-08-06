package model;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Base64.Encoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class PayUtil {

	// 결제 승인 API 호출하기

//	String orderId = request.getParameter("orderId");
//	String paymentKey = request.getParameter("paymentKey");
//	String amount = request.getParameter("amount");
//	String secretKey = "test_sk_ZORzdMaqN3w6xajbz0N85AkYXQGw:";
//
//	Encoder encoder = Base64.getEncoder();
//	byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
//	String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
//
//	paymentKey=URLEncoder.encode(paymentKey,StandardCharsets.UTF_8);
//
//	URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
//
//	HttpURLConnection connection = (HttpURLConnection) url
//			.openConnection();connection.setRequestProperty("Authorization",authorizations);connection.setRequestProperty("Content-Type","application/json");connection.setRequestMethod("POST");connection.setDoOutput(true);
//	JSONObject obj = new JSONObject();obj.put("paymentKey",paymentKey);obj.put("orderId",orderId);obj.put("amount",amount);
//
//	OutputStream outputStream = connection.getOutputStream();outputStream.write(obj.toString().getBytes("UTF-8"));
//
//	int code = connection.getResponseCode();
//	boolean isSuccess = code == 200 ? true : false;
//
//	InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
//
//	Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
//	JSONParser parser = new JSONParser();
//	JSONObject jsonObject = (JSONObject) parser.parse(reader);
//	responseStream.close();
//
//	if(isSuccess)
//	{
//        String resultData = jsonObject.toJSONString(); //결과 데이터
//        String orderName = (String) jsonObject.get("orderName");
//        String method = (String) jsonObject.get("method");
//            if(jsonObject.get("method").equals("카드")){ 
//            	System.out.println(((JSONObject)jsonObject.get("card")).get("number"));
//            	}
//            if(jsonObject.get("method").equals("가상계좌")){ 
//            	System.out.println(((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber"));
//            	}
//            if(jsonObject.get("method").equals("계좌이체")){
//            	System.out.println(((JSONObject)jsonObject.get("transfer")).get("bank"));
//            	}
//            if(jsonObject.get("method").equals("휴대폰")){
//            	System.out.println(((JSONObject)jsonObject.get("mobilePhone")).get("customerMobilePhone"));
//            	}
//	}
//	//결제 실패
//	else{
//        message = jsonObject.get("message");
//        error = jsonObject.get("code"); // 에러코드
//
//    }
}
