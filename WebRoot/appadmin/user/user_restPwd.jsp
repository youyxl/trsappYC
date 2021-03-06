<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="pageContent">
	<form method="post" action="${basePath}user.do?method=resetPassword" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<input type="hidden" name="userIDs" value="${appUser.userId}"/>
		<div class="pageFormContent" layoutH="56">
			<div class="unit">
				<label>用户名：</label>
				<INPUT type="text" name="userName" value="${appUser.username}" disabled="disabled"  style="width:160px;"/>
			</div>			
			<div class="unit">
				<label>新密码：</label>
				<INPUT id="w_validation_pwd" type="password" name=newPwd value="" class="required" minlength="8" maxlength="30" onKeyUp="pwStrength(this.value)" style="width:160px;"/>
			</div>
			<div class="unit">
				<label>&nbsp;</label>							
				<INPUT id="weakPasswd" type="hidden" name="weakPasswd" value="0" />
			    <table border="0" cellspacing="0" cellpadding="0" >
  					<tr>
    					<td width="43" bgcolor="#ffd099" class="hS_yxL2" id="strength_L" style="line-height:18px;">弱</td>
    					<td width="2"></td>
    					<td width="43" bgcolor="#ffd099" class="hS_yxL2" id="strength_M" style="line-height:18px;">中</td>
    					<td width="2"></td>
    					<td width="43" bgcolor="#ffd099" class="hS_yxL2" id="strength_H" style="line-height:18px;">强</td>
  					</tr>
				</table>
				
			</div>
			<div class="unit">
				<label></label>
				<table border="0" cellspacing="0" cellpadding="0" >
  					 <tr>
    					<td style="line-height:18px;">强密码：包含数字、字母、特殊字符且长度超过8位</td>
  					</tr>
				</table>
			</div>			
			<div class="unit">
				<label>确认密码：</label>
				<INPUT type="password"  name="sureUserPwd" value="" class="required" equalto="#w_validation_pwd" style="width:160px;"/>
			</div>			
						
		</div>
		
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript"> 
//CharMode函数 
//测试某个字符是属于哪一类. 
function CharMode(iN){ 
	if (iN>=48 && iN <=57) //数字 
	return 1; 
	if (iN>=65 && iN <=90) //大写字母 
	return 2; 
	if (iN>=97 && iN <=122) //小写 
	return 4; 
	else 
	return 8; //特殊字符 
} 
//bitTotal函数 
//计算出当前密码当中一共有多少种模式 
function bitTotal(num){ 
	modes=0; 
	for (i=0;i<4;i++){ 
	if (num & 1) modes++; 
	num>>>=1; 
	} 
	return modes; 
} 
//checkStrong函数 
//返回密码的强度级别 
function checkStrong(sPW){ 
	if (sPW.length<=8) 
	return 0; //密码太短 
	Modes=0; 
	for (i=0;i<sPW.length;i++){ 
	//测试每一个字符的类别并统计一共有多少种模式. 
	Modes|=CharMode(sPW.charCodeAt(i)); 
	} 
	return bitTotal(Modes); 
} 
//pwStrength函数 
//当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色 
function pwStrength(pwd){ 
	O_color="#ffd099"; 
	L_color="#FF0000"; 
	M_color="#FF9900"; 
	H_color="#33CC00"; 
	if (pwd==null||pwd==''){ 
		Lcolor=Mcolor=Hcolor=O_color; 
	} 
	else{ 
		S_level=checkStrong(pwd);
		//alert("S_level:"+S_level); 
		switch(S_level) { 
			case 0: //密码太短,属于弱密码状态
				Lcolor=L_color; 
				Mcolor=Hcolor=O_color;
				$('#weakPasswd').attr('value','0');				
	 			break;
			case 1: //一种字符模式,属于弱密码状态
				Lcolor=L_color; 
				Mcolor=Hcolor=O_color;
				$('#weakPasswd').attr('value','0');
				break; 
			case 2: //两种字符模式,属于中强度密码状态
				Lcolor=Mcolor=M_color; 
				Hcolor=O_color;			 
				$('#weakPasswd').attr('value','1'); 
				break;
			case 3: //三种字符模式,属于强弱密码状态
				Lcolor=Mcolor=Hcolor=H_color;			 
				$('#weakPasswd').attr('value','1'); 
				break;				 
			default:  //三种字符模式,属于强弱密码状态
				Lcolor=Mcolor=Hcolor=H_color;
				$('#weakPasswd').attr('value','1'); 
			} 
	} 
	document.getElementById("strength_L").style.background=Lcolor; 
	document.getElementById("strength_M").style.background=Mcolor; 
	document.getElementById("strength_H").style.background=Hcolor;
	
	return; 
}
</script>