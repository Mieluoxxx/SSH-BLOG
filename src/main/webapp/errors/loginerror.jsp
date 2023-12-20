<%--
  Created by IntelliJ IDEA.
  User: moguw
  Date: 2023/12/20
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <%@include file="../component/static.jsp" %>
    <style>
        /* Add your custom styles here */
        .modal {
            text-align: center;
        }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            max-width: 80vw;
        }
    </style>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- Remove the close button from the modal header -->
            <div class="modal-header">
                <h5 class="modal-title" id="errorModalLabel">Error</h5>
            </div>
            <div class="modal-body">
                <p>查无此用户，请先注册。</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="signup.jsp">确认</a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        // Show the modal when the page is loaded
        $('#errorModal').modal('show');
    });
</script>

</body>
</html>