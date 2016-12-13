<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link href="../../../../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../../../resources/css/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../../../resources/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../../../resources/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">MU</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${contextPath}/secure">Члены Федерации</a></li>
                <li><a href="${contextPath}/secure/dogs">Собаки Федерации</a></li>
                <li><a href="${contextPath}/secure/events">Соревнования Федерации</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Настройки<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${contextPath}/secure/fci">FCI группы</a></li>
                        <li><a href="${contextPath}/secure/classes">Классы соревнований</a></li>
                        <li><a href="${contextPath}/secure/breeds">Породы собак</a></li>
                        <li><a href="${contextPath}/secure/judges">Типы судьей</a></li>
                        <li><a href="${contextPath}/secure/ranks">Ранги</a></li>
                        <li><a href="${contextPath}/secure/federations">Федерации</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Профиль</h3>
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="surname" class="col-sm-2 control-label">Фамилия</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="surname">${member.surname}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="name">${member.name}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="fathername">${member.fathername}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="city">${member.city}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="phoneNumber">${member.phonenumber}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="email">${member.email}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">Пол</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="sex">${member.sex}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateBirth" class="col-sm-2 control-label">Дата рождения(год/месяц/день)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="dateBirth">${member.datebirth}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateenter" class="col-sm-2 control-label">Дата вступления(год/месяц/день)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="dateenter">${member.dateenter}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="img" class="col-sm-2 control-label">Копия заявления</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="img"><img src="${member.img}"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10>
                        <a href="${contextPath}/secure" class="btn bg-info">Назад</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../../../resources/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../../../resources/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
