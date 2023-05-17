<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/head.jsp" %>
<script>
	function loginIdDupChk(input) {
		let loginIdDupChk = input.value;
		$.get('loginIdDupChk', {
			loginId : loginIdDupChk
		}, function(data) {
			$('#loginIdMsg').html(data.msg);
		}, 'json');
	}
	
	loginPw = null;
	loginPwChk = null;
	
	function pwChk(input) {
		
		let name = input.getAttribute('name');
		let pwChk = input.value.trim();
		let msg = null;
		
		if (name == 'loginPw') {
			loginPw = pwChk;
			msg = 'loginPwMsg';
		} else {
			loginPwChk = pwChk;
			msg = 'loginPwChkMsg';
		}
		
		if (pwChk.length == 0) {
			$('#' + msg).html("필수 정보입니다");
			return;
		}
		
		if (name == 'loginPw') {
			if (pwChk.length < 5) {
				$('#' + msg).html("5자 이상 입력해주세요");
				return;
			} else {
				$('#' + msg).html("");
				return;
			}
		}
		
		if (loginPw != loginPwChk) {
			$('#loginPwChkMsg').html("비밀번호가 일치하지 않습니다");
		} else {
			$('#loginPwChkMsg').html("비밀번호가 일치합니다");
		}
		
	}
	
	function msgChk(form) {
		let loginIdMsg = $('#loginIdMsg').html().trim();
		let loginPwMsg = $('#loginPwMsg').html().trim();
		let loginPwChkMsg = $('#loginPwChkMsg').html().trim();
		
		if (loginIdMsg != '사용 가능한 아이디입니다') {
			return;
		}
		
		if (loginPwMsg != '') {
			return;
		}
		
		if (loginPwChkMsg != '비밀번호가 일치합니다') {
			return;
		}
		
		form.submit();
	}
</script>
	<section class="mt-8 text-xl"> 	
		<div class="container mx-auto px-3">
			<form action="doJoin" method="POST" onsubmit="msgChk(this); return false;">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="210" />
						</colgroup>
						<tbody>
							<tr>
								<th>로그인 아이디</th>
								<td>
									<input class="input input-bordered w-full max-w-xs" type="text" name="loginId" placeholder="아이디를 입력해주세요" onblur="loginIdDupChk(this);"/>
									<div id="loginIdMsg" class="text-red-400 text-sm mt-2"></div>
								</td>
							</tr>
							<tr>
								<th>로그인 비밀번호</th>
								<td>
									<input class="input input-bordered w-full max-w-xs" type="text" name="loginPw" placeholder="비밀번호를 입력해주세요" onblur="pwChk(this);"/>
									<div id="loginPwMsg" class="text-red-400 text-sm mt-2"></div>
								</td>
							</tr>
							<tr>
								<th>로그인 비밀번호 확인</th>
								<td>
									<input class="input input-bordered w-full max-w-xs" type="text" name="loginPwChk" placeholder="비밀번호 확인을 입력해주세요" onblur="pwChk(this);"/>
									<div id="loginPwChkMsg" class="text-red-400 text-sm mt-2"></div>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="name" placeholder="이름을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="nickname" placeholder="닉네임을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input class="input input-bordered w-full max-w-xs" type="text" name="email" placeholder="이메일을 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn-text-link btn btn-active">회원가입</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns mt-2">
				<button class="btn-text-link btn btn-active" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>