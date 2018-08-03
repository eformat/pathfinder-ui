<!DOCTYPE HTML>
<html>
  
  <%@include file="head.jsp"%>
  
  <link href="assets/css/main.css" rel="stylesheet" />
  <link href="assets/css/breadcrumbs.css" rel="stylesheet" />
	
  <!-- #### DATATABLES DEPENDENCIES ### -->
  <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css" rel="stylesheet">
  <link href="assets/css/bootstrap-3.3.7.min.css" rel="stylesheet" />
	<link href="assets/css/datatables-addendum.css" rel="stylesheet" />
	<!--
  <script src="assets/js/jquery-3.3.1.min.js"></script>
	-->
  <script src="assets/js/bootstrap-3.3.7.min.js"></script>
  <script src="assets/js/jquery.dataTables-1.10.16.js"></script>
  <script src="assets/js/datatables-functions.js?v1"></script>
	<script src="assets/js/datatables-plugins.js"></script>
	<script type="text/javascript" src="utils.jsp"></script>
	
	<!-- for pie/line/bubble graphing -->
	<!--
	-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<body class="is-preload">


  	<%@include file="nav.jsp"%>
  	
		<section id="banner2">
			<div class="inner">
				<h1>Report for <span id="customerName"></span></h1>
			</div>
		</section>
		
  	<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><a href="manageCustomers.jsp">Customers</a></li>
				<li><span id="breadcrumb1"></span></li>
				<li><span id="breadcrumb2">Report</span></li>
			</ul>
		</div>

		<script>
		var customerId=Utils.getParameterByName("customerId");
		
		$(document).ready(function() {
			
			// ### Get Customer Details
			httpGetObject(Utils.SERVER+"/api/pathfinder/customers/"+customerId, function(customer){
				// ### Populate the header with the Customer Name
				document.getElementById("customerName").innerHTML=customer.CustomerName;
				document.getElementById("breadcrumb1").innerHTML="<a href='assessments-v2.jsp?customerId="+customer.CustomerId+"'>"+customer.CustomerName+"</a>";
			});
			
		});
		</script>
						
		<section class="wrapper">
			<div class="inner">
				
				<!-- ### Page specific stuff here ### -->
				
				
				<h2>Current Landscape</h2>
				<div class="row">
					<div class="col-sm-3">
						<canvas id="gauge-1" style="width:200px;height:100px;"></canvas>
					</div>
					<div class="col-sm-3">
						<canvas id="gauge-2" style="width:200px;height:100px;"></canvas>
					</div>
					<div class="col-sm-3">
						<canvas id="gauge-3" style="width:200px;height:100px;"></canvas>
					</div>
				</div>
				<%@include file="report-summary.jsp"%>
				<script>
					httpGetObject(Utils.SERVER+"/api/pathfinder/customers/"+customerId+"/report", function(report){
						new Chart(document.getElementById("gauge-1"),buildGuage(20, "rgb(146,212,0)","rgb(220, 220, 220)","Cloud-Native Ready"));
						new Chart(document.getElementById("gauge-2"),buildGuage(30, "rgb(240,171,0)","rgb(220, 220, 220)","High Risk"));
						new Chart(document.getElementById("gauge-3"),buildGuage(50, "rgb(204, 0, 0)","rgb(220, 220, 220)","Blocked"));
					});
				</script>
				
				<br/><br/><br/>
				
				
				<h2>Identified Risks</h2>
				<div class="row">
					<div class="col-sm-9">
						TODO: list of RED (and UNKNOWN?) questions that were answered on any assessment  
					</div>
				</div>
				
				<br/><br/><br/>
				
				
				<h2>Bubble Chart Title</h2>
				<div class="row">
					<div class="col-sm-4">
						<style>
						  /* override the datatables formatting to compress the screen real-estate used */
							input[type=search] {
								height: 23px;
								//width: 100px;
								padding: 0px;
								line-height: 1;
							}
							.dataTables_filter{
								width:150px;
							}
							.dataTables_length label select{
								height: 23px;
								width:  50px;
								padding: 0px;
							}
							.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover{
								height: 23px;
								padding: 0px !important;
							}
							table.dataTable thead th, table.dataTable thead td{
								padding: 0px 0px !important;
							}
						</style>
						<script>
							$(document).ready(function() {
							    $('#example').DataTable( {
							        "ajax": {
							            "url": Utils.SERVER+'/api/pathfinder/customers/'+customerId+"/applicationAssessmentSummary",
							            "data":{"_t":jwtToken},
							            "dataSrc": "",
							            "dataType": "json"
							        },
							        "oLanguage": { 
							        	sSearch: "",             // remove the "Search" label text
							        	sLengthMenu: "_MENU_" }, // remove the "show X entries" text
							        "scrollCollapse": true,
							        "paging":         true,
							        "lengthMenu":     [[10, 25, 50, 100, 200, -1], [10, 25, 50, 100, 200, "All"]], // page entry options
							        "pageLength" :    10, // default page entries
							        "searching" :     true,
							        "bInfo" :         false, // removes "Showing N entries" in the table footer
							        //"order" :         [[1,"desc"],[2,"desc"],[0,"asc"]],
							        "order" :         [[4,"desc"]],
							        "columns": [
							            { "data": "Id" },
							            { "data": "Name" },
							            { "data": "BusinessPriority" },
							            { "data": "Decision" },
							            { "data": "WorkEffort" },
							        ]
							        ,"columnDefs": [
							        		{ "targets": 0, "orderable": false, "render": function (data,type,row){
							              return "<input onclick='onChange2(this);' checked type='checkbox' value='"+row['Id']+"' style='background-color:red;width:10px'/>";
													}},
													{ "targets": 3, "orderable": true, "render": function (data,type,row){
							              return row['Decision']==null?"":row['Decision'];
													}},
													{ "targets": 4, "orderable": true, "render": function (data,type,row){
							              return row['WorkEffort']==null?"":row['WorkEffort'];
													}}
							        ]
							    } );
							} );
						</script>
				  	<div id="wrapper">
					    <div id="buttonbar">
					    </div>
					    <div id="tableDiv">
						    <table id="example" class="display" cellspacing="0" width="100%">
					        <thead>
				            <tr>
			                <th align="left"></th>
			                <th align="left">Application</th>
			                <th align="left">Bus. Critical</th>
			                <th align="left">Decision</th>
			                <th align="left">Effort</th>
				            </tr>
					        </thead>
						    </table>
						  </div>
				  	</div> <!-- dtable wrapper -->
				  	
						<script>
							var appFilter=[];
							function onChange2(t){
								t.checked?appFilter.push(t.value):appFilter.splice(appFilter.indexOf(t.value),1);
								reDrawBubble(rawSummary, false);
							}
						</script>
				  	
					</div> <!-- /col-sm-? -->
					
					<div class="col-sm-8">
						x=business priority, y=# of dependencies, size=effort, color=Action (REHOST=red, )
						<!--
						bubble chart
						x=biz priority
						y=deps (inbound)
						color?=action
						size=effort
						//transparency=certainty
						-->
						
						<script>
						  var decisionColors=[];
						  // colors got from https://brand.redhat.com/elements/color/
						  decisionColors['REHOST']    ="#cc0000"; //red
						  decisionColors['REFACTOR']  ="#004153"; //dark blue
						  decisionColors['REPLATFORM']="#A3DBE8"; //light blue 
						  decisionColors['REPURCHASE']="#3B0083"; //purple
						  decisionColors['RETAIN']    ="#92d400"; //green
						  decisionColors['RETIRE']    ="#f0ab00"; //amber
						  decisionColors['NULL']      ="#808080"; //grey
						  var sizing=[];
						  sizing['0']=10;
						  sizing['SMALL']=20;
						  sizing['MEDIUM']=40;
						  sizing['LARGE']=60;
						  sizing['EXTRA LARGE']=80;
						  var randomNumbers=[];

						  
						  var bubbleChart;
						  
						  function getData(summary){
						    
						    //TODO: remove this when we get dependencies
						    if (randomNumbers.length==0){
								  for(i=0;i<summary.length;i++){
								  	randomNumbers[i]=Math.floor(Math.random() * 10) + 0;
								  }
						    }
						    
								var label=[];
								var innerData=[];
								var backgroundColor=[];
								var data={};
								//data={label:[],data:[],backgroundColor:[]};
								
								//console.log("summary="+JSON.stringify(summary));
								var i;
								for(i=0;i<summary.length;i++){
									var app=summary[i];
									
									//console.log("APP="+JSON.stringify(app));
									
									if (!appFilter.includes(app['Id'])) continue;
									
									var name=app['Name'];
									var businessPriority=app['BusinessPriority'];
									var decision=app['Decision'];
									var workEffort=app['WorkEffort'];
									//var inboundDependencies=5; // TODO: not implemented in the back end yet
									var inboundDependencies=randomNumbers[i]
									
									//TODO: this shouldnt be possible unless the assessment is incomplete
									if (businessPriority==null) businessPriority=0;
									if (workEffort==null) workEffort=0;
									
									label.push({name});
									if (decision!=null){
										backgroundColor.push(decisionColors[decision]);
									}else{
										backgroundColor.push(decisionColors.NULL);
									}
									// {"x":1,"y":8,"r":10}
									//console.log(workEffort);
									innerData.push({"x":businessPriority,"y":inboundDependencies,"r":sizing[workEffort]})
									
								}
								data['label']=label;
								data['backgroundColor']=backgroundColor;
								data['data']=innerData;
								
								//console.log("data="+JSON.stringify(data));
								return data;
						  }
						  
						  function reDrawBubble(summary, initial){
						  	console.log("redraw -> "+initial);
								
								if (!initial){
									bubbleChart.destroy();
								}else{
									// add all apps to begin with
									for(i=0;i<summary.length;i++){
										appFilter.push(summary[i]['Id']);
									}
								}
								
							  var ctx=document.getElementById("bubbleChart").getContext('2d');
								bubbleChart=new Chart(ctx,{
									"type":"bubble",
									"data": {"datasets":[
										getData(summary)
									]},
									options:{
										animation: {
											duration: initial?1000:1
										},
										aspectRatio: 1,
										legend: false,
										scales: {
											yAxes: [{
												display: true,
												ticks: {
													suggestedMin: 0,
													suggestedMax: 10,
													beginAtZero: true
												}
											}],
											xAxes: [{
												display: true,
												ticks: {
													suggestedMin: 0,
													suggestedMax: 10,
													beginAtZero: true
												}
											}],
										}
									}
								});
									
								
						  }
						  
							var data;
							var rawSummary;
							httpGetObject(Utils.SERVER+"/api/pathfinder/customers/"+customerId+"/applicationAssessmentSummary", function(summary){
								rawSummary=summary;
								reDrawBubble(rawSummary, true);
							});
							
						</script>
						
						<div class="chartjs-wrapper" style="width:750px;">
							<canvas id="bubbleChart" class="chartjs" width="undefined" height="undefined"></canvas>
						</div>
   					
					</div> <!-- col-sm-? -->
				</div> <!-- /row -->
<br/><br/><br/>

				
				<h2>Suggested Adoption Plan</h2>
				<div class="row">
					<div class="col-sm-8">
						
						<div style="width: 1000px; height: 100px;">
							<canvas id="adoption" style="width: 500px; height: 100px;"></canvas>
						</div>
						
						<%@include file="report-adoption3.jsp"%>
						
					</div>
						
					</div> <!-- col-sm-? -->
				</div> <!-- /row -->
<br/><br/><br/>

<div class="row">
&nbsp;
</div>

			</div>
		</section>

	</body>
	
</html>




						<!--
					  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
					  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				
						-->
