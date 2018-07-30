

<!--#################-->
<!-- EDIT MODAL FORM -->
<!--#################-->
<script>
	function getLoadUrl(id){
		return Utils.SERVER+"/api/pathfinder/customers/"+Utils.getParameterByName("customerId")+"/members/"+id+"/";
	}
	function getSaveUrl(id){
		return Utils.SERVER+"/api/pathfinder/customers/"+Utils.getParameterByName("customerId")+"/members/";
	}
	function getIdFieldName(){
		return "Id";
	}
</script>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document"> <!-- make wider by adding " modal-lg" to class -->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New Member</h4>
      </div>
      <div class="modal-body">
        <form id="form">
        	<div id="form-id" class="form-group" style="display:none">
            <label for="Id" class="control-label">Id:</label>
            <input id="Id" name="Id" type="text" class="form-control"/>
          </div>
          <div class="form-group">
            <label for="Username" class="control-label">Username:</label>
            <input id="Username" name="Username" type="text" class="form-control" onkeyup="validate()">
          </div>
          <div class="form-group">
            <label for="Password" class="control-label">Password:</label>
            <input id="Password" name="Password" type="password" class="form-control" onkeyup="validate()">
          </div>
          <div class="form-group">
            <label for="Password2" class="control-label">Password Confirmation:</label>
            <input id="Password2" name="Password2" type="password" class="form-control" onkeyup="validate()">
          </div>
          <div class="form-group">
            <label for="Email" class="control-label">Email:</label>
            <input id="Email" name="Email" type="text" class="form-control" onkeyup="validate()">
          </div>
          <div class="form-group">
            <label for="DisplayName" class="control-label">Display Name:</label>
            <input id="DisplayName" name="DisplayName" type="text" class="form-control" onkeyup="validate()">
          </div>
        </form>
      </div>
      <script>
      function validate(){
	      $('#edit-ok').attr('disabled', isEmpty($('#Username').val()) || isEmpty($('#Password').val()) || isEmpty($('#Email').val()) || $('#Password').val()!=$('#Password2').val())
      }
      function isEmpty(val){
      	return val==null || val=="";
      }
      </script>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="edit-ok" type="button" data-dismiss="modal" disabled onclick="save('form'); return false;">Create</button>
      </div>
    </div>
  </div>
</div>