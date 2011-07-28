<%@ page contentType="text/css;charset=UTF-8" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.zssheet {
	position: relative;
	width: 100px;
	height: 100px;
	background:#A4C3EB;
	overflow:hidden;
	border:1px solid #D8D8D8;
}

.zsscroll {
	top: 0px;
	position: absolute;
	z-index: 0;
	overflow:auto;
	width: 100%;
	height:100%;
	left:0px;
	background-color:#CAD7E6;
}

.zsdata {
	left: 0px;
	top: 0px;
	display: block;
	position: relative;
	padding-top: 20px;
	padding-left: 36px;
	overflow: hidden;
	background-color:#EEEEFF;
}
.zsdatapad{
	position: relative;
	left: 0px;
	top: 0px;
	overflow: hidden;
	height:0px;
}
.zsleftpad{
	position: relative;
	left: 0px;
	top: 0px;
	overflow: hidden;
	height:0px;
}

.zsblock {
	left: 0px;
	top: 0px;
	display: block;
	position: relative;
	overflow: visible;
	background-color:#FFFFFF;
}

.zsrow {
	position: relative;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 20px; /*rowHeight*/
	overflow-y: visible;/*don't set hidden, otherwise sometime there will appear h-scrollbar in row*/
	white-space: nowrap;
	z-index: 1;
	<c:if test="${c:browser('ie')}"> 
		font-size:0;
	</c:if>
	<c:if test="${c:isExplorer() && !c:isExplorer7()}">
		position: static;
		overflow-y: hidden;
	</c:if>
}

.zscell {
	display: -moz-inline-box;
	-moz-box-sizing: border-box;
	border-right: 1px solid #D0D7E9;
	border-bottom: 1px solid #D0D7E9;
	padding: 0px 2px 0px 2px; /* cellPadding */
	height: 20px; /*rowHeight*/
	width: 60px; /*colWidth*/
	overflow: hidden;
	vertical-align: top;
	/*font-size: smaller;*/
	/*line-height: 20px;  lineHeight*/
	z-index:10;
	position: relative;
	cursor : default;
	<c:if test="${c:browser('ie')}">
		display: inline-block;
		zoom: 1;
		*display: inline;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: inline-block;
	</c:if>
	<c:if test="${c:isOpera()}">
		display: inline-block;
		vertical-align:text-top;
		/*vertical-align: top;*//* DIFF : important, vertical align will cause opera scrollbar disappear*/
	</c:if>
}

.zscell-over {
	border-right: 1px;
	border-right-style:hidden;
	overflow: visible;
	position: relative;
	<c:if test="${c:browser('ie')}">
		border-right: 0px;
		margin-right: 1px;
	</c:if>
	<c:if test="${c:isSafari()}">
		border-right: 0px;
		margin-right: 1px;
	</c:if>
	<c:if test="${c:isOpera()}">
		border-right: 0px;
		margin-right: 1px;
	</c:if>
}

.zscell-over-b {
	overflow: visible;
	position: relative;
}

.zscell-inner-mid-left {
	display: box;
	box-orient: horizontal;
	box-pack: start;
	box-align: center;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: start;
		-moz-box-align: center;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: start;
		-webkit-box-align: center;
	</c:if>
}

.zscell-inner-mid-center {
	display: box;
	box-orient: horizontal;
	box-pack: center;
	box-align: center;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: center;
		-moz-box-align: center;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: center;
		-webkit-box-align: center;		
	</c:if>
}

.zscell-inner-mid-right {
	display: box;
	box-orient: horizontal;
	box-pack: end;
	box-align: center;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: end;
		-moz-box-align: center;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: end;
		-webkit-box-align: center;		
	</c:if>
}

.zscell-inner-btm-left {
	display: box;
	box-orient: horizontal;
	box-pack: start;
	box-align: end;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: start;
		-moz-box-align: end;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: start;
		-webkit-box-align: end;
	</c:if>
}

.zscell-inner-btm-center {
	display: box;
	box-orient: horizontal;
	box-pack: center;
	box-align: end;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: center;
		-moz-box-align: end;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: center;
		-webkit-box-align: end;		
	</c:if>
}

