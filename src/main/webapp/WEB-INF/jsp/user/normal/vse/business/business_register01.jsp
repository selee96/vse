
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tag" uri="http://www.jksoft.com/taglib/tag" %>
<%@ taglib prefix="function" uri="http://www.jksoft.com/taglib/function" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<%--
    Description : 사업설명회 > 첨가첩수 > 창업상담
--%>
<!-- 
		<h3 class="tit mb60">
			보이스캐디 VSE,<br />
			성공적 창업을 확신합니다.
		</h3>
		<ul class="tab_type_01 tab_btn x_2">
			<li class="active"><a href="/business/consult.vse">창업상담</a></li>
			<li><a href="/business/presentation.vse">사업설명회</a></li>
		</ul>
-->
		<div class="table_type_01 mt40">
			<form name="mainForm" method="post" action="/apply/register.vse" enctype="multipart/form-data" onsubmit="var rtn = formSubmitObj.submit(this); if(!rtn){ submitUtil.enable(); } return rtn;">
				<input type="hidden" name="lgrpCd" value="BUSINESS" />
				<h4 class="sub_tit">
	     			전화상담 : 1544 - 4667
				</h4>
				<p class="sub_txt">평일 09 : 00 ~ 18 : 00</p>
				<h4 class="sub_tit mt20">
	     			창업상담 신청
				</h4>
				<table class="mt15">
					<colgroup>
						<col style="width:180px;" />
						<col style="width:auto"/>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="rgstName">이름 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_1">
									<input type="text" id="rgstName" name="rgstName" maxlength="100" title="이름" value="" />
								</p>
							</td>
						</tr>
						<tr>
							<th><label for="rgstHp">연락처 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_1">
									<input type="text" id="rgstHp" name="rgstHp" class="numOnly" maxlength="11" title="연락처" value="" />
								</p>
							</td>
						</tr>
						<tr>
							<th><label for=item1>직업 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_1">
									<select name="item1" class="select_type_01" id="item1" title="직업">
										<option value="">선택해주세요.</option>
										<option value="프로">프로</option>
										<option value="일반인">일반인</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th><label for="dist1">창업지역 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_2">
									<select name="dist1" class="select_type_01" id="dist1" title="창업지역">
										<option value="">시/도 선택</option>
									</select>
									<select name="dist2" class="select_type_01" title="창업지역">
										<option value="">시/군/구 선택</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th><label for="item2">인지경로 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_1">
									<select name="blcSbc1" class="select_type_01" id="item2" title="인지경로">
										<option value="">선택해주세요.</option>
										<option value="TV광고">TV광고</option>
										<option value="인터넷 광고">인터넷 광고</option>
										<option value="인터넷 검색">인터넷 검색</option>
										<option value="우편">우편</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th><label for="CounselingReason">창업사유 <span class="color_red">*</span></label></th>
							<td class="pr0">
								<p class="x_1">
									<select name="blcSbc2" class="select_type_01" id="CounselingReason">
										<option value="">선택해주세요.</option>
										<option value="신규창업(투잡)">신규창업(투잡)</option>
										<option value="기존 타석 스크린 교체">기존 타석 스크린 교체</option>
										<option value="은퇴 후 창업">은퇴 후 창업</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th><label for="CounselingHope">희망타석</label></th>
							<td class="pr0">
								<p class="x_1">
									<select name="item3"  class="select_type_01" id="CounselingHope">
										<option value="">선택해주세요.</option>
										<option value="1-4개">1-4개</option>
										<option value="5개-15개">5개-15개</option>
										<option value="16개 이상">16개 이상</option>
									</select>
								</p>
							</td>
						</tr>
						
					</tbody>
				
				</table>
				<div class="privacy_wrap flex-center mt10">
					<p class="mb5"><em class="mr10">개인정보 수집 안내</em><span class="color_red sub_txt_s">* 아래 약관을 읽은 후 이용가능합니다.</span></p>
					<div id="CounselingprivacyScroll" class="privacy_wrap_info " style="resize:none;">
						<%@ include file="/WEB-INF/jsp/user/normal/vse/common/include/inc_privateTextarea.jsp" %>
					</div>
							
				</div>
				<div class="form_box ckinfo_wrap mt15" id="CounselingInfoRCkWarp">
					<label for="CounselingInfoRCk" class="ck_type_01">
						<input type="checkbox" id="CounselingInfoRCk" name="agreePersonal" class=""/><span class="mr10"></span><b class="color_red">[필수]</b> 개인정보 수집안내 동의 및 안내
					</label>
				</div>
				<div class="btn_wrap mt60">
					<a href="#" class="btn wd_250 submit">신청하기</a>
				</div>
			</form>
		</div>
<!-- 		
	</div>
</div>
 -->
<script>
$(function(){
	//$('#header .gnb > li').eq(3).addClass('active');
	
	$('form[name=mainForm]').ready(function(){
		
    });
	
	$('select[name=dist1]').ready(function(){
		comCodeUtil.getCodeNPrint('SIDO', 'dist1', 'select');
		$('.select_type_01').selectric('refresh'); 
	}).on({
        change : function() {
        	$('select[name=dist2]').find("option").eq(0).siblings().remove();
        	comCodeUtil.getCodeNPrint($('select[name=dist1] option:selected').val(), 'dist2', 'select');
        	$('.select_type_01').selectric('refresh'); 
        }
    });
});


var formSubmitObj = {
    submit : function(form){
        
    	if(!$("input[name=agreePersonal]").is(":checked")){
			alert('개인정보 수집 동의 해주세요.');
			return false;
		}
    	
        //제목
        if(!submitUtil.isEmpty(form.rgstName)){
            return false;
        }
        
        if(!submitUtil.isEmpty(form.rgstHp)){
            return false;
        }
        
        if(!submitUtil.isEmpty(form.dist1)){
            return false;
        }
        
        if(!submitUtil.isEmpty(form.item1)){
            return false;
        }
        
        if(!submitUtil.isEmpty(form.blcSbc1)){
            return false;
        }
        
        if(!submitUtil.isEmpty(form.blcSbc2)){
            return false;
        }
        
        ajaxUtil.formSubmit($(form), formSubmitObj.result);
        
        return false;
    },
    result : function(json){
        try{
            json = JSON.parse(json);
        }catch(e){}
        
        if(json.bindingStatus == undefined && json.result != undefined && json.result.uploadInfo.status ){
            alert('감사합니다. 신청이 완료되었습니다. 담당영업팀에서 확인 후 연락 드리겠습니다.');
        	location.replace('/index.vse');
        }else{
            ajaxUtil.error(json);
        }
    }
};
</script>
