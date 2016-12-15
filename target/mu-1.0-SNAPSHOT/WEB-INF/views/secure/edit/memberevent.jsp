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

    <!-- Bootstrap core CSS -->
    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../../resources/css/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../../resources/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../../resources/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<c:import url="../head.jsp"/>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Профиль</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="memberEventCreateForm" action="${contextPath}/secure/memberevent-edit">
                <input type="number" id="idevent" name="idevent" value="${memberevent.idevent}" hidden>
                <input type="number" id="id" name="id" value="${memberevent.id}" hidden>
                <div class="form-group">
                    <label for="surname" class="col-sm-2 control-label">Фамилия</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.surname}" class="form-control" id="surname" name="surname" placeholder="Фамилия" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.name}" class="form-control" id="name" name="name" placeholder="Имя" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.fathername}" class="form-control" id="fathername" name="fathername" placeholder="Отчество" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.city}" name="city" id="city" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="club" class="col-sm-2 control-label">Клуб</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.club}" name="club" id="club" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                    <div class="col-sm-10">
                        <input type="date" value="${memberevent.datebirth}" name="datebirth" class="form-control" id="datebirth"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.email}" name="email" id="email" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.numberphone}" name="numberphone" id="numberphone" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descr" class="col-sm-2 control-label">Примечания</label>
                    <div class="col-sm-10">
                        <input type="text" value="${memberevent.descr}" name="descr" id="descr" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="idclassrace" id="idclassrace">
                            <c:forEach items="${classes}" var="clazz">
                                <c:if test="${clazz.id == memberevent.idclassrace}">
                                    <option value="${clazz.id}">${clazz.classrace}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${classes}" var="clazz">
                                <c:if test="${clazz.id != memberevent.idclassrace}">
                                    <c:if test="${clazz.season eq event.season}">
                                        <option value="${clazz.id}">${clazz.classrace}</option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Сохранить</button>
                    <a href="${contextPath}/secure/event-view?id=${memberevent.idevent}" class="btn bg-info">Назад</a>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../../resources/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../../resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