.zscell-inner-btm-right {
	display: box;
	box-orient: horizontal;
	box-pack: end;
	box-align: end;
	<c:if test="${c:isGecko()}">
		display: -moz-box;
		-moz-box-orient: horizontal;
		-moz-box-pack: end;
		-moz-box-align: end;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: -webkit-box;
		-webkit-box-orient: horizontal;
		-webkit-box-pack: end;
		-webkit-box-align: end;
	</c:if>
}

.zscelltxt {
	font-family: Calibri;
	font-size: 11px;
	text-align: left;
	width: 49px; /* colWidth - 2*cellPadding - 1 , 1 is border*/
	overflow: hidden;
}

.zstop {
	position: absolute;
	z-index: 2;
	left: 36px; /*leftWidth*/
	top: 0px;
	height: 19px; /*topHeidht -2 , 1 is border*/
	/*line-height: 20px; lineHeight*/
	overflow: hidden;
	border-top: 1px solid #7F9DB9;
	/*border-bottom: 1px solid #7F9DB9;*/
	background:#DAE7F6 none repeat scroll 0%;
}
.zscornertop{
	position: absolute;
	left: 36px; /*leftWidth*/
	top: 0px;
	height: 19px; /*topHeidht -2 , 1 is border*/
	overflow: hidden;
	border-top: 1px solid #7F9DB9;
	background:#DAE7F6 none repeat scroll 0%;
}


.zstopi, .zscornertopi{
	position: relative;
	top: 0px;
	left: 0px;
	height: 100%;
	display: block;
	margin: 0px;
	padding: 0px;
	overflow-y: visible;
	white-space: nowrap;
}

.zstophead {
	
}

.zstopblock {
	left: 0px;
	top: 0px;
	display: block;
	position: relative;
	overflow: visible;
	background-color:#FFFFFF;
	<c:if test="${c:isExplorer7()}">
		top: 1px;
	</c:if>
	<c:if test="${c:isExplorer() && !c:isExplorer7()}">
		top: -1px;
	</c:if>
	<c:if test="${c:isSafari()}">
		top: 1px;
	</c:if>
	<c:if test="${c:isOpera()}">
		top: 1px;
	</c:if>
}

.zstopcell {
	display: -moz-inline-box;
	-moz-box-sizing: border-box;
	border-right: 1px solid #DAE7F6;
	border-bottom: 1px solid #7F9DB9;
	padding: 0px 2px 0px 2px; /*cellPadding*/
	height: 19px; /*topHeigth*/
	width: 60px; /*cellWidth*/
	overflow: hidden;
	vertical-align: top;
	/*line-height: 20px; lineHeigth*/
	border-right: 1px solid #7F9DB9;
	background-image: url(${c:encodeURL('~./zss/img/s_hd.gif')});
	overflow: hidden;
	position:relative;
	cursor : default;
	<c:if test="${c:browser('ie')}">
		display: inline-block;
		zoom: 1;
		*display: inline;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: inline-block;
	</c:if>
	<c:if test="${c:isOpera()}">
		display: inline-block;
	</c:if>
}

.zstop-sel {
	/*background:#ffd58d;*/
	background-image: url(${c:encodeURL('~./zss/img/s_hds.gif')});
}

.zstopcelltxt {
	font-size: smaller;
	text-align: center;
	width: 49px;  /* colWidth - 2*cellPadding - 1 , 1 is border*/
}

.zsleft{
	position: absolute;
	z-index: 2;
	top: 20px; /* topHeight */
	left: 0px;
	width: 35px; /* leftWith - 2 , 2 is border */
	overflow: hidden;
	border-left: 1px solid #7F9DB9;
	background:#DAE7F6 none repeat scroll 0%;
}

.zscornerleft  {
	position: absolute;
	z-index: 2;
	top: 20px; /* topHeight */
	left: 0px;
	width: 34px; /* leftWith - 2 , 2 is border */
	overflow: hidden;
	border-left: 1px solid #7F9DB9;
	background:#DAE7F6 none repeat scroll 0%;
}

.zslefti, .zscornerlefti {
	position: relative;
	top: 0px;
	left: 0px;
}


.zsleftblock {
	left: 36px;
	top: 0px;
	display: block;
	position: absolute;
	overflow: visible;
	background-color:#FFFFFF;
}

