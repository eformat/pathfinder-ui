
<!--#################-->
<!-- EDIT MODAL FORM -->
<!--#################-->

<script>
  var entityManagementUrls={
  	"get":			Utils.SERVER+"/api/pathfinder/customers/$ID/",
  	"create":		Utils.SERVER+"/api/pathfinder/customers/",
  	"update":		Utils.SERVER+"/api/pathfinder/customers/$ID"
  };
  
//	function getLoadUrl(id){
//		return Utils.SERVER+"/api/pathfinder/customers/"+id+"/";
//	}
//	function getCreateUrl(id){
//		return Utils.SERVER+"/api/pathfinder/customers/";
//	}
	function getIdFieldName(){
		return "CustomerId";
	}
</script>



<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document"> <!-- make wider by adding " modal-lg" to class -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New Customer</h4>
      </div>
      <div class="modal-body">
        <form id="form">
        	<!-- ### Hidden ID field -->
        	<div id="form-id" class="form-group" style="display:none">
            <label for="CustomerId" class="control-label">Customer Name:</label>
            <input id="CustomerId" name="CustomerId" type="text" class="form-control"/>
          </div>
          
          <div id="form-id" class="form-group">
            <label for="CustomerName" class="control-label">Customer Name:</label>
            <input id="CustomerName" name="CustomerName" type="text" class="form-control"/>
          </div>
          <div class="form-group">
            <label for="CustomerDescription" class="control-label">Customer Description:</label>
            <input id="CustomerDescription" name="CustomerDescription" type="text" class="form-control">
          </div>
          <div class="form-group">
            <label for="CustomerVertical" class="control-label">Customer Vertical:</label>
            <select name="CustomerVertical" id="CustomerVertical" class="form-control">
							<option value="Agriculture">Agriculture</option>
							<option value="Business Services">Business Services</option>
							<option value="Construction & Real Estate">Construction & Real Estate</option>
							<option value="Education">Education</option>
							<option value="Energy, Raw Materials & Utilities">Energy, Raw Materials & Utilities</option>
							<option value="Finance">Finance</option>
							<option value="Government">Government</option>
							<option value="Healthcare">Healthcare</option>
							<option value="IT">IT</option>
							<option value="Leisure & Hospitality">Leisure & Hospitality</option>
							<option value="Libraries">Libraries</option>
							<option value="Manufacturing">Manufacturing</option>
							<option value="Media & Internet">Media & Internet</option>
							<option value="Non-Profit & Professional Orgs.">Non-Profit & Professional Orgs.</option>
							<option value="Retail">Retail</option>
							<option value="Software">Software</option>
							<option value="Telecommunications">Telecommunications</option>
							<option value="Transportation">Transportation</option>
						</select>
          </div>
          <div class="form-group">
            <label for="CustomerAssessor" class="control-label">Customer Assessor:</label>
            <input id="CustomerAssessor" name="CustomerAssessor" type="text" class="form-control">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="edit-ok" type="button" data-dismiss="modal" onclick="save(this, 'form'); return false;">Create</button>
      </div>
    </div>
  </div>
</div>