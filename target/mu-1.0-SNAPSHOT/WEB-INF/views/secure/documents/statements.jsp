<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Информационная База</title>
</head>

<body>
<c:import url="../head.jsp"/>
<div class="container">
    <form class="form-horizontal" method="post" action="${contextPath}/statements/upload" enctype="multipart/form-data">
        <div class="form-group">
            <label for="data" class="col-sm-2 control-label">File (Max size 20MB)</label>
            <div class="col-lg-6">
                <input type="file" class="form-control" id="data" name="data" multiple="multiple" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Upload</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                ${error}
            </div>
        </div>
    </form>
    <div class="panel panel-default">
        <div class="panel-heading">Заявления</div>
        <div class="panel-body">
            <c:forEach items="${files}" var="file">
            <a href="${contextPath}/statements/download?filename=${file.name}">${file.name}<BR>
                </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
