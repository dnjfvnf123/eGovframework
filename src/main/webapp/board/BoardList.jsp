<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Head정보 로딩  시작 -->
<jsp:include page='${pageContext.request.contextPath}/sym/mnu/mpm/EgovMainMenuHead.do' flush="true">
	<jsp:param name="pageType" value="sub"/>
	<jsp:param name="sys" value="on"/>
</jsp:include>
<!-- Head정보 로딩  종료 -->

<!-- 본문 시작 -->
<main class="container">
	<div class="row">
		<!-- 메뉴로딩  시작 -->
		<jsp:include page='${pageContext.request.contextPath}/sym/mnu/mpm/EgovMainMenuLeft.do'>
			<jsp:param name="vStartP" value ="${menuNo}"/>
		</jsp:include>
		<!-- 메뉴로딩  종료 -->
		
		<div class="col-xs-10 text-xs-right">
			<!-- 메뉴명 시작 -->
			<h3 class="page-header clearfix mt-3">
				<div class="float-xs-left"><spring:message code="comSecRam.title.authorManage"/></div>
				<div class="float-xs-right"></div>
			</h3>
			<!-- 메뉴명 종료 -->
			
			<!-- article 시작 -->
			<article class="eb-bbs eb-bbs-list">
				<form:form class="form-inline" name="boardVO" action="${pageContext.request.contextPath}/sec/ram/selectAuthorManageListPageVw.do" method="post">
					<input type="hidden" name="searchCondition" />
					
				<!-- 본문 검색조건 시작 -->
				<div class="eb-bbs-header">
					<div class="row">
						<div class="col-xs-4 text-xs-left">
							<p class="form-control-static mb-0">
								<i class="fa fa-caret-right" aria-hidden="true"></i> <spring:message code="common.list.total"/> <span class="text-primary"><c:out value="${paginationInfo.totalRecordCount}" /></span> <spring:message code="common.list.count"/>
							</p>
						</div>
						<div class="col-xs-8 text-xs-right">
							<div class="form-group">

								<label for="" class="mr-1">
									<spring:message code="comSecRam.search.label.authorNm"/>
								</label>
							</div>
							<button type="button" class="btn btn-secondary" onclick="javascript:fnAuthorListLinkPage('1')"><spring:message code="common.button.search"/></button>
						</div><!-- /.col-xs-8  -->
					</div><!-- /.row -->
				</div>
				<!-- 본문 검색조건 종료 -->

				<!-- 본문 Content 시작 -->				
				<table class="table table-sm table-bordered eb-table">
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<thead class="thead-default">
						<tr>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
							<th><spring:message code="comSecRam.authorList.authorId"/></th>
						</tr>
					</thead>
					<tbody>
					<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
					<c:if test="${fn:length(wavusLolRankList) == 0}">
						<tr>
							<td class="lt_text3" colspan="8">
								<spring:message code="common.nodata.msg" />
							</td>
						</tr>
					</c:if>			
				
					<c:forEach var="wavusLolRank" items="${wavusLolRankList}" varStatus="status">
						<tr class="text-xs-center">
							<td><c:out value="${board.id}" /></td>
							<td><c:out value="${board.title}" /></td>
							<td><c:out value="${board.writer}" /></td>
							<td><c:out value="${board.viewCnt}" /></td>
							<td><c:out value="${board.createdDate}" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- 본문 Content 종료 -->
				
				<!-- 본문 footer 시작 -->
				<nav class="row eb-bbs-footer">
					<div class="col-xs-2 text-xs-left">
						<button type="button" class="btn btn-primary" onclick="javascript:fnAuthorDelete()"><spring:message code="common.button.delete"/></button>
					</div>
					<div class="col-xs-8 text-xs-center">
						<div class="paging">
						<c:if test="${!empty wavusLolGameRankVO.pageIndex }">
							<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fnAuthorListLinkPage" />
						</c:if>
						</div>
					</div>
					<div class="col-xs-2 text-xs-right">
						<button type="button" class="btn btn-primary" onclick="javascript:fnLolRankInsertVw()"><spring:message code="common.button.create"/></button>
					</div>
				</nav>    
				<!-- 본문 footer 종료 -->
				
	      		</form:form>
			</article>
			<!-- article 종료 -->
		</div>
	</div><!-- /.row -->
