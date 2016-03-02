<%--
  Created by IntelliJ IDEA.
  User: neetesh
  Date: 2/3/16
  Time: 9:10 PM
--%>
<asset:javascript src="jquery.validate.js"/>
<style>
.error {
    color: #ff0000;
}
</style>

<form id="addContactForm" action="/contact/save" method="POST">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="addContactModalLabel">New Contact</h4>
        </div>

        <div class="modal-body">

            <div class="form-group">
                <label for="name" class="control-label">Name:</label>
                <input type="text" class="form-control" name="nameField" id="name">
            </div>

            <div class="form-group">
                <label for="mobile" class="control-label">Mobile:</label>
                <input type="text" class="form-control" name="mobileField" id="mobile">
            </div>

            <div class="form-group">
                <label for="email" class="control-label">Email:</label>
                <input type="text" class="form-control" name="emailField" id="email">
            </div>

            <div class="form-group">
                <label for="circle" class="control-label">Circle:</label>
                <select class="form-control" name="circleField" id="circle">
                    <option>FAMILY</option>
                    <option>FRIEND</option>
                    <option>COLLEAGUE</option>
                </select>
            </div>

        </div>

        <div class="modal-footer">
            <div class="loader pull-left hidden">
                <asset:image src="spinner.gif"/> Saving...
            </div>

            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="submit" id="save" class="btn btn-primary">Save</button>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function () {
        jQuery.validator.addMethod("circle", function (value, element) {
            var result = true;
            var email = $("#email").val();
            if (email.endsWith("@tothenew.com")) {
                result = (value == "COLLEAGUE");
            }
            return result;
        }, "Circle value is not valid");


        $("#addContactForm").validate({
            debug: true,
            rules: {
                nameField: {
                    required: true,
                    minlength: 4
                },
                mobileField: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 10,
                    remote: "/contact/isContactExists"
                },
                emailField: {
                    email: true
                },
                circleField: {
                    circle: true
                }
            },
            messages: {
                mobileField: {
                    remote: jQuery.validator.format("Contact with {0} already exists.")
                }
            },
            submitHandler: function (form) {
                var isValidForm = $("#addContactForm").valid();
                if (isValidForm) {
                    $(".loader").toggleClass("hidden");
                    var data = {
                        name: $("#name").val(),
                        email: $("#email").val(),
                        mobile: $("#mobile").val(),
                        circle: $("#circle").val()
                    };

                    $.post(form.action, data, onContactSave);
                }
            }
        });

        var onContactSave = function (contact) {
            $("#addContactModalLabel").html("Success");
            $(".modal-body").html("Your contact with name <b>" + contact.name + "</b> has been saved");
            $(".modal-footer").remove();
        };

    });
</script>