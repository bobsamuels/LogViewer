<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"></meta>
  	  <script type="text/javascript" src="http://www.google.com/jsapi"></script>	
	</head>
  <body>
  <h1>Fatal and error messages logged in the last 5 days</h1>
  <table id="logTable">
      <tr>
          <th scope="col">Host IP</th>
          <th scope="col">Date</th>
          <th scope="col">Level</th>
          <th scope="col">Class</th>
          <th scope="col">Method</th>
          <th scope="col">Line</th>
          <th scope="col">Message</th>
      </tr>
      <tbody>
      <g:each in="${errors}" var="error">
          <tr>
          	<td style="width:10%;">${error.hostIP}</td>
          	<td style="width:20%;"><g:formatDate format="MM/dd/yyyy HH:mm:ss:SS" date="${error.timestamp}"/></td>
          	<td style="width:4%;">${error.level}</td>
          	<td style="width:7%;">${error.className}</td>
          	<td style="width:8%;">${error.method}</td>
          	<td style="width:2%;">${error.lineNumber}</td>
          	<td style="width:53%;">${error.message}</td>
          </tr>
      </g:each>
      </tbody>
  </table>
	<gvisualization:lineCoreChart elementId="errorChart" title="Error Events" width="${500}" height="${300}" columns="${chartData.errCols}" data="${chartData.errStats}" />
	<gvisualization:lineCoreChart elementId="fatalChart" title="Fatal Events" width="${500}" height="${300}" columns="${chartData.fatalCols}" data="${chartData.fatalStats}" />
	<div style="margin-left:150px;">
	<div>
  		<div id="fatalChart" style="border: 1px solid; float: left;">Loading chart data...</div>
	</div>
	<div>	
		<div id="errorChart" style="border: 1px solid; float: left; margin-left: 30px">Loading chart data...</div>
	</div>
	</div>

  </body>
</html>