</main>   
<!-- 본문 종료 -->


<!-- Bottom 시작 -->
<jsp:include page='${pageContext.request.contextPath}/sym/mnu/mpm/mainBottom.do'></jsp:include>
<!-- Bottom 종료 -->

	<script type="text/javaScript" language="javascript" defer="defer">
	
		/* ********************************************************
	 	*  체크박스 전체선택 처리 함수
	 	******************************************************** */
		function fnAuthorCheckAll() {
			var checkField = document.listForm.delYn;
			if (document.listForm.checkAll.checked) {
				if (checkField) {
					if (checkField.length > 1) {
						for (var i = 0; i < checkField.length; i++) {
							checkField[i].checked = true;
						}
					} else {
						checkField.checked = true;
					}
				}
			} else {
				if (checkField) {
					if (checkField.length > 1) {
						for (var j = 0; j < checkField.length; j++) {
							checkField[j].checked = false;
						}
					} else {
						checkField.checked = false;
					}
				}
			}
		}

		/* ********************************************************
		 * 체크박스 부분선택 처리 함수
		 ******************************************************** */
		function fnAuthorManageChecked() {

			var checkField = document.listForm.delYn;
			var checkId = document.listForm.checkId;
			var returnValue = "";

			var returnBoolean = false;
			var checkCount = 0;

			if (checkField) {
				if (checkField.length > 1) {
					for (var i = 0; i < checkField.length; i++) {
						if (checkField[i].checked) {
							checkField[i].value = checkId[i].value;
							if (returnValue == "")
								returnValue = checkField[i].value;
							else
								returnValue = returnValue + ";" + checkField[i].value;
							checkCount++;
						}
					}
					if (checkCount > 0)
						returnBoolean = true;
					else {
						fn_modalAlert("<spring:message code='comSecRam.auth.notExist'/>");

						returnBoolean = false;
					}
				} else {
					if (document.listForm.delYn.checked == false) {
						fn_modalAlert("<spring:message code='comSecRam.auth.notExist'/>");
						returnBoolean = false;
					} else {
						returnValue = checkId.value;
						returnBoolean = true;
					}
				}
			} else {
				fn_modalAlert("<spring:message code='common.select.notExist.msg'/>");
			}

			document.listForm.authorCodes.value = returnValue;
			
			return returnBoolean;
		}

		/* ********************************************************
		 * 페이징 처리 함수
		 ******************************************************** */
		function fnAuthorListLinkPage(pageNo) {
			document.listForm.searchCondition.value = "1";
			document.listForm.pageIndex.value = pageNo;
			document.listForm.action = "<c:url value='/sec/ram/selectAuthorManageListPageVw.do'/>";
			document.listForm.submit();
		}
		/* ********************************************************
		 * 상세화면 처리 함수
		 ******************************************************** */
		function fnAuthorDetailVw(author) {
			document.listForm.authorCode.value = author;
			document.listForm.action = "<c:url value='/sec/ram/selectAuthorManageVw.do'/>";
			document.listForm.submit();
		}

		/* ********************************************************
		 * 등록 처리 함수
		 ******************************************************** */
		function fnLolRankInsertVw() {
			location.replace("<c:url value='/sec/yjy/insertLolRankVw.do'/>");
		}


		/* ********************************************************
		 * 권한롤 상세화면 처리 함수
		 ******************************************************** */
		function fnAuthorRoleDetailVw(author) {
			document.listForm.searchKeyword.value = author;
			document.listForm.action = "<c:url value='/sec/ram/selectAuthorRoleManageListPageVw.do'/>";
			document.listForm.submit();
		}

		/* ********************************************************
		 * 엔터키 처리 함수
		 ******************************************************** */
		function fnAuthorProcess() {

			if (event.keyCode == 13) {
				fnAuthorListLinkPage('1');
			}
		}
	</script>

