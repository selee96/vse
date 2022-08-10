<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tag" uri="http://www.jksoft.com/taglib/tag" %>
<%@ taglib prefix="function" uri="http://www.jksoft.com/taglib/function" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%-- 
    JSP Name : registerReg.jsp
    Description : 회원가입 > 정보입력
    				- SNS 가입자는 아이디/비밀번호 입력란 필요없음.
--%>
<link rel="stylesheet" href="/resources/user/css/menber.css?v=${cacheParam}">
<style>
	#checkCertOk { display:none; }
</style>
<div id="container">
	<div class="location_bar">
		<ul class="clearfix inner pcTab">
			<li><a href="/index.vc">Home</a></li>
			<li class="active"><a href="#">본인인증</a></li>
		</ul>
		<div class="mo inner">
			<a href=""></a>
		</div>			
	</div>
	<div class="addinfo">
		<div class="inner">
			<h3 class="p_tit p_tit02">본인인증</h3>
			<div class="step">
				<ul>
					<li><p><span class="num"><em>01</em></span> <span>약관동의</span></p></li>
					<li class="active"><p><span class="num"><em>02</em></span> <span>회원정보 입력</span></p></li>
					<li><p><span class="num"><em>03</em></span> <span>본인인증 완료</span></p></li>
				</ul>
			</div>
			<p class="notice">본인인증 완료 후, 바이러스 클린 랩 홈페이지를 이용할 수 있습니다.</p>
			
			<form name="mainForm" method="post" action="/certification/registerReg.vc" onsubmit="var rtn = formSubmitObj.submit(this); if(!rtn){ submitUtil.enable(); } return rtn;">
			<input type="hidden" name="mbrSn" value="${result.info.mbrSn}">
			<input type="hidden" name="mbrEml" title="이메일" value="${result.info.mbrEml}">
			<input type="hidden" name="genderCd" title="성별" value="">
			<input type="hidden" name="mbrBday" title="생년월일" value="">
			<input type="hidden" name="smsYn" value="${result2.smsYn}">
			<input type="hidden" name="emlYn" value="${result2.smsYn}">
			<input type="hidden" name="certYn" value="N">
			<input type="hidden" name="certMet" value="">
			<input type="hidden" name="ci" value="">
			<input type="hidden" name="di" value="">
				<div class="join">
					<h4 class="cont_tit02"><span>Step 02</span>회원정보입력</h4>
					<div class="tb_head">
						개인정보 확인
					</div>
					<div class="table-type01">
						<table>
							<colgroup>
								<col style="width: 200px;">
								<col>
							</colgroup>
							<tbody>
								<tr class="name">
									<th>성명 <span class="point_o">*</span></th>
									<td>
										<input type="text" id="mbrNm" name="mbrNm" maxlength="50" title="성명" placeholder="성명을 입력해주세요" />
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
										<div class="phone">
											<input type="hidden" name="mbrTn" title="전화번호" readonly="readonly" />
											<select name="mbrTn1" style="width:130px;" class="gray">
												<option value="">국번선택</option>
											</select>
											<em>-</em><input type="text" name="mbrTn2" class="numOnly" maxlength="4" title="전화번호" oninput="maxLengthCheck(this)"/>
											<em>-</em><input type="text" name="mbrTn3" class="numOnly" maxlength="4" title="전화번호" oninput="maxLengthCheck(this)"/>
										</div>
									</td>
								</tr>
								<tr>
									<th>휴대폰번호 <span class="point_o">*</span></th>
									<td>
										<input type="hidden" name="mbrHp" title="휴대폰번호" class="numOnly" readonly="readonly" />
										<span id="checkCertOk">본인확인 완료</span>
										<a href="#" id="btnCheckCert" class="btn02 btn_pp" style="width:200px;"><span>본인확인</span></a>
									</td>
								</tr>
								<tr>
									<th>이메일 <span class="point_o">*</span></th>
									<td> 
										<div class="mail">
											<input type="text" id="mbrEml1" name="mbrEml1" maxlength="30" title="이메일" oninput="maxLengthCheck(this)"/>
											<em>@</em>
											<input type="text" id="mbrEml2" name="mbrEml2" maxlength="30" title="이메일" oninput="maxLengthCheck(this)"/>
											<select name="domain"  class="gray">
					                           	<option value="" >직접입력</option>
						                       	<option value="naver.com" >naver.com</option>
						                       	<option value="daum.net" >daum.net</option>
						                       	<option value="hanmail.net" >hanmail.net</option>
						                       	<option value="gmail.com" >gmail.com</option>
					                       </select>
										</div>
									</td>
								</tr>
								<tr>
									<th>주소 <span class="point_o">*</span></th>
									<td>
										<div id="zipcodeWrap" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
											<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
										</div>
										<div class="add">
											<div>
												<input type="text" id="zipCd" name="zipCd" maxlength="8" style="width:170px;" title="우편번호" placeholder="우편번호" value="" readonly="readonly"/>
												<a href="#" id="btnZipCode" class="btn02 btn_pp add_search"><span>우편번호검색</span></a>
											</div>
											<div>
												<input type="text" id="adrSbc1" name="adrSbc1" style="width:80%;" title="주소1" value="" readonly="readonly" />
											</div>
											<div>
												<input type="text" id="adrSbc2" name="adrSbc2" class="gray" maxlength="100" style="width:80%;" title="상세주소" placeholder="상세주소를 입력해주세요"/>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap">
						<a href="#" class="btn btn_pp submit" style="width: 330px;"><span>등록</span></a>
						<a href="/index.vc" class="btn btn_line" style="width: 330px;"><span>취소</span></a>
					</div>
				</div>
			</form>
		</div>						
	</div>		
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	<c:if test="${not empty sessionScope.snsLogin}">
		var mbrEml = $('input[name=mbrEml]').val().split('@');
		$('input[name=mbrEml1]').val(mbrEml[0]);
		$('input[name=mbrEml2]').val(mbrEml[1]);
	</c:if>	

    $('select[name=domain]').on('change', function(e){
	    if($(this).val() != ''){
	        $('input[name=mbrEml2]').val($(this).val()).prop('readonly', true);
	    }else{
	        $('input[name=mbrEml2]').val('').prop('readonly', false);
	    }
	});
    
    $('select[name="mbrTn1"]').ready(function(){
        comCodeUtil.getCodeNPrint('COMC', 'mbrTn1', 'select');
    });
	
});


