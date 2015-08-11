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
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
	<head>
		<title><s:text name='transferProperty' /></title>
		<link href="<c:url value='/resources/global/css/bootstrap/bootstrap-datepicker.css' context='/egi'/>" rel="stylesheet" type="text/css" />
        <script src="<c:url value='/resources/global/js/bootstrap/bootstrap-datepicker.js' context='/egi'/>"></script>
		<script type="text/javascript">
		jQuery.noConflict();
		jQuery("#loadingMask").remove();
	function loadOnStartUp() {
		document.getElementById("saleDetail").className = "hiddentext";
		document.getElementById("saleDetail").readOnly = true;
		enableBlock();
		try { 
			jQuery(".datepicker").datepicker({
				format: "dd/mm/yyyy"
			}); 
		}catch(e){
			console.warn("No Date Picker "+ e);
		}

		jQuery('.datepicker').on('changeDate', function(ev){
			jQuery(this).datepicker('hide');
		});
		
		
	}
	function onSubmit() {
		var actionName = document.getElementById("workFlowAction").value;
		if (actionName == 'Forward') {
			document.forms[0].action = '/ptis/property/transfer/forward.action';
		} else {
			document.forms[0].action = '/ptis/property/transfer/reject.action';
		}
		document.forms[0].submit;
		return true;
	}
