//a链接自动跳转
var a = document.querySelectorAll(".mui-table-view a"); 
 
for(var i=0;i<a.length;i++){
    a[i].addEventListener("tap",function(){
        if(this.href!="" && this.href!="javascript:;"){
            window.location.href = this.href;
        }
    })
}
//更多打开连接
var more = document.querySelectorAll(".more");
for(var i=0;i<more.length;i++){
    more[i].addEventListener("tap",function(){
        window.location.href = this.href;
    })
}

//返回顶部
window.onload = function() {
	var screenh = document.documentElement.scrollHeight
			|| document.body.scrollHeight;
	console.log(screenh);
	var toTop = document.querySelector("#backTop");
/*	window.onscroll = function() {
		var scrolltop = document.documentElement.scrollTop;
		if (scrolltop > 100) {
			toTop.style.display = "block";
		} else {
			toTop.style.display = "none";
		}
	}*/
	toTop.addEventListener("tap", function() {
		document.documentElement.scrollTop = document.body.scrollTop = 0;
	});
}

// 打开相应的链接
function openLink(e,url){
    e.addEventListener("tap",function(){
        window.location.href = url;
    })
} 
//搜索关键字不为空检查
function checkWord(){
	var word = document.getElementById('word').value;
	if(word==null){
		alert('关键字不能为空');return false;
	}
	word = word.trim();
	if(word==''){
		alert('关键字不能为空');return false;
	}
}