$(function () {
	$('a#btnZipCode, input[name=zipCd]').on({
        'click' : function(event){
            event.preventDefault();  
            execDaumPostcode();
        },
        'focus' : function(event){
            event.preventDefault();  
            execDaumPostcode();
        }
    });
	
	//본인확인
	$('a#btnCheckCert, input[name=mbrHp]').on({
        'click' : function(event){
            event.preventDefault();  
            userCertObj.init();
        }
    });
	
});

/**
 * 본인확인
 */
var KMCIS_window;
var userCertObj = {
    init : function(){
	    var certUrl = '/api/kmcis/init.vc';
    	KMCIS_window = windowUtil.open(certUrl, "KMCISWindow", 450, 570, 0);
    },
    result : function(bProcess, errorMsg, certYn, phoneCorp, name, gender, birthDay, phoneNo, ci, di){
    	if(bProcess){
    		if(certYn == 'N'){
    			alert('본인인증 실패');
    		}else if(certYn == 'F'){
    			alert('본인인증 오류');
    		}else{
    			console.log(name + ' : ' + gender + ' : ' + birthDay + ' : ' + phoneNo);

    			document.forms.mainForm.certYn.value = 'Y';
    			document.forms.mainForm.certMet.value = phoneCorp;
    			document.forms.mainForm.genderCd.value = gender;
    			document.forms.mainForm.mbrBday.value = birthDay;
    			document.forms.mainForm.mbrHp.value = phoneNo;
    			document.forms.mainForm.ci.value = ci;
    			document.forms.mainForm.di.value = di;
    			
    			$('#checkCertOk').show();
    			$('#btnCheckCert').hide();
    		}
    	}else{
    		alert(errorMsg);
    	}
    	
    	try{
	    	if(KMCIS_window != null){
	    		KMCIS_window.close();
	    	}
    	}catch(e){
    		//ignore
    	}
    }
};

