package com.util;

import java.security.MessageDigest;

public class MD5 {
	
	private String instr;
    private MessageDigest md;

    /**
     * 
     * @param inStr
     */
    private MD5(String instr) {
    	this.instr = instr;
        try {
            this.md = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
        }
    }

    /**
     * MD5加密核心算法
     * @return
     */
    protected String compute() {
        char[] charArray = this.instr.toCharArray();
        byte[] byteArray = new byte[charArray.length];
        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = this.md.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++) {
            int val = (md5Bytes[i]) & 0xff;
            if (val < 16)
                hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

    /**
     * 加密方法
     * @param 明文数字
     * @return
     */
    public static String ecode(String pwd) {
        MD5 md5 = new MD5(pwd);
        String outstr = md5.compute();
        return outstr;
    }
    
    public static void main(String[] args) {
		System.out.println(ecode("123456"));
	}
}
