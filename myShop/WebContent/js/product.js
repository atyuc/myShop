/* 상품페이지 자바스크립트 */

//새창열기
function newWin(urlName) {
	window.open(urlName, "", "width=400, height=500, left=600, top=200");
}

//상품등록 유효성검사
function insSub() {
	var id = document.form1.id;
	var name = document.form1.name;
	var content = document.form1.content;
	var price = document.form1.price;

	//빈칸검사
	if (id.value == null || id.value == "") {
		alert("아이디를 입력해주세요.");
		id.focus();
		return false;
	}
	
	if (name.value == null || name.value == "") {
		alert("상품명을 입력해주세요.");
		name.focus();
		return false;
	}
	
	if (price.value == null || price.value == "") {
		alert("가격을 입력해주세요.");
		price.focus();
		return false;
	}
	
	//길이 검사
	if (id.value.length > 10) {
		alert("아이디는 10자 이내로 입력해주세요.");
		id.focus();
		return false;
	}
	
	if (name.value.length > 10) {
		alert("상품명은 10자 이내로 입력해주세요.");
		name.focus();
		return false;
	}
	
	if (content.value.length > 50) {
		alert("상품설명은 50자 이내로 입력해주세요.");
		content.focus();
		return false;
	}
	
	//숫자 검사
	if (isNaN(price.value)) {
		alert("가격은 숫자만 입력해주세요.");
		price.focus();
		return false;
	}
}

//상품수정시 아이디 입력필수, 설명 또는 가격 입력필수
function upSub() {
	var id = document.form2.id.value;
	var content = document.form2.content.value;
	var price = document.form2.price.value;
	
	if (id == null || id == "") {
		alert("수정하실 상품의 아이디를 입력해주세요.");
		document.form2.id.focus();
		return false;
	}
	
	if ((content == null || content == "") && (price == null || price == "")) {
		alert("수정항목중 하나는 반드시 입력해야합니다.");
		return false;
	}
	
	if (isNaN(price)) {
		alert("가격은 숫자만 입력해주세요.");
		document.form2.price.focus();
		return false;
	}
}