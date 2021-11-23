//Cordova Call Method
$(document).ready(function() {
	document.addEventListener('deviceready', onDeviceReady, false);
	
	function onDeviceReady() {}
});

//카메라
$('#MobileCamera').click(function() {
	navigator.camera.getPicture(onSuccess, onFail, {
		quality: 100,
		destinationType: Camera.DestinationType.DATA_URL,
		sourceType : Camera.PictureSourceType.CAMERA,
		encodingType: Camera.EncodingType.JPEG,
		popoverOptions: CameraPopoverOptions,
		saveToPhotoAlbum: false
	});
});

//갤러리
$('#MobileGallery').click(function() {
	navigator.camera.getPicture(onSuccess, onFail, {
		quality: 100,
		destinationType: Camera.DestinationType.DATA_URL,
		sourceType : Camera.PictureSourceType.PHOTOLIBRARY,
		allowEdit : true,
		encodingType: Camera.EncodingType.JPEG,
		popoverOptions: CameraPopoverOptions,
		saveToPhotoAlbum: false
	});
});

//Cordova Camera Image Select Success
function onSuccess(imageData) {
	$(".select_img img").attr("src", "data:image/jpeg;base64," + imageData).width(500);
	$("#file").val("data:image/jpeg;base64," + imageData);
}
//Cordova Camera Image Select Failed
function onFail(message) {}

//PC 첨부 파일 선택
$("#imgFile").change(function() {

	/* if (this.files && this.files[0].size > (10 * 1024 * 1024)) {
		alert("파일 크기는 10mb로 제한됩니다.");
		this.files.value = null;
	} */
	
	if(this.files && this.files[0]) {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img img").attr("src", data.target.result).width(500);
		}
		reader.readAsDataURL(this.files[0]);
	}
});

/* 게시글 등록, 수정 PC 파일 첨부 Custom */
$(".custom-file-input").on("change", function() {
	$(this).siblings(".custom-file-label").addClass("selected").html($(this).val().split("\\").pop());
});