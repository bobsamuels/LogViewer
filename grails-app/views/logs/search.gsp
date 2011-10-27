<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"></meta>
        <g:javascript library="jquery-1.6.2.min"/>
        <g:javascript library="jquery-ui-1.8.16.custom.min"/>
        <g:javascript library="prototype"/>
        <link rel="stylesheet" href="${resource(dir:'css/ui-lightness',file:'jquery-ui-1.8.16.custom.css')}" />
        <script>
        jQuery(document).ready(function(){
            jQuery("#startDate").datepicker();
            jQuery("#endDate").datepicker();
        });
	</script>
  </head>
  <body>
    <g:formRemote name="searchLogs" url="[action:'ajaxSearchLogs']" update="searchResults">
        Start Date <input id="startDate" name="startDate"/>
        End Date <input id="endDate" name="endDate"/>
        Level <g:select name="level" from="${levels}" value="${level}"/>
        Search For <g:textField name="query" size="100"/>
        <g:submitButton name="submit" value="Search"/>
    </g:formRemote>
    <div id="searchResults"></div>
  </body>
</html>