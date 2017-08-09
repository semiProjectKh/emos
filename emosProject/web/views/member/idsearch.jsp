<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member"%>

<%
	Member member = (Member) request.getAttribute("idsearch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
td {
	font-family: "돋음";
	color: #666666;
	font-size: 9pt;
	line-height: 16px;
}

img {
	border: 0;
}
</style>
<title>아이디 찾기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0"
		style="margin-top: 8px">
		<tr>
			<td>
				<% if (member == null) {%>
				<table width="429px;" cellpadding="0" cellspacing="0"
					border="0" align="center">
					<Tr>
						<td><img src="/emos/image/id_password/idfindlogo.jpg"></td>
					</tr>
					<tr>
						<td style="border: 2px solid #e5e5e5;">
							<Table width="374" cellpadding="0" cellspacing="0" border="0"
								align="center">
								<tr>
									<Td height="13px;"></td>
								</tr>

								<tr>
									<td align="center">검색하신 정보와 일치하는 내용의 회원이 없습니다.<br>다시
										한번확인하여 주시기 바랍니다.
									</td>
								</tr>
								<tr>
									<td align="center" height=73><a
										href="/emos/views/member/idfind.html"
										class="w3-button w3-white w3-border">확인</a></td>
								</tr>


							</table> 
							<%} else { %>
							<table  width="429px;" cellpadding="0" cellspacing="0"
								border="0" align="center">
								<Tr>
									<td><img src="/emos/image/id_password/idfindlogo.jpg"></td>
								</tr>
								<tr>
									<td style="border: 2px solid #e5e5e5;">
										<Table width="374" cellpadding="0" cellspacing="0" border="0"
											align="center">
											<tr>
												<Td height="13px;"></td>
											</tr>

											<tr>
												<td align="center">회원님의 아이디는 <%= member.getUserId() %> 입니다.
												</td>
											</tr>
											<tr>
												<td align="center" height=73><a
													href="#"
													class="w3-button w3-white w3-border" onclick="window.close()">확인</a></td>
											</tr>


										</table>
										<%} %>
									</td>
								</tr>
								<tr>
									<td align="right"><img id="ment"
										src="/member/images/id_ment.jpg"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
</body>
</html>
