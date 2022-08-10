<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tag" uri="http://www.jksoft.com/taglib/tag" %>
<%@ taglib prefix="function" uri="http://www.jksoft.com/taglib/function" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- 
    JSP Name : noticeList.jsp
    Description : 상품목록
--%>
<div class="sec_top">
	<h3 class="sec_tit">상품 목록</h3>
	<ul class="top_tab">
		<li><a href="#">상품관리</a></li>
	</ul>
</div>
<div class="sec_cont">
	<h4 class="cont_tit">조회조건</h4>
	<div class="r_search_box">
		<form name="searchForm" method="get" onsubmit="var rtn = formSubmitObj.submit(this); if(!rtn){ submitUtil.enable(); } return rtn;">
			<table class="r_search_table">
				<colgroup>
					<col style="width:150px">
					<col style="">
					<col style="width:150px">
					<col style="">
				</colgroup>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td colspan="3">
					   		<select id="lgrpCd" name="lgrpCd">
					   			<option value="">전체</option>
		                        <option value="VCL">바이러스 클린 랩</option>
		                        <option value="ACC">엑세서리</option>
		                    </select>
						</td>
					</tr>
					<tr>
						<th>검색어</th>
						<td colspan="3">
							<input type="hidden" id="searchType" name="searchType" value="0"/>
							<input id="searchKey" name="searchKey" type="text" title="상세검색입력" style="width:450px;" maxlength="100" minlength="2"/>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn_right_gorup">
				<button type="submit" class="btn btn_red">조회</button>
				<button type="reset" class="btn btn_gray">초기화</button>
			</div>
		</form>
	</div>
	
	<div class="content-body">
		<div class="table_tit">
			<div class="table_left_title">
				<span>총<strong class="totCnt" style="font-weight: 700;"> <fmt:formatNumber value="${result.searchInfo.totalRow}" type="number"/></strong>건 조회</span>
			</div>
		</div>
  
 		<form name="subForm" method="post" action="${contextPath}/${requestUri}/delete.vc" onsubmit="var rtn = formSubmitObj.delSubmit(this); if(!rtn){ submitUtil.enable(); } return rtn;">
   			<table class="cont_table" style="table-layout:fixed">
   				<colgroup>
					<col style="width:100px">
					<col style="width:150px">
					<col style="width:150px">
					<col style="">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:100px">
					<col style="width:150px">
					<col style="width:100px">
					<col style="width:180px">
				</colgroup>
		        <thead>
		            <tr>
		                <th><input type="checkbox" class="checkbox-selectAll" id="checkbox-selectAll">번호</th>
		                <th>상품이미지</th>
		                <th>카테고리</th>
		                <th>상품명</th>
		                <th>공급가격</th>
		                <th>판매가격</th>
		                <th>재고</th>
		                <th>품절여부</th>
		                <th>기간</th>
		                <th>등록자</th>
		                <th>관리</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:choose>
		                <c:when test="${empty result.list}">
		                    <tr>
		                        <td colspan="11" class="nodata">등록된 게시물이 없습니다.</td>
		                    </tr>
		                </c:when>
		                <c:otherwise>
		                    <c:forEach items="${result.list}" var="data" varStatus="i">
		                        <tr>
		                            <td>
		                            	<input type="checkbox" id="sn_${data.prdSn}" name="delSeq" class="check2 checkbox-select" value="${data.prdSn}" title="선택"> ${function:rowNumber(result.searchInfo, i.count)}
		                            </td>
		                            <td class="con">
		                            	<c:if test="${data.fileSn ne 0 }">
		                            		${function:printImageFileByList(data.fileSn, "PRODUCT", data.filNm, data.filNm)}
		                            	</c:if>
		                           	</td>
		                            <td>
			                            <c:choose>
					                		<c:when test="${data.lgrpCd eq 'VCL'}">바이러스 클린 랩</c:when>
					                		<c:when test="${data.lgrpCd eq 'ACC'}">엑세서리</c:when>
					                	</c:choose>
	                				</td>
		                            <td class="left"><tag:html value="${data.prdTitl}" attr="NQ" /></td>
		                            <td>${data.supplyPrice}</td>
		                            <td>${data.salePrice}</td>
		                            <td>${data.quantity}</td>
		                            <td><input type="checkbox" data-sn="${data.prdSn}" class="check2 upSellYn" ${data.sellYn eq 'Y' ? '' : 'checked="checked"'} value="${data.sellYn}"> 품절</td>
		                            <td>${data.expsRgstDtm}<br/> ~ ${data.expsFnhDtm}</td>
		                            <td>${data.rgstId}</td>
		                            <td class="table_btn">
		                            	<a class="btn btn_red" href="${contextPath}/${requestUri}/modify.vc?prdSn=${data.prdSn}${function:searchQuery(result.searchInfo)}">수정</a>
										<a href="${contextPath}/${requestUri}/delete.vc" class="btn btn_gray btnRowDelete"  data-sn="${data.prdSn}">삭제</a>
									</td>
		                        </tr>
		                    </c:forEach>
		                </c:otherwise>
		            </c:choose>
		        </tbody>
		    </table>
		    
		    <div class="btn_center_gorup clearfix">
				<div class="left">
					<button type="button" class="btn btn_gray btnInfoCancle" onclick="">선택취소</button>
					<button type="submit" class="btn btn_gray" onclick="">선택삭제</button>
				</div>
				<div class="right">
					<button type="button" onclick="location.href='${contextPath}/${requestUri}/register.vc';" class="btn btn_bk">등록</button>
				</div>
			</div>
	    </form>
		    
	    <div class="paging_wrap">
	    	<tag:paging url="${contextPath}/${requestUri}/list.vc?${function:searchQueryPaging(result.searchInfo)}" totalRow="${result.searchInfo.totalRow}" page="${result.searchInfo.page}" rowLimit="${result.searchInfo.rowLimit}" />
	    </div>
    </div>
