<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Log Reader" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div>
            <div id="icon" style="position: relative; float:left; width:320px;margin-left:10px;">
                <img src="${resource(dir:'images', file:'log.gif')}">
            </div>
            <div id="title" style="position: absolute; float:left; font-size: 30px; left:30px; top:30px;">
                Vitomy Log Reader
            </div>
            <div id="slogan" style="position: relative; float:right; font-size: 25px; font:helvetica; font-style:oblique; margin-top:175px; margin-right:35px;">
                Because you can't possibly like less, cat, grep, find, etc.....
            </div>
			
        </div>
        <div style="clear:both"></div>        
        <div style="margin-left:25px;margin-right:25px; margin-top:-75px;position:relative;">
			<div id="menu">
	            <div class="topbar"></div>
	            <ul class="claybricks">
	                <li><g:link controller="logs" action="cdnErrors">CdnErrors</g:link></li>
					<li><g:link controller="logs" action="appErrors">AppErrors</g:link></li>
	                <li><g:link controller="logs" action="search">Search</g:link></li>
	                <li class="selected"><g:link controller="logs" action="tail">Tail</g:link></li>
	            </ul>
	        </div>
			<div id="body">
            <g:layoutBody />
			</div>
        </div>
    </body>
</html>