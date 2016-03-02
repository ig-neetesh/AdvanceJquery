<%--
  Created by IntelliJ IDEA.
  User: neetesh
  Date: 2/3/16
  Time: 9:10 PM
--%>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addContactModalLabel">New Contact</h4>
    </div>

    <div class="modal-body">
        <form>
            <div class="form-group">
                <label for="name" class="control-label">Name:</label>
                <input type="text" class="form-control" id="name">
            </div>

            <div class="form-group">
                <label for="mobile" class="control-label">Mobile:</label>
                <input type="text" class="form-control" id="mobile">
            </div>

            <div class="form-group">
                <label for="email" class="control-label">Email:</label>
                <input type="text" class="form-control" id="email">
            </div>

            <div class="form-group">
                <label for="circle" class="control-label">Circle:</label>
                <select class="form-control" id="circle">
                    <option>FAMILY</option>
                    <option>FRIEND</option>
                    <option>COLLEAGUE</option>
                </select>
            </div>
        </form>
    </div>

    <div class="modal-footer">
        <div class="loader pull-left hidden">
            <asset:image src="spinner.gif"/> Saving...
        </div>

        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="save" class="btn btn-primary">Save</button>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var onContactSave = function (contact) {
//            console.log(contact);
            $("#addContactModalLabel").html("Success");
            $(".modal-body").html("Your contact with name <b>" + contact.name + "</b> has been saved");
            $(".modal-footer").remove();
        };

        $("#save").click(function () {
            $(".loader").toggleClass("hidden");
            var data = {
                name: $("#name").val(),
                email: $("#email").val(),
                mobile: $("#mobile").val(),
                circle: $("#circle").val()
            };

            $.post("/contact/save", data, onContactSave);
        });

    });
</script>