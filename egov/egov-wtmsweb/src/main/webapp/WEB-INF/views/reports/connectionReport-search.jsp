<%--
  ~ eGov suite of products aim to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) <2015>  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  --%>

<%@ page contentType="text/html" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/taglib/cdn.tld" prefix="cdn" %>

<div class="row">
	<div class="col-md-12">
		<div class="" data-collapsed="0">
			<c:if test="${not empty message}">
				<div class="alert alert-success" role="alert">${message}</div>
			</c:if>
			<div class="panel-body">
				<form:form id="drillDownReportForm" method="get"
					class="form-horizontal form-groups-bordered"
					modelAttribute="reportHelper">
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-heading">
							<div class="panel-title">
								<strong><spring:message code="title.connectionreport" /></strong>
							</div>
						</div>
						<div class="panel-body custom-form">
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label"><spring:message
										code="lbl.ward" /></label>
								<div class="col-sm-3 add-margin">
									<form:select name="ward" id="ward" path="ward"
										cssClass="form-control" cssErrorClass="form-control error">
										<form:option value="">
									--select--
								</form:option>
										<form:options items="${wards}" itemValue="id" itemLabel="name" />
									</form:select>
								</div>

							</div>
						</div>
						<div class="panel-body custom-form">
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label"><spring:message
										code="lbl.block" /></label>
								<div class="col-sm-3 add-margin">
									<form:select name="block" id="block" path="block"
										cssClass="form-control" cssErrorClass="form-control error">
										<form:option value="">
									--select--
								</form:option>
									</form:select>
								</div>
							</div>
						</div>

						<div class="panel-body custom-form">
							<div class="form-group">
								<label for="field-1" class="col-sm-3 control-label"><spring:message
										code="lbl.locality" /></label>
								<div class="col-sm-3 add-margin">
									<form:select name="localitys" id="localitys" path=""
										cssClass="form-control" cssErrorClass="form-control error">
										<form:option value="">
									--select--
								</form:option>
										<form:options items="${localitys}" itemValue="id"
											itemLabel="name" />

									</form:select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">

						<div class="text-center">
							<button type="button" id="drilldownReportSearch"
								class="btn btn-primary">Search</button>
							<a href="javascript:void(0)" class="btn btn-default"
								onclick="self.close()"> <spring:message code="lbl.close" /></a>
						</div>
					</div>
			</div>
			</form:form>
			<div class="row display-hide report-section">
				<div id="baseRegister-header"
					class="col-md-12 table-header text-left">
					<fmt:formatDate value="${currDate}" var="currDate"
						pattern="dd-MM-yyyy" />
					<div class="col-md-6 col-xs-6 table-header">
						<spring:message code="lbl.drilldownReport.resultHeader" />
						:
						<c:out value="${currDate}"></c:out>
					</div>
				</div>

				<div class="col-md-12 form-group">
					<table
						class="table table-bordered datatable dt-responsive table-hover"
						id="drilldownReport-table">
						<thead></thead>
						<tfoot id="report-footer">
							<tr>
								<td><b><spring:message code="lbl.total" /></b></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<link rel="stylesheet"
	href="<cdn:url value='/resources/global/js/jquery/plugins/datatables/responsive/css/datatables.responsive.css' context='/egi'/>">
<link rel="stylesheet" href="<cdn:url value='/resources/global/css/jquery/plugins/datatables/jquery.dataTables.min.css' context='/egi'/>"/>
<link rel="stylesheet" href="<cdn:url value='/resources/global/css/jquery/plugins/datatables/dataTables.bootstrap.min.css' context='/egi'/>">
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/jquery.dataTables.min.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/dataTables.bootstrap.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/responsive/js/datatables.responsive.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/dataTables.tableTools.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/TableTools.min.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/datatables/jquery.dataTables.columnFilter.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/bootstrap/typeahead.bundle.js' context='/egi'/>"></script>
<script
	src="<cdn:url value='/resources/global/js/jquery/plugins/jquery.inputmask.bundle.min.js' context='/egi'/>"></script>
<script type="text/javascript"
	src="<cdn:url value='/resources/global/js/jquery/plugins/jquery.validate.min.js' context='/egi'/>"></script>
<script
	src="<cdn:url value='/resources/global/js/egov/custom.js?rnd=${app_release_no}' context='/egi'/>"></script>

<script type="text/javascript"
	src="<cdn:url value='/resources/js/app/drillDownReport.js?rnd=${app_release_no}'/>"></script>