//우편번호 찾기 찾기 화면을 넣을 element
var zipcodeWrap = document.getElementById('zipcodeWrap');
function closeDaumPostcode() {
    zipcodeWrap.style.display = 'none';
}

function initLayerPosition(){
    var width = 350; //우편번호서비스가 들어갈 element의 width
    var height = 400; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 3; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    zipcodeWrap.style.width = width + 'px';
    zipcodeWrap.style.height = height + 'px';
    zipcodeWrap.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    zipcodeWrap.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    zipcodeWrap.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

function execDaumPostcode() {
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                addr += extraAddr;
            }

            document.forms.mainForm.zipCd.value = data.zonecode;
            document.forms.mainForm.adrSbc1.value = addr;
            document.forms.mainForm.adrSbc2.focus();
            
            zipcodeWrap.style.display = 'none';

            document.body.scrollTop = currentScroll;
        },
        onresize : function(size) {
	        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            zipcodeWrap.style.height = '400px';
        },
        width : '100%',
        height : '400px',
        maxSuggestItems : 5
    }).embed(zipcodeWrap);

    // iframe을 넣은 element를 보이게 한다.
    zipcodeWrap.style.display = 'block';
    
 	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
    initLayerPosition();
}

var formSubmitObj = {
    submit : function(form){
    	
         if(!submitUtil.isEmpty(form.mbrNm)){
             return false;
         }
         
         if(!submitUtil.isNull(form.mbrTn1)){
         	 if(!submitUtil.isEmpty(form.mbrTn2)){
         		 return false;
         	 }else if(!submitUtil.isEmpty(form.mbrTn3)){
         		 return false;
         	 }else{
				 form.mbrTn.value = form.mbrTn1.value + '-' + form.mbrTn2.value + '-' + form.mbrTn3.value;
         	 }
         }
            
         if(submitUtil.isNull(form.mbrHp)){
        	 submitUtil.alertNfocus(form.mbrHp, '휴대폰 본인인증이 필요합니다.');
        	 return false;
         }
         
         if(!submitUtil.isEmpty(form.mbrEml1)){
        	 return false;
         }else{
         	 if(!submitUtil.isEmpty(form.mbrEml2, '메일 도메인 등록')){
         		 return false;
         	 }else{
         		 form.mbrEml.value = form.mbrEml1.value + '@' + form.mbrEml2.value;
         		 
         		if(!submitUtil.isEmail(form.mbrEml, '메일 형식 확인')){
                   return false;
               	}
         	 }
         }
         
         if(!submitUtil.isEmpty(form.zipCd)){
             return false;
         }
            
         if(!submitUtil.isEmpty(form.adrSbc1)){
             return false;
         }
        
        ajaxUtil.postDisableAsync($(form).attr('action'), $(form).serialize(), formSubmitObj.result);
        
        return false;
    },
	result : function(json){
        try{
            json = JSON.parse(json);
        }catch(e){}
        
        if(json.bindingStatus == undefined && json.result != undefined && json.result.status){
           location.replace('/certification/complete.vc');
        }else{
        	if(json.result.check != "Y"){
				alert('입력하신 정보로 가입된 아이디가 있습니다.\n계정 정보를 확인하여 주세요.');
			}else{
				ajaxUtil.error(json);	
			}
        }
    }
};
</script>
