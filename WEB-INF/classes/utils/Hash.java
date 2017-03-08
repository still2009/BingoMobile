/**
 * Created by jason2009
 * 2015��3��15�� ����11:28:30
 */
package utils;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	public static String MD5(InputStream in){
		byte buff[] = new byte[1024];
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			int i = 0;
			do{
				i = in.read(buff);
				digest.update(buff);
			}while(i != -1);
			in.close();
			return Byte2HexString(digest.digest());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} finally{
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static String MD5(byte[] msg){
		byte messageDigest[] = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			digest.update(msg);
            messageDigest = digest.digest();
            // Create Hex String
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return Byte2HexString(messageDigest);
	}
	
	public static String Byte2HexString(byte[] array){
		StringBuffer hexString = new StringBuffer();
        //�ֽ�����ת��Ϊʮ�������
        for (int i = 0; i < array.length; i++) {
            String Hex = Integer.toHexString(array[i] & 0xFF);
            if (Hex.length() < 2) {
                hexString.append(0);
            }
            hexString.append(Hex);
        }
        return hexString.toString();
	}
	
	public static void main(String[] args) {
		InputStream in = null;
		String path = "/home/jason2009/Desktop/img/";
		String name;
		for(int i = 10;i <= 10;i++){
			name = path + i + ".jpg";
			try {
				in = new FileInputStream(name);
				System.out.println(Hash.MD5(in));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
}
