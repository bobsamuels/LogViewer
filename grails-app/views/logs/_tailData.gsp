<g:if test="${msgs?.size() > 0}">
<g:each in="${msgs}" var="msg">
    ${msg.timestamp} ${msg.level} ${msg.className} ${msg.method} ${msg.lineNumber} ${msg.message}<BR/>
</g:each>
</g:if>
<g:else>
    No messages found.
</g:else>