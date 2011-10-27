<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"></meta>
      <g:javascript library="prototype"/>
  <script>
      document.observe("dom:loaded", function(){
        var refresher = new Ajax.PeriodicalUpdater(
                'tailConsole',
                'ajaxUpdateTail',
                {
                    method: 'get',
                    parameters: 'level=DEBUG',
                    frequency:5
                });

          $("stopTail").observe("click", function(){
            refresher.stop();
            $('tailStatus').innerHTML =  "Off";
          });

          $("startTail").observe("click", function(){
            refresher.start();
            $('tailStatus').innerHTML = "On";
          });

          $("changeLevelLink").observe("click", function(){
            $('changeLevelSpan').show();
          });

          $("level").observe("change", function(){
              refresher.stop();
              var level = $F('level');
             $('currentLevel').innerHTML = level;
             $('changeLevelSpan').hide();
              var params = "level=" + level
              refresher.options.parameters = params;
              refresher.start();
          });

      });

  </script>
  </head>
  <body>
  <div style="background:#e3e490;">
      <div style="float:left; width:430px;"><h1>Most Recent 50 Log Statments for level: <span id="currentLevel">${level}</span></h1></div>
      <div style="float:left; padding-top:14px; width:375px; height: 35px;">
          <span class="spanLink" id="changeLevelLink">Change</span>
          <span id="changeLevelSpan" style="display:none;">
            <select id="level">
                <g:each in="${levels}" var="level">
                    <option id="${level}" value="${level.capitalize()}">${level.capitalize()}</option>
                </g:each>
            </select>
          </span>
      </div>
      <div style="float:right; padding-top:14px; margin-right:15px;">
          <span>Tail is</span> <span id="tailStatus">On</span>
          <span class="spanLink" id="stopTail">Stop Tail</span>
          <span class="spanLink" id="startTail">Start Tail</span>
      </div>
  </div>
  <div style="clear:both;"></div>
  <div id="tailConsole">
      <g:render template="tailData" model="['msgs':msgs]"/>
  </div>
  </body>
</html>