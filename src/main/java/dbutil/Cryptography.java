package dbutil;

import java.util.Base64;

public class Cryptography {
public static  String encode(String text) {
	Base64.Encoder encoder = Base64.getEncoder();
	byte byteArr[]= encoder.encode(text.getBytes());
	return new String(byteArr);
}
public static String decode(String encript) {
	Base64.Decoder decoder = Base64.getDecoder();
	byte byteArr[]=decoder.decode(encript);
	
	return new String(byteArr);
}
}
