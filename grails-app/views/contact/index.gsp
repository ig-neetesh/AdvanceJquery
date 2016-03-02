<%--
  Created by IntelliJ IDEA.
  User: neetesh
  Date: 2/3/16
  Time: 8:49 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Contacts</title>
</head>

<body>
<table class="table">
    <thead>
    <tr>
        <th>Name</th>
        <th>Mobile</th>
        <th>Email</th>
        <th>Circle</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${contacts}" var="contact">
        <tr id="${contact.id}">
            <td>${contact.name}</td>
            <td>${contact.mobile}</td>
            <td>${contact.email}</td>
            <td>
                <select class="circle form-control">
                    <g:each in="['FAMILY', 'FRIEND', 'COLLEAGUE']" var="c">
                        <option ${c == contact.circle ? "selected" : ""}>${c}</option>
                    </g:each>
                </select>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script type="text/javascript">
    $(document).ready(function () {

        var changeCircle = function (id, newValue) {
            var data = {
                id: id,
                circle: newValue
            };
            $.post("/contact/updateCircle", data, function (contact) {
                console.log("Circle has been updated");
            });
        };

        $(".circle").change(function (e) {
            var id = e.target.closest("tr").id;
            var newValue = e.target.value;
            changeCircle(id, newValue);
        });
    });
</script>
</body>
</html>