//判断输入的日期是否正确
/**
 * @return {boolean}
 */
function CheckDate(INDate){
	if (INDate===""){
		return true;
	}
	let subYY = INDate.substr(0, 4);
	if(isNaN(subYY) || subYY<=0){
		return true;
	}
	//转换月份
	let separate;
	if (INDate.indexOf('-', 0) !== -1) {
		separate = "-";
	} else {
		if (INDate.indexOf('/', 0) !== -1) {
			separate = "/";
		} else {
			return true;
		}
	}
	let area = INDate.indexOf(separate, 0);
	let subMM = INDate.substr(area + 1, INDate.indexOf(separate, area + 1) - (area + 1));
	if(isNaN(subMM) || subMM<=0){
		return true;
	}
	if(subMM.length<2){subMM="0"+subMM}
	//转换日
	area=INDate.lastIndexOf(separate);
	let subDD = INDate.substr(area + 1, INDate.length - area - 1);
	if(isNaN(subDD) || subDD<=0){
		return true;
	}
	if(eval(subDD)<10){subDD="0"+eval(subDD)}
	let NewDate = subYY + "-" + subMM + "-" + subDD;
	if(NewDate.length!==10){return true;}
    if(NewDate.substr(4,1)!=="-"){return true;}
    if(NewDate.substr(7,1)!=="-"){return true;}
	const MM = NewDate.substr(5, 2);
	const DD = NewDate.substr(8, 2);
	if((subYY%4===0 && subYY%100!==0)||subYY%400===0){ //判断是否为闰年
		if(parseInt(MM)===2){
			if(DD>29){return true;}
		}
	}else{
		if(parseInt(MM)===2){
			if(DD>28){return true;}
		}	
	}
	const mm = [1, 3, 5, 7, 8, 10, 12]; //判断每月中的最大天数
	for(i=0;i< mm.length;i++){
		if (parseInt(MM) === mm[i]){
			return parseInt(DD) > 31;
		}
	}
   if(parseInt(DD)>30){return true;}
   return parseInt(MM) > 12;

}

