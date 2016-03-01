<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>

<button id="loadModal" type="button" class="btn btn-primary" data-toggle="modal"
        data-target="#sendEmailModal">Open modal</button>

<div class="modal fade" id="sendEmailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document" id="modalBody">
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var url = "${g.createLink(controller: 'sample', action: 'index')}";

        var loadModal = function () {
            $.post(url, function (response) {
                $('#modalBody').html(response);
            });
        };

        $('#loadModal').click(loadModal);
    });
</script>
</body>
</html>
