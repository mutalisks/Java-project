package util;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;


public class Info {

	public static int getBetweenDayNumber(String dateA, String dateB) {
		long dayNumber = 0;
		//1小时=60分钟=3600秒=3600000
		long mins = 60L * 1000L;
		//long day= 24L * 60L * 60L * 1000L;计算天数之差
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
		   java.util.Date d1 = df.parse(dateA);
		   java.util.Date d2 = df.parse(dateB);
		   dayNumber = (d2.getTime() - d1.getTime()) / mins;
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return (int) dayNumber;
		}
	
	public static void main(String[] g )
	{
	System.out.print(Info.getBetweenDayNumber("2012-11-11 11:19", "2012-11-11 11:11"));
	}


	public static String generalFileName(String srcFileName) {
		try{
		   int index=srcFileName.lastIndexOf(".");
		   return StrUtil.generalSrid()+srcFileName.substring(index).toLowerCase();
		}catch(Exception e){
			return StrUtil.generalSrid();
		}
	}

	public synchronized static String getID() {
		
		Random random = new Random();
		StringBuilder ret = new StringBuilder(20);
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MMddHHmmss", Locale.JAPAN);
		ret.append(format.format(date));
		String rand = String.valueOf(Math.abs(random.nextInt()));
		ret.append(rand, 0, 4);
		
		return ret.toString();
	}
	public synchronized static String subStr(String source,int length) {
		if(source.length()>length)
		{
			source=source.substring(0,length)+"...";
		}
		return source;
	}
	public static String getDateStr(){
		String dateString="";
		try{
		java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime_1=new java.util.Date();
		dateString=formatter.format(currentTime_1);
		}catch(Exception ignored){
		     }
		 return dateString;
		 }

	public static void delPic(String path,String img)
		{
			 if(img!=null)
			 {
				 if(!img.equals(""))
				 {
			  File file1=new File(path + "/" + img); 
		       if(file1.exists() ) {
				   file1.deleteOnExit();
				   file1.delete();
			   }
				 }
			 }
		}
}

		

