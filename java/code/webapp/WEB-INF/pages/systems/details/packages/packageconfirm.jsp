<%@ taglib uri="http://rhn.redhat.com/rhn" prefix="rhn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://rhn.redhat.com/tags/list" prefix="rl" %>


<html>

<body>

<%@ include file="/WEB-INF/pages/common/fragments/systems/system-header.jspf" %>
    <h2>
      <rhn:icon type="header-package" />
      <bean:message key="${requestScope.header}" />
    </h2>
    <rhn:systemtimemessage server="${requestScope.system}" />

<c:set var="pageList" value="${requestScope.pageList}" />

<rl:listset name="packageListSet">
    <rhn:csrf />
    <rhn:submitted />
        <rl:list dataset="pageList"
         width="100%"
         name="packageList"
         styleclass="list"
         emptykey="packagelist.jsp.nopackages">
            <rl:decorator name="PageSizeDecorator"/>
            <rl:column headerkey="packagelist.jsp.packagename" bound="false"
                        sortattr="nvre"
                        sortable="true" filterattr="nvre">
                <c:choose>
                    <c:when test="${not empty current.packageId}">
                        <a href="/rhn/software/packages/Details.do?sid=${param.sid}&amp;id_combo=${current.idCombo}">
                            ${current.nvre}</a>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${current.nvre}"/>
                    </c:otherwise>
                </c:choose>
            </rl:column>
        </rl:list>
<c:if test="${not empty requestScope.pageList}">
    <div class="form-horizontal">
        <jsp:include page="/WEB-INF/pages/common/fragments/schedule-options.jspf"/>
        <div class="form-group">
            <div class="col-lg-offset-3 col-lg-6">
                <input type="submit" name ="dispatch" class="btn btn-success"
                       value='<bean:message key="installconfirm.jsp.confirm"/>'/>
                <rhn:hidden name="sid" value="${param.sid}" />
            </div>
        </div>
    </div>
</c:if>
</rl:listset>
</body>
</html>
