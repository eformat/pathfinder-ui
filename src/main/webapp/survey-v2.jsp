<!DOCTYPE HTML>
<html>
  
  <%@include file="head.jsp"%>
  
  <link href="assets/css/breadcrumbs.css" rel="stylesheet" />
	
  <%@include file="datatables-dependencies.jsp"%>
  
	<body class="is-preload">
  	<%@include file="nav.jsp"%>
  	
		<%@include file="breadcrumbs.jsp"%>

		<script>
			$(document).ready(function() {
				// ### Get Customer Details
				httpGetObject(Utils.SERVER+"/api/pathfinder/customers/"+Utils.getParameterByName("customerId"), function(customer){
					if (undefined!=setBreadcrumbs) setBreadcrumbs("assessments", customer);
				});
				
				httpGetObject(Utils.SERVER+'/api/pathfinder/customers/'+customerId+"/applications/"+applicationId+"?custom=customer.id,customer.name", function(application){
					$('#applicationName').html(application['Name']);
					var customerId=application.CustomFields['customer.id'];
					var customerName=application.CustomFields['customer.name'];
					if (undefined!=setBreadcrumbs) initTabs("assessments", customerId, customerName);
				});
				
			});
		</script>
						
		<div class="container-fluid">
			<!-- #### page content here #### -->
	    <script src="https://unpkg.com/jquery"></script>
	
	    <script src="https://surveyjs.azureedge.net/1.0.23/survey.jquery.js"></script>
	    <link href="https://surveyjs.azureedge.net/1.0.23/survey.css" type="text/css" rel="stylesheet"/>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js"></script>
          <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css" rel="stylesheet" />

	    <!--
	    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
	    -->
	    <script src="https://unpkg.com/surveyjs-widgets"></script>

	    <!--<link rel="stylesheet" href="./context/index.css">-->

	    <script src="https://unpkg.com/icheck@1.0.2"></script>
	    <link rel="stylesheet" href="https://unpkg.com/icheck@1.0.2/skins/square/blue.css">
			
			<div class="row title-row">
				<div class="col-xs-10">
					<h2><span id="applicationName"></span> Assessment</h2>
				</div>
			</div>
			
	    <div id="surveyElement"></div>
	    <div id="surveyResult"></div>
			
			<style>
				.sv_header{
					display:none;
				}
				.sv_main .sv_container .sv_body .sv_p_root fieldset.sv_qcbc {
				  line-height: 0em;
          padding-top: 0.0em;
				}
				label{
					font-weight:400;
					font-size: 0.8rem; /* answer - text size */
					margin: 0 0 0.4rem 0; /* answer - spacing between radio options*/
				}
			</style>
			<!--
			<script src="utils.jsp"></script>
			-->
			<script>
				var surveyJsUrl=Utils.SERVER+"/api/pathfinder/survey";
				var surveyJSElement=document.createElement('script');
				surveyJSElement.src=surveyJsUrl;
				document.getElementsByTagName('head')[0].appendChild(surveyJSElement);
			</script>
				
		</div>
	</body>
</html>

