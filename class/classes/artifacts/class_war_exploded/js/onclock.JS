function clockon(bgclock){
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var date=now.getDate();
	var day=now.getDay();
	var hour=now.getHours();
	var minu=now.getMinutes();
	var sec=now.getSeconds();
	var week;
	month=month+1;
	if(month<10) month="0"+month;
	if(date<10) date="0"+date;
	if(hour<10) hour="0"+hour;
	if(minu<10) minu="0"+minu;
	if(sec<10) sec="0"+sec;
	const arr_week = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"];
	week=arr_week[day];
	let time = "";
	time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec;
	if(document.all){
		bgclock.innerHTML="<b>"+time+"</b>"
	}
	const timer = setTimeout("clockon(bgclock)", 200);
} 
