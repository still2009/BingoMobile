/**
 * Created by jason2009
 * 2015年6月25日 下午10:29:59
 */
package test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Pdf2HtmlTest {
	public static void main(String[] args){
		InputStream in = null;
		try {
			String cmd = "pdf2htmlEX /home/jason2009/Documents/Ubuntu1204manul.pdf test.html --dest-dir /home/jason2009/Desktop/manul --split-pages 1";
			Process pro = Runtime.getRuntime().exec(cmd);
			pro.waitFor();
			in = pro.getInputStream();
			BufferedReader read = new BufferedReader(new InputStreamReader(in));
			String str = null;
			while(true){
				str = read.readLine();
				if(str != null) System.out.println(str);
				else break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}