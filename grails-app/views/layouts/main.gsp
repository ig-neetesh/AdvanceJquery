<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="bootstrap.css"/>
    <asset:javascript src="jquery-2.2.1.js"/>
    <asset:javascript src="bootstrap.js"/>
    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Contacts</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
            <form class="navbar-form navbar-left" role="search">
                <button id="loadModal" type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#sendEmailModal">Add</button>
            </form>
        </div>
    </div>
</nav>
<g:layoutBody/>
<div class="modal fade" id="sendEmailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document" id="modalBody">
        <div class="panel panel-default">
            <div class="panel-body">
                <asset:image src="spinner.gif"/> Loading...
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var loadModal = function () {
            $.post("/contact/add", function (response) {
                $('#modalBody').html(response);
            });
        };

        $('#loadModal').click(loadModal);
    });
</script>
</body>
</html>