.zslefthead {
	background-color: #e3ecf7;
}

.zsleftcell {
	border-right: 1px solid #7F9DB9;
	/*line-height: 20px;*/
	height: 19px; /* rowHeight - 1, 1 is border */
	border-bottom: 1px solid #7F9DB9;
	text-align: center;
	overflow: hidden;
	cursor : default;
}
.zsleftcelltxt {
	font-size: smaller;
	height: 19px; /* rowHeight - 1, 1 is border */
	text-align: center;
	<c:if test="${c:browser('ie')}">
		font-size: 10px;
	</c:if>
}

.zsleft-sel {
	background:#ffd58d;
}

.zsscrollinfo{
	z-index:3;
	position: absolute;
	top:0px;
	left:0px;
	width:400px;
	padding-top:1px;
	padding-bottom:1px;
	display:none;
}
.zsscrollinfoinner{
	background-color:#E3ECF7;
	font-family: Tahoma, Arial, Helvetica, sans-serif;
	font-size:small;
	padding-left:5px;
	padding-right:5px;
	border:1px outset #555555;
}

.zsinfo{
	z-index:4;
	position: absolute;
	top:1px;
	left:2px;
	width:400px;
	padding-top:2px;
	padding-bottom:2px;
	display:none;
}
.zsinfoinner{
	background-color:#FFD5AD;
	font-family: Tahoma, Arial, Helvetica, sans-serif;
	font-size:small;
	padding-left:5px;
	padding-right:5px;
	border:1px outset #555555;
}

.zscorner {
	position: absolute;
	z-index: 2;
	width: 36px; /* leftWidth - 2, 2 is border */
	height: 20px; /* topHeight - 2, 2 is border */
	background-color:#DAE7F6;
	overflow: hidden;
	<c:if test="${c:browser('ie')}">
		*font-size: 0;
	</c:if>
}

.zscorneri {
	border: 1px solid #7F9DB9;
	/*background-image: url(${c:encodeURL('~./zss/img/s_hd.gif')});*/
	width:34px;
	height:18px;
	background-color:#A9C4E9;
}

.zscornerblock {
	left: 20px;
	top: 36px;
	display: block;
	position: absolute;
	overflow: hidden;
	background-color:#FFFFFF;
}

.zsfocmark {
	position: absolute;
	z-index: 2;
	display: none;
	border: 3px solid #BBBBBB;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
	</c:if>
}
.zsfocmarki{
	position: absolute;
	width:100%;
	height:100%;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
		filter: alpha(opacity=0);
		background: #FFFFFF;
	</c:if>
}
.zsselect {
	position: absolute;
	z-index: 3;
	display: none;
	cursor: move;
	border: 3px solid #222222;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
	</c:if>
}
.zsselecti{
	position: absolute;
	cursor: default;
	width:100%;
	height:100%;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
		filter: alpha(opacity=0);
		background: #FFFFFF;
	</c:if>
}

.zsselecti-r{
	background-color: #E3ECF7;
	opacity:.5;
	<c:if test="${c:browser('ie')}">
		filter: alpha(opacity=50);
	</c:if>
}

.zsseldot {
	position: absolute;
	width: 5px;
	height: 5px;
	right: -5px;
	bottom: -5px;
	border: 1px solid white;
	background-color: #222222;
	cursor: crosshair;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
	</c:if>
}

.zsselchg {
	position: absolute;
	z-index: 4;
	display: none;
	border: 3px solid #909090;
	
}

.zsselchgi{
	position: absolute;
	width:100%;
	height:100%;
	background-color: #BBAABB;
	opacity:.4;
	<c:if test="${c:browser('ie')}">
		filter: alpha(opacity=40);
		background-color: #99FFAA;
	</c:if>
}

.zshighlight {
	position: absolute;
	z-index: 2;
	display: none;
	border: 3px dotted #909090;
}

.zshighlight2 {
	border-color: #000090;
}

.zshighlighti{
	position: absolute;
	width:100%;
	height:100%;
}

.zsedit {
	font-family: Calibri;
	font-size: 11px;
	position: absolute;
	z-index: 4;
	border: none;
	display: none;
	background-color: white;
	overflow: auto;
	border-bottom:1px #777777 solid;
}