</script>
	</head>
	<body onload="loadOnStartUp();">
		<div class="formmainbox">
			<s:if test="%{hasErrors()}">
				<div class="errorstyle" id="property_error_area">
					<div class="errortext">
						<s:actionerror />
					</div>
				</div>
			</s:if>
			<s:form action="propertyTransfer" name="transferform" theme="simple" enctype="multipart/form-data">
			
				<s:push value="model">
				<s:hidden name="mutationId" id="mutationId" value="%{mutationId}"></s:hidden>
	            <s:hidden name="mode" id="mode" value="%{mode}"/>
				<s:token/>
				<div class="headingbg">
					<s:text name="transferortitle" />
				</div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="bluebox2" style="width:5%;">
							&nbsp;
						</td>
						<td class="bluebox" style="width:20%">
							<s:text name="prop.Id"></s:text> :
						</td>
						<td class="bluebox">
							<span class="bold"><s:property value="basicproperty.upicNo" default="N/A"/></span>
							<s:hidden name="assessmentNo" id="assessmentNo" value="%{basicproperty.upicNo}"/>
						</td>
						<td class="bluebox">
							&nbsp;
						</td>
						<td style="width:25%;">&nbsp;</td>
					</tr>
					<tr>
						<td class="bluebox2">
							&nbsp;
						</td>
						<td class="bluebox">
							<s:text name="PropertyAddress"></s:text> :
						</td>
						<td class="bluebox">
							<span class="bold"><s:property value="basicproperty.address" /></span>
						</td>
						<td class="bluebox">
							<s:text name="Zone"></s:text> :
						</td>
						<td class="bluebox">
							<span class="bold"><s:property value="basicproperty.propertyID.zone.name" /></span>
						</td>
					</tr>
					
					<tr>
						<td class="greybox2">
							&nbsp;
						</td>
						<td class="greybox">
							<s:text name="Ward" /> :
						</td>
						<td class="greybox">
							<span class="bold"><s:property value="basicproperty.propertyID.ward.name" /></span>
						</td>
						<td class="greybox">
							<s:text name="block" /> :
						</td>
						<td class="greybox">
							<span class="bold"><s:property value="basicproperty.propertyID.area.name" /></span>
						</td>
					</tr>
					
					<tr>
						<td class="greybox2">
							&nbsp;
						</td>
						<td class="greybox">
							<s:text name="currentpropertytax" /> :
						</td>
						<td class="greybox">
							<span class="bold">Rs. <s:property value="currentPropertyTax" /> /-</span>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<table class="tablebottom" id="" width="100%" border="0"
								cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<th class="bluebgheadtd"><s:text name="adharno"/></th>
									    <th class="bluebgheadtd"><s:text name="salutation"/></th>
									    <th class="bluebgheadtd"><s:text name="OwnerName"/></th>
									    <th class="bluebgheadtd"><s:text name="gender"/></th>
										<th class="bluebgheadtd"><s:text name="MobileNumber" /></th>
										<th class="bluebgheadtd"><s:text name="EmailAddress"/></th>
										<th class="bluebgheadtd"><s:text name="GuardianRelation"/></th>
										<th class="bluebgheadtd"><s:text name="Guardian"/></th>

									</tr>
									<s:iterator value="basicproperty.propertyOwnerInfo" status="status">
									<tr>
										<td class="blueborderfortd" align="center"><s:property value="owner.aadhaarNumber"/></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.salutation" /></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.name" /></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.gender" /></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.mobileNumber" /></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.emailId" /></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.guardianRelation" default="N/A"/></td>
										<td class="blueborderfortd" align="center"><s:property value="owner.guardian" default="N/A"/></td>
									</tr>
									</s:iterator>
								</tbody>
							  </table> 
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<div class="headingsmallbg">
								<s:text name="transferDtls" />
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="5">
							<div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablebottom" id="nameTable" >
								    <tr>
								    	<th class="bluebgheadtd"><s:text name="adharno"/><span class="mandatory1">*</span></th>
								    	<th class="bluebgheadtd"><s:text name="salutation"/><span class="mandatory1">*</span></th>
										<th class="bluebgheadtd"><s:text name="OwnerName"/><span class="mandatory1">*</span></th>
										<th class="bluebgheadtd"><s:text name="gender"/><span class="mandatory1">*</span></th>
										<th class="bluebgheadtd"><s:text name="MobileNumber" />(without +91)<span class="mandatory1">*</span></th>
										<th class="bluebgheadtd"><s:text name="EmailAddress"/><span class="mandatory1">*</span></th>
										<th class="bluebgheadtd"><s:text name="GuardianRelation"/></th>
										<th class="bluebgheadtd"><s:text name="Guardian"/></th>
										<th class="bluebgheadtd">Add/Delete</th>
									</tr>
									 <s:iterator value="transfereeInfos" status="status" >
								      <tr id="nameRow" >
								        <td class="blueborderfortd" align="center">
										   <s:textfield name="transfereeInfos[%{#status.index}].aadhaarNumber" size="12" maxlength="12"></s:textfield>
										</td>
										<td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].salutation" maxlength="10" size="10" 
								        		onblur="trim(this,this.value);checkSpecialCharForName(this);"/>
								        </td>
								        <td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].name" maxlength="100" size="20"
								        		onblur="trim(this,this.value);checkSpecialCharForName(this);"/>
								        </td>
								        <td class="blueborderfortd" align="center">
								        	<s:select name="transfereeInfos[%{#status.index}].gender" list="@org.egov.infra.persistence.entity.enums.Gender@values()"></s:select>
								        </td>
								        <td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].mobileNumber" maxlength="10" size="20"
								        		onblur="validNumber(this);checkZero(this,'Mobile Number');"/>
								        </td>
								        <td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].emailId" maxlength="100" size="20"
								        		onblur="trim(this,this.value);validateEmail(this);"/>
								        		<!-- This hidden field can become dropdown later when transferee become non citizen -->
								        	<s:hidden name="transfereeInfos[%{#status.index}].type" value="CITIZEN" data-static="true"/>
								        </td>
								        <td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].guardianRelation" maxlength="10" size="10" 
								        		onblur="trim(this,this.value);checkSpecialCharForName(this);"/>
								        </td>
								         <td class="blueborderfortd" align="center">
								        	<s:textfield name="transfereeInfos[%{#status.index}].guardian" maxlength="100" size="20"
								        		onblur="trim(this,this.value);checkSpecialCharForName(this);"/>
								        </td>
								       
								        <td class="blueborderfortd">
								        	<img id="addOwnerBtn" name="addOwnerBtn" src="${pageContext.request.contextPath}/resources/image/addrow.gif" onclick="javascript:addOwner(); return false;" alt="Add" width="18" height="18" border="0" />
								      		<img id="removeOwnerBtn" name="removeOwnerBtn" src="${pageContext.request.contextPath}/resources/image/removerow.gif" onclick="javascript:deleteTranferee(this);return false;" data-server="${id}" alt="Remove" width="18" height="18" border="0" />
								        </td>
								     </tr>
								     </s:iterator>
								</table>
							</div>
							<br/>
						</td>
					</tr>

					<tr>
						<td class="greybox2">
							&nbsp;
						</td>
						<td class="greybox">
							<s:text name="transferreason"></s:text>
							<span class="mandatory1">*</span> :
						</td>
						<td class="greybox">
							<s:select name="mutationReason" id="transRsnId"
								list="dropdownData.MutationReason" listKey="id"
								listValue="mutationName" headerKey="-1"
								headerValue="%{getText('default.select')}"
								value="%{mutationReason.id}"
								onchange="enableSaleDtls(this);" />
						</td>
						<td class="greybox">
							<s:text name="saleDetls" />
							<span class="mandatory1">*</span> :
						</td>
						<td class="greybox">
							<s:textarea cols="30" rows="2" name="saleDetail" id="saleDetail"
								onchange="return validateMaxLength(this);"
								onblur="trim(this,this.value);"></s:textarea>
						</td>
					</tr>
					
					<tr>
						<td class="greybox2">
							&nbsp;
						</td>
						<td class="greybox">
							<s:text name="docNum" /><span class="mandatory1">*</span> :
						</td>
						<td class="greybox">
							<s:textfield name="deedNo" id="docNum"  maxlength="64"/>
						</td>
						<td class="greybox">
							<s:text name="docDate" /><span class="mandatory1">*</span> :
						</td>
						<td class="greybox">
							<s:date name="deedDate" var="docDate" format="dd/MM/yyyy" />
							<s:textfield name="deedDate" id="deedDate" maxlength="10"
								value="%{docDate}"
								onkeyup="DateFormat(this,this.value,event,false,'3')"
								onblur="validateDateFormat(this);"
								cssClass="datepicker" />
						</td>
					</tr>
					<tr>
						<td class="bluebox2">
							&nbsp;
						</td>
						<td class="bluebox">
							<s:text name="docValue" /><span class="mandatory1">*</span> :
						</td>
						<td class="bluebox">
							<s:textfield name="marketValue" id="marketValue" maxlength="64"/>
						</td>
						<td class="bluebox">
							<s:text name="payablefee" /><span class="mandatory1">*</span> :
						</td>
						<td class="bluebox">
							<s:textfield name="mutationFee" id="mutationFee" readOnly="true"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="5">
							<div class="headingsmallbg">
								<s:text name="docsectiontitle" /> 
							</div>
						</td>
					</tr>

                     <tr>
						<td colspan="5">
						<table class="tablebottom" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th class="bluebgheadtd"><s:text name="doctable.docenclosed" /></th>
									<th class="bluebgheadtd"><s:text name="doctable.doctype" /></th>
									<th class="bluebgheadtd"><s:text name="doctable.docdate" /></th>
									<th class="bluebgheadtd"><s:text name="doctable.docdetails" /></th>
									<th class="bluebgheadtd">Files Attached</th>
									<th class="bluebgheadtd">Upload File</th>
								</tr>
								<s:iterator value="documents" status="docstatus" var="document">
								<tr>
									<td class="blueborderfortd" align="center">
									  <s:checkbox name="documents[%{#docstatus.index}].enclosed"/>
									</td>
									<td class="blueborderfortd" style="text-align:left">
									  <s:property value="type.name"/><s:if test="mandatory"><span class="mandatory1">*</span></s:if>
									  <s:hidden name="documents[%{#docstatus.index}].type.id" value="%{type.id}"></s:hidden>
									</td>
									<td class="blueborderfortd" align="center">
									  <s:date name="docDate" var="documentDate" format="dd/MM/yyyy" />
									  <s:textfield name="documents[%{#docstatus.index}].docDate" value="%{documentDate}" cssClass='datepicker' maxlength="10"/>
									</td>
									<td class="blueborderfortd" align="center">
										<s:textarea name="documents[%{#docstatus.index}].description" cols="40" rows="2"></s:textarea>
									</td>
									<td class="blueborderfortd" style="text-align:left">
									<c:forEach items="${document.files}" var="file">
										<li><a target="_blank" href="/egi/downloadfile?fileStoreId=${file.fileStoreId}&moduleName=PTIS">${file.fileName}</a></li>
									</c:forEach>
									</td>
									<td class="blueborderfortd" align="center">
										<s:file name="documents[%{#docstatus.index}].uploads" cssClass="button"/> 
									</td>
								</tr>
								</s:iterator>
							</tbody>
						</table>
					</td>
				 </tr>

				</table>
        		<%-- <%@ include file="../workflow/property-workflow.jsp" %>   --%>
       			<%--  <div class="buttonbottom">
					<s:submit value="Forward" id="Mutation:Forward" name="Transfer" cssClass="buttonsubmit" align="center" onclick="setWorkFlowInfo(this);resetDateFields();doLoadingMask();"></s:submit>
					<input type="reset" value="Cancel" class="button" align="center" />
					<input type="button" value="Close" class="button" align="center" onClick="return confirmClose();" />
				</div> --%>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<%@ include file="../workflow/commonWorkflowMatrix.jsp"%>
					</tr>
					<tr>
						<%@ include file="../workflow/commonWorkflowMatrix-button.jsp"%>
					</tr>
				</table>
				</s:push>
			</s:form>
			<div align="left" class="mandatory1" style="font-size: 11px">
				* Mandatory Fields
			</div>
		</div>
		<script type="text/javascript">
		jQuery("#marketValue").blur(function(){
			var marketVal = parseInt(jQuery("#marketValue").val());
			var transferReason = document.getElementById("transRsnId").options[document.getElementById("transRsnId").selectedIndex].text;
	 		if(isNaN(marketVal) || marketVal < 1)
	  			return false;
			jQuery.ajax({
				type: "GET",
				url: "calculate-mutationfee.action",
				cache: true,
				data:{"marketValue" : marketVal, "transferReason" : transferReason, "mutationId" : jQuery("#mutationId").val()}
			}).done(function(value) {
				jQuery("#mutationFee").val(value);
			});
		});
		function enableSaleDtls(obj) {
			var selectedValue = obj.options[obj.selectedIndex].text;
			if(selectedValue=='<s:property value="%{@org.egov.ptis.constants.PropertyTaxConstants@MUTATIONRS_SALES_DEED}" />') {
				document.getElementById("saleDetail").readOnly=false;
				document.getElementById("saleDetail").className="";
			}
			else {
				document.getElementById("saleDetail").value="";
				document.getElementById("saleDetail").className="hiddentext";
				document.getElementById("saleDetail").readOnly=true;
			}
		}
		function confirmClose(){
	 		var result = confirm("Do you want to close the window?");
	 		if(result==true){
	 			window.close();
	 			return true;
	 		}else{
	 			return false;
	 		}
	 	}		
		function enableBlock(){
	   		var obj=document.getElementById("transRsnId");
	 		if(obj!=null || obj!="undefined"){
	  			var selectedValue = obj.options[obj.selectedIndex].text;
	 			if(selectedValue=='<s:property value="%{@org.egov.ptis.constants.PropertyTaxConstants@MUTATIONRS_SALES_DEED}" />') { 
					document.getElementById("saleDetail").readOnly=false;
					document.getElementById("saleDetail").className="";
				} else {
					document.getElementById("saleDetail").value="";
					document.getElementById("saleDetail").className="hiddentext";
					document.getElementById("saleDetail").readOnly=true;
				}
			}
		}

		function deleteTranferee(obj) {
			if (jQuery('#nameTable tr').length > 2) {
				var transfereeId = jQuery(obj).data('server');
				if (transfereeId && transfereeId != "") {			
					var result = confirm("Do you want to remove the tranfreree ?");
			 		if(result){
			 			jQuery.ajax({
							type: "GET",
							url: "delete-transferee.action",
							cache: true,
							data:{"transfereeId" : transfereeId,"mutationId" : jQuery("#mutationId").val()}
						}).done(function(value) {
							 if(value == "true") {
								 deleteOwner(obj);
							 } else {
								 alert("Could not delete this Transferee Info");
							 }
						});
			 			
			 		}
				} else {
					deleteOwner(obj);
				}
			} else {
				alert("Atleast one owner details is mandatory!");
			}
		}
		jQuery('#nameTable tr:not(:eq(1)) td img[alt="Add"]').hide();
</script>
</body>
</html>