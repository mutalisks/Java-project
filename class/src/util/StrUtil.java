// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   MD5.java

package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class StrUtil {
	private static int idSequence=10000;

	public synchronized static String generalSrid() {
		StringBuilder ret = new StringBuilder(20);
		ret.append(StrUtil.getFormatDate("yyyyMMddHHmmss"));		
		idSequence++;
		if(idSequence>20000)
		  idSequence-=10000;
		ret.append(String.valueOf(idSequence).substring(1));
		return ret.toString();
	}

	/**
	 * 得到当前日期的格式化字符串
	 * 
	 * @param formatString
	 * 如：yyyy(年)-MM(月)-dd(日)-HH(时)-mm(分)-ss(秒)-SSS(毫秒)
	
	 * @return 格式化过的当前日期字符串
	 */
	public static String getFormatDate(String formatString) {
		Date now =new Date(System.currentTimeMillis());
		SimpleDateFormat sdf=new SimpleDateFormat(formatString);
		return sdf.format(now);
	}

	/**
	 * 将格式化的日期字符串转换为日期。
	 * 
	 * @param formatString
	 * 如：yyyy(年)-MM(月)-dd(日)-HH(时)-mm(分)-ss(秒)-SSS(毫秒)
	
	 * @return 字符串转换后的日期。
	 */
	public static Date formatDate(String dateString) {
		try {
			SimpleDateFormat sdf=new SimpleDateFormat();
			return sdf.parse(dateString);
		} catch (ParseException e) {			
			return new Date();
		}		
	}
	
	public static int parseInt(String numberStr) {
		if(numberStr==null)
			return 0;
		Pattern pattern=Pattern.compile("^[\\-]?[0-9]+$");
		Matcher matcher = pattern.matcher(numberStr);
		if(matcher.find()){
			return Integer.parseInt(numberStr);
		}else{
			return 0;
		}			
	}
   
}
