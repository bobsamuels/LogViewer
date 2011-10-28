<g:if test="${results}">  
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
      <g:each in="${results}" var="result">
          <tr>
              <td style="width:10%;">${result.hostIP}</td>
              <td style="width:20%;"><g:formatDate format="MM/dd/yyyy HH:mm:ss:SS" date="${result.timestamp}"/></td>
              <td style="width:4%;">${result.level}</td>
              <td style="width:7%;">${result.className}</td>
              <td style="width:8%;">${result.method}</td>
              <td style="width:2%;">${result.lineNumber}</td>
              <td style="width:53%;">${result.message}</td>
          </tr>
      </g:each>
      </tbody>
  </table>
</g:if>
<g:else>
	<br/>
	No results found.
</g:else>