</div>

<script type="text/javascript">
$(function () {
    $('form[name=searchForm]').ready(function(){
    	$('select[name=lgrpCd] option[value="${result.searchInfo.lgrpCd}"]').prop('selected', true);
//     	$('select[name=searchType] option[value="${result.searchInfo.searchType}"]').prop('selected', true);
        $('input[name=searchKey]').val('${result.searchInfo.searchKey}');  
    });
    
    $('input.upSellYn').on({
        'change' : function(event){
            var yn = $(this).prop('checked') ? 'N' : 'Y';
            ajaxUtil.postDisableAsync('${contextPath}/${requestUri}/updateSellYn.vc', { 'prdSn' : $(this).data('sn'), 'sellYn' : yn }, function(result){
            	debugger;
            });
        }
    });
});

var formSubmitObj = {
    submit : function(form){
        if(!submitUtil.isNull(form.searchKey)){
            if(!submitUtil.isMinLength(form.searchKey)){
                return false;    
            }        
        }  
        
        return true;
    },
    submitDel : function(object){
		var msg = '게시물을 삭제 하시겠습니까?'
	    if(confirm(msg)){
	        var data = { prdSn : $(object).data('sn') };
	        ajaxUtil.postDisableAsync($(object).attr('href'), data, formSubmitObj.delResult);    
	    }
	},
	delSubmit : function(form){
        if($('input.checkbox-select:checked').length > 0){
        	if (confirm('선택한 게시물을 삭제 하시겠습니까?')) {
            	ajaxUtil.postDisableAsync(form.action, $(form).serialize(), formSubmitObj.delResult);
        	}
        }else{
            alert('1개이상 선택해 주세요.');
        }
        
        return false;
    },
    delResult : function(json){
        try{
            json = JSON.parse(json);
        }catch(e){}
        
        if(json.result != undefined && json.result.status){
            location.reload(true);
        }else{
            ajaxUtil.error(json);
        }
    }
};
</script>