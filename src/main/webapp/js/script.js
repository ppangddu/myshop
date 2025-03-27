function zipCheck() {
	let url = "zipcheck.jsp?check=y";
	window.open(url, "post", // window.open으로 하면 modal아니고 modalless임
		"toolbar=no,width=500,height=400,top=200,left=100,status=yes,scrollbars=yes,menubar=no");
}

function idCheck() {
	if (regForm.id.value === "") {
		alert("아이디를 입력하세요.");
		regForm.id.focus();
	} else {
		const url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "toolbar=no,width=300,height=150,top=200,left=100");
	}
}

function inputCheck() {
	// 입력 자료 검사 후 서버로 전송
	if (regForm.id.value === "") {
		alert("id를 입력하세요.");
		regForm.id.focus();
		return;
	}
	// 이하 생략 ...
	regForm.submit();
	
}

//회원 로그인 관련
function funcLogin() {
	if (loginForm.id.value === "") {
		alert("회원 id 입력");
		loginForm.id.focus();
		
	} else if(loginForm.passwd.value === "") {
		alert("회원 비밀번호 입력");
		loginForm.passwd.focus();
	} else {
		loginForm.action = "loginproc.jsp"; // 지금 login.jsp에 action이나 method가 없는데 여기에서 설정 가능하다.
		loginForm.method = "post";
		loginForm.submit();
	}
}

function funcNewMember() {
	location.href = "register.jsp";
}

// 쇼핑몰 고객이 로그인 후 자신의 정보 수정
function memberUpdate() {
	// 입력 자료 오류 검사 ...
	document.updateForm.submit();
}

function memberUpdateCancel() {
	location.href="../guest/guest_index.jsp";
}

function memberDelete() {
	alert("정말 탈퇴하시겠습니까?");
}


// 관리자 관련
function funcAdminLogin() {
	if (adminLoginForm.admin_id.value === "") {
		alert("관리자 아이디를 입력하세요.");
		adminLoginForm.admin_id.focus();
		return;
	}
	
	if (adminLoginForm.admin_passwd.value === "") {
			alert("관리자 password를 입력하세요.");
			adminLoginForm.passwd.focus();
			return;
		}
		
	adminLoginForm.submit();
}

function funcAdminHome() {
	location.href="../guest/guest_index.jsp";
}

function memberUpdate(id) { // 관리자 전용 전체 회원 수정용
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
	
}

function memberUpdateAdmin() {
	document.updateFormAdmin.submit();
}


function memberUpdateCancelAdmin() {
	location.href="membermanager.jsp";
}


function productDetail(no) { //관리자 상품 처리
	document.detailFrm.no.value = no;
	document.detailFrm.submit();	
}

function productUpdate(no) {
	document.updateFrm.no.value = no; //hidden이 no
	document.updateFrm.submit();
	
}

function productDelete(no) {
	if (confirm("정말 삭제할까요?")) {
		document.delFrm.no.value = no;	
		document.delFrm.submit();	
	}
}


//고객 : 상품 
function productDetailGuest(no) {
	document.detailFrm.no.value = no;	
	document.detailFrm.submit();	
}

//관리자가 주문 처리
function orderDetail(no) {
	document.detailFrm.no.value = no;	
	document.detailFrm.submit();
}

function orderUpdate(form) {
	document.detailFrm.flag.value="update";
	form.submit();
}

function orderDelete(form) {
	document.detailFrm.flag.value="delete";
	form.submit();
}