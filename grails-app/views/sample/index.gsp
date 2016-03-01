<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
    </div>

    <div class="modal-body">
        <form>
            <div class="form-group">
                <label for="email" class="control-label">Email:</label>
                <input type="text" class="form-control" id="email">
            </div>

            <div class="form-group">
                <label for="message" class="control-label">Message:</label>
                <textarea class="form-control" id="message"></textarea>
            </div>
        </form>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="send" class="btn btn-primary">Send message</button>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var url = "${g.createLink(controller: 'sample', action: 'sendMail')}";

        var successCallback = function (response) {
            $("#exampleModalLabel").html("Success");
            $(".modal-body").html(response);
            $("#send").remove();
        };

        var sendMessage = function () {
            var data = {
                email: $("#email").val(),
                message: $("#message").val()
            };

            $.post(url, data, successCallback);
        };

        $("#send").click(sendMessage);

    });
</script>