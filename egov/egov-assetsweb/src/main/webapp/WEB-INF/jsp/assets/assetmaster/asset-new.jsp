<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="egov" tagdir="/WEB-INF/tags"%>
<html>
	<head>  
	    <s:if test="%{userMode=='new'}">
	    <title>- <s:text name="page.title.asset.create" /></title>
	    </s:if>
	    <s:elseif test="%{userMode=='view'}">
	    <title>- <s:text name="page.title.asset.view" /></title>
	    </s:elseif>
	    <s:elseif test="%{userMode=='edit'}">
	    <title>- <s:text name="page.title.asset.edit" /></title>
	    </s:elseif>  
	</head> 
	<body id="home" >

		<s:if test="%{hasErrors()}">
			<div class="errorstyle">
				<s:actionerror />
				<s:fielderror />
			</div>
		</s:if>
		<s:if test="%{hasActionMessages()}">
			<div class="messagestyle">
				<s:actionmessage theme="simple" />
			</div>
		</s:if>
		<script src="<egov:url path='js/helper.js'/>"></script>	
		<script>
			function enableFields(){
				for(i=0;i<document.assetForm.elements.length;i++){
				        document.assetForm.elements[i].disabled=false;
				}   
			}
		</script>
		<s:form action="asset" theme="simple" name="assetForm">
		<s:token/>	
		<div class="errorstyle" id="asset_error" style="display:none;"></div>
			<s:push value="model">
				<div class="navibarshadowwk">
				</div>
				<div class="formmainbox">
					<div class="insidecontent">
						<div class="rbroundbox2">
							<div class="rbtop2"><div></div>
							</div>
							<div class="rbcontent2">
								<div class="datewk">
									<span class="bold">Today</span>
									<egov:now />
								</div>
								<s:hidden name="id" />
								<s:hidden name="userMode" />
								<%@ include file='asset-form.jsp'%>
							</div>
							<div class="rbbot2">
							<div></div>
							</div>
						</div>
					</div>
				</div>
				<s:if test="%{userMode=='new'}">
					<div class="buttonholderwk" id="divButRow1" name="divButRow1">
						<s:submit cssClass="buttonfinal" value="SAVE" id="saveButton" method="save" 
							onclick="return validateFormAndSubmit();"/>
						<input type="button" class="buttonfinal" value="CLOSE"
							id="closeButton" name="button"
							onclick="window.close();" />
					</div>
				</s:if>
				<s:elseif test="%{userMode=='view'}">
					<div class="buttonholderwk" id="divButRow2" name="divButRow2">
						<input type="button" class="buttonfinal" value="BACK"
							id="backButton" name="button"
							onclick="history.go(-1);" />
						<input type="button" class="buttonfinal" value="CLOSE"
							id="closeButton" name="button"
							onclick="window.close();" />
					</div>
				</s:elseif>
				<s:elseif test="%{userMode=='edit'}">
					<div class="buttonholderwk" id="divButRow3" name="divButRow3">
						<s:submit cssClass="buttonfinal" value="SAVE" id="saveButton" method="save" 
							onclick="return validateFormAndSubmit();"/>
						<input type="button" class="buttonfinal" value="CLOSE"
							id="closeButton" name="button"
							onclick="window.close();" />
					</div>
				</s:elseif>
			</s:push>
		</s:form>
		<script>
			<s:if test="%{userMode=='view'}">
				links=document.assetForm.getElementsByTagName("a"); 
		        disableLinks(links,[]);
			</s:if>
			<s:if test="%{userMode=='edit'}">
				document.getElementById('grossvalue').readOnly=true;
				document.getElementById('accdepreciation').readOnly=true;
				<s:if test="%{sourcePath!=null}">
					document.getElementById('assetcat').disabled=true;
					document.getElementById('catTypeIdDummy').disabled=true;
					document.getElementById('status').disabled=true;
				</s:if>
			</s:if>
					
		</script>
	</body>
</html>
