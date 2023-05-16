<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://uicdn.toast.com/editor/latest/i18n/ko-kr.min.js"></script>
<link rel="stylesheet" href="https://nhn.github.io/tui.editor/latest/dist/cdn/theme/toastui-editor-dark.css">
<script>

	const Editor = toastui.Editor;

	const editor = new Editor({
		  el: document.querySelector('#editor'),
		  height: 'auto',
		  initialEditType: 'markdown',
		  previewStyle: 'vertical',
		  placeholder: "내용을 입력해주세요",
		  theme: 'dark',
		  language: "ko-KR"
		});

	function getEditorContents(form) {
		form.body.value = editor.getHTML();
	}
	
</script>
