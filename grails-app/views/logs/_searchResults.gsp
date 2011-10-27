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
      <g:each in="${results}" var="result">
          <tr>
              <td></td>
              <td>${result.timestamp}</td>
              <td>${result.level}</td>
              <td>${result.className}</td>
              <td>${result.method}</td>
              <td>${result.lineNumber}</td>
              <td>${result.message}</td>
          </tr>
      </g:each>
      </tbody>
  </table>