<!-- #-------------------------------------------------------------------------------
# eGov suite of products aim to improve the internal efficiency,transparency, 
#    accountability and the service delivery of the government  organizations.
# 
#     Copyright (C) <2015>  eGovernments Foundation
# 
#     The updated version of eGov suite of products as by eGovernments Foundation 
#     is available at http://www.egovernments.org
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program. If not, see http://www.gnu.org/licenses/ or 
#     http://www.gnu.org/licenses/gpl.html .
# 
#     In addition to the terms of the GPL license to be adhered to in using this
#     program, the following additional terms are to be complied with:
# 
# 	1) All versions of this program, verbatim or modified must carry this 
# 	   Legal Notice.
# 
# 	2) Any misrepresentation of the origin of the material is prohibited. It 
# 	   is required that all modified versions of this material be marked in 
# 	   reasonable ways as different from the original version.
# 
# 	3) This license does not grant any rights to any user of the program 
# 	   with regards to rights under trademark law for use of the trade names 
# 	   or trademarks of eGovernments Foundation.
# 
#   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
#------------------------------------------------------------------------------- -->


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="panel-heading">
	<div class="panel-title">
		<spring:message code="subheading.priest.info"/>
	</div>
</div>

	<div class="form-group">
		<label class="col-sm-3 text-right" >
			<spring:message code="lbl.fullname"/>
		</label>
		<div class="col-sm-3" >
			<form:input path="priest.name.firstName" id="txt-priest-firstName" type="text" class="form-control low-width is_valid_alphabet" maxlength="30" placeholder="First Name" autocomplete="off" />
            <form:errors path="priest.name.firstName" cssClass="add-margin error-msg"/>
		</div>
		<label class="col-sm-2 text-right" >
				<spring:message code="lbl.religion"/>
			</label>
			<div class="col-sm-3" >
				<form:select path="priest.religion" id="select-marriageAct" cssClass="form-control" 
							cssErrorClass="form-control error" >
	                 <form:option value=""> <spring:message code="lbl.default.option"/> </form:option>
	                 <form:options items="${religions}" itemValue="id" itemLabel="name"/>
	            </form:select>
	            <form:errors path="priest.religion" cssClass="add-margin error-msg"/>
			</div>
	</div>
	
		
	
		<div class="form-group">
			<label class="col-sm-3 text-right" >
				<spring:message code="lbl.residence.address"/>
			</label>
			<div class="col-sm-3" >
				<form:textarea path="priest.contactInfo.residenceAddress" id="txt-priest-residenceAddress" type="text" class="form-control low-width" data-pattern="alphanumericwithspecialcharacters" maxlength="250" placeholder="" autocomplete="off" />
                <form:errors path="priest.contactInfo.residenceAddress" cssClass="add-margin error-msg"/>
			</div>
		</div>
	