.zsfocus{
	position:absolute;
	width : 0px;
	left : -5px;
}


.zshboun{
	display: -moz-inline-box;
	position:relative;
	height:20px;
	width:0px;
	left:-3px;
	z-index:2;
	vertical-align:top;
	<c:if test="${c:browser('ie')}">
		display: inline-block;
		zoom: 1;
		*display: inline;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: inline-block;
	</c:if>
	<c:if test="${c:isOpera()}">
		display: inline-block;
	</c:if>
}
.zshbouni{
	position: relative;
	height:100%;
	width:7px;
	<c:if test="${c:browser('ie')}">
		*position: absolute;
		display: inline-block;
		zoom: 1;
		*display: inline;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: inline-block;
	</c:if>
	<c:if test="${c:isOpera()}">
		display: inline-block;
	</c:if>
}
.zsvboun{
	position:relative;
	height:0px;
	top:-3px;
	z-index:2;
}
.zsvbouni{
	position: relative;
	height:7px;
	width:100%;
	<c:if test="${c:browser('ie')}">
		*position: absolute;
		font-size: 0;
	</c:if>
}
.zshbouni-over{
	background: #A9C4E9;
	cursor: e-resize;
}
.zsvbouni-over{
	background: #A9C4E9;
	cursor: n-resize;
}
.zshbounw{
	position: relative;
	height:100%;
	width:3px;
	<c:if test="${c:browser('ie')}">
		display: inline-block;
		zoom: 1;
		*display: inline;
		*position: absolute;
		*left:7px;
	</c:if>
	<c:if test="${c:isSafari()}">
		display: inline-block;
	</c:if>
	<c:if test="${c:isOpera()}">
		display: inline-block;
	</c:if>
}
.zshbounw-over{
	background: #A9C4E9;
	cursor: url(${c:encodeURL('~./zss/img/h_resize.cur')}), e-resize;
}
.zsvbounw{
	position: relative;
	height:3px;
	width:100%;
	<c:if test="${c:browser('ie')}">
		font-size: 0;
		*position: absolute;
		*top:7px;
	</c:if>
}
.zsvbounw-over{
	background: #A9C4E9;
	cursor: url(${c:encodeURL('~./zss/img/v_resize.cur')}), n-resize;
}
.zsfztop{
	border-bottom : 1px #5F5FFF;
	border-bottom-style:none;
}

.zsfzleft{
	border-right : 1px #5F5FFF;
	border-right-style:none;
}

.zsfzcorner{
	border-right : 1px #5F5FFF;
	border-bottom : 1px #5F5FFF;
	border-right-style:none;
	border-bottom-style:none;
}
.zssmask{
	position:absolute;
	width:100%;
	height:100%;
	z-index:999;
	background-color : #A9C4E9;
	opacity:.75;
	display:table;
	<c:if test="${c:browser('ie')}">
		filter:alpha(opacity=75);
	</c:if>
}
.zssmask2{
	display:table-cell;
	vertical-align:middle;
}
.zssmasktxt{
	font-size:20px;
	font-style:bold;
	color:white;
}
.zssbusy{
	position: absolute;
	z-index: 1000;
	left: 8px;
	top: 2px;
	width: 16px;
	height: 16px;
	background-image : url(${c:encodeURL('~./zss/img/busy.gif')});
	visibility : hidden;
}


.zsmergee{
	display:none!important;
}

.zsmergeeu{
	visibility:hidden!important;
}

.zswidgetpanel{
	position:absolute;
	width:0px;
	height:0px;
	top:0px;
	left:0px;
	z-index:10;
	overflow:visible;
}

.zswidget{
	position:absolute;
	top:0px;
	left:0px;
	z-index:10;
	visibility:hidden;/* hidden when loading, javascript will show it after init*/
}

.chartborder img {
	border: 1px solid #868686;
}

.zsbtn {
	height:17px;
	width:17px;
	position: absolute;
	bottom: 2px;
	z-index: 10;
	background-repeat:no-repeat;
	background-size: 100%;
}

.zsdropdown {
	background-image: url(${c:encodeURL('~./zss/img/dropdown.gif')});
}

.zsfilter {
	background-image: url(${c:encodeURL('~./zss/img/filter.gif')});
}