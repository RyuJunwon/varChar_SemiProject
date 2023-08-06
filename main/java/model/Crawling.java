package model;

import java.util.ArrayList;
import java.util.Iterator;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {

	public static void main(String[] args) {
		
		final String url = "https://twgkorea.com/category/기타/63/";
		
		Connection conn = Jsoup.connect(url);
		Document doc = null;
		
		try {
			doc = conn.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Elements name = doc.select("div.description > ul > li:nth-child(1) > span");

		Iterator<Element> itrName = name.iterator();

		ArrayList<String> nameList = new ArrayList<String>();

		while (itrName.hasNext()) {
			String teaName = itrName.next().text();
			nameList.add(teaName);
		}
		System.out.println(nameList);
	}

}
