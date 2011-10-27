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
            <div id="icon" style="position: relative; float:left; width:320px;">
                <img src="${resource(dir:'images', file:'log.gif')}">
            </div>
            <div id="title" style="position: relative; float:left; font-size: 30px; top:120px;">
                Vitomy Log Reader
            </div>
        </div>
        <div style="clear:both"></div>
        <div id="menu">
            <div class="topbar"></div>
            <ul class="claybricks">
                <li><a href="http://www.dynamicdrive.com">Errors</a></li>
                <li><a href="http://www.dynamicdrive.com/new.htm">Search</a></li>
                <li class="selected"><a href="http://www.dynamicdrive.com/revised.htm">Tail</a></li>
            </ul>
        </div>
        <div style="margin-left:15px;">
            <g:layoutBody />
        </div>
    </body>
</html>