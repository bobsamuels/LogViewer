<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"></meta>
  </head>
  <body>
  <h1>Errors logged in the last 5 days</h1>
  <table id="logTable">
      <tr>
          <th scope="col">Application</th>
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
              <td></td>
              <td>${error.timestamp}</td>
              <td>${error.level}</td>
              <td>${error.className}</td>
              <td>${error.method}</td>
              <td>${error.lineNumber}</td>
              <td>${error.message}</td>
          </tr>
      </g:each>
      </tbody>
  </table>


  </body>
</html>