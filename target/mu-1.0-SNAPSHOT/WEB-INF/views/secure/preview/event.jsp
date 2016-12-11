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
                <li><a href="${contextPath}/secure">Члены Федерации</a></li>
                <li><a href="${contextPath}/secure/dogs">Собаки Федерации</a></li>
                <li class="active"><a href="${contextPath}/secure/events">Соревнования Федерации</a></li>
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
    <div class="form-horizontal">
        <div class="form-group">
            <label for="headerEvent" class="col-sm-2 control-label">Название мероприятия</label>
            <div class="col-sm-10">
                <div class="form-control" id="headerEvent">${event.headerevent}</div>
            </div>
        </div>
        <div class="form-group">
            <label for="organizers" class="col-sm-2 control-label">Организаторы</label>
            <div class="col-sm-10">
                <div class="form-control" id="organizers">${event.organizers}</div>
            </div>
        </div>
        <div class="form-group">
            <label for="place" class="col-sm-2 control-label">Место провождения</label>
            <div class="col-sm-10">
                <div class="form-control" id="place">${event.place}</div>
            </div>
        </div>
        <div class="form-group">
            <label for="season" class="col-sm-2 control-label">Сезон</label>
            <div class="col-sm-10">
                <div class="form-control" id="season">${event.season}</div>
            </div>
        </div>
        <div class="form-group">
            <label for="idRank" class="col-sm-2 control-label">Ранг</label>
            <div class="col-sm-10">
                <div class="form-control" id="idRank">${rank.rank}</div>
            </div>
        </div>
        <div class="form-group">
            <label for="dateStart" class="col-sm-2 control-label">Дата (год/месяц/день)</label>
            <div class="col-sm-10">
                <div class="form-control" id="dateStart">${event.datestart}</div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-10">
                <a href="${contextPath}/secure/events" class="btn bg-info">Назад</a>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Добавить участника</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="memberEventCreateForm" action="${contextPath}/secure/memberevent-create">
                <input type="number" id="idevent" name="idevent" value="${event.id}" hidden>
                <div class="form-group">
                    <label for="fio" class="col-sm-2 control-label">Фамилия Имя Отчество</label>
                    <div class="col-sm-10">
                        <input type="text" name="fio" id="fio" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <input type="text" name="city" id="city" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="club" class="col-sm-2 control-label">Клуб</label>
                    <div class="col-sm-10">
                        <input type="text" name="club" id="club" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                    <div class="col-sm-10">
                        <input type="date" name="datebirth" class="input-medium search-query" id="datebirth"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" name="email" id="email" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <input type="text" name="numberphone" id="numberphone" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descr" class="col-sm-2 control-label">Примечания</label>
                    <div class="col-sm-10">
                        <input type="text" name="descr" id="descr" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="idclassrace" id="idclassrace">
                            <c:forEach items="${classes}" var="clazz">
                                <c:if test="${clazz.season eq event.season}">
                                    <option value="${clazz.id}">${clazz.classrace}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Создать</button>
                </div>
            </form>
        </div>
    </div>
    <BR>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Участники</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Фамилия Имя Отчество</th>
                        <th>Откуда</th>
                        <th>Тип</th>
                        <th>Дата рождения</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberEvents}" var="memberEvent">
                        <tr>
                            <td>${memberEvent.fio}</td>
                            <td>${memberEvent.city}</td>
                            <c:forEach items="${classes}" var="clazz">
                                <c:if test="${clazz.id == memberEvent.idclassrace}">
                                    <td>${clazz.classrace}</td>
                                </c:if>
                            </c:forEach>
                            <td>${memberEvent.datebirth}</td>
                            <td><a class="btn-success" href="${contextPath}/secure/memberevent-view?id=${memberEvent.id}&idevent=${event.id}">Просмотр</a><a class="btn-default" href="${contextPath}/secure/memberevent-edit?id=${memberEvent.id}&idevent=${event.id}">Редактировать</a><a class="btn-danger" href="${contextPath}/secure/memberevent-delete?id=${memberEvent.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Добавить судью</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="judgeCreateForm" action="${contextPath}/secure/judge-create">
                <input type="number" id="idEvent" name="idEvent" value="${event.id}" hidden>
                <div class="form-group">
                    <label for="fio" class="col-sm-2 control-label">Фамилия Имя Отчество</label>
                    <div class="col-sm-10">
                        <input type="text" name="fio" id="fio" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="judgeFrom" class="col-sm-2 control-label">Откуда</label>
                    <div class="col-sm-10">
                        <input type="text" name="judgeFrom" id="judgeFrom" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="typeId" class="col-sm-2 control-label">Тип</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="typeId" id="typeId">
                            <c:forEach items="${judgeTypes}" var="judgeType">
                                <option value="${judgeType.id}">${judgeType.type}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Создать</button>
                </div>
            </form>
        </div>
    </div>
    <BR>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Судьи</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Фамилия Имя Отчество</th>
                        <th>Откуда</th>
                        <th>Тип</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${judges}" var="judge">
                        <tr>
                            <td>${judge.fio}</td>
                            <td>${judge.judgefrom}</td>
                            <c:forEach items="${judgeTypes}" var="judgeType">
                                <c:if test="${judgeType.id == judge.typeid}">
                                    <td>${judgeType.type}</td>
                                </c:if>
                            </c:forEach>
                            <td><a class="btn-danger" href="${contextPath}/secure/judge-delete?id=${judge.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <c:if test="${empty distances}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Добавить дистанцию</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="distanceCreateForm" action="${contextPath}/secure/distance-create">
                <input type="number" id="idEvent" name="idEvent" value="${event.id}" hidden>
                <div class="form-group">
                    <label for="stadion" class="col-sm-2 control-label">Стадион</label>
                    <div class="col-sm-10">
                        <input type="text" name="stadion" id="stadion" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="countRound" class="col-sm-2 control-label">Количество кругов</label>
                    <div class="col-sm-10">
                        <input type="text" name="countRound" id="countRound" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lengthRound" class="col-sm-2 control-label">Длина круга</label>
                    <div class="col-sm-10">
                        <input type="text" name="lengthRound" id="lengthRound" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lowerDot" class="col-sm-2 control-label">Низшая точка</label>
                    <div class="col-sm-10">
                        <input type="text" name="lowerDot" id="lowerDot" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="upperDot" class="col-sm-2 control-label">Высшая точка</label>
                    <div class="col-sm-10">
                        <input type="text" name="upperDot" id="upperDot" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tair" class="col-sm-2 control-label">Температура воздуха</label>
                    <div class="col-sm-10">
                        <input type="text" name="tair" id="tair" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tsnow" class="col-sm-2 control-label">Температура снега</label>
                    <div class="col-sm-10">
                        <input type="text" name="tsnow" id="tsnow" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="view" class="col-sm-2 control-label">Вид</label>
                    <div class="col-sm-10">
                        <input type="text" name="view" id="view" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="weather" class="col-sm-2 control-label">Погода</label>
                    <div class="col-sm-10">
                        <input type="text" name="weather" id="weather" class="input-medium search-query"/>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn">Создать</button>
                </div>
            </form>
        </div>
    </div>
    </c:if>
    <BR>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Дистанция</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Стадион</th>
                        <th>Количество кругов</th>
                        <th>Длина круга</th>
                        <th>Низшая точка</th>
                        <th>Высшая точка</th>
                        <th>Температура воздуха</th>
                        <th>Температура снега</th>
                        <th>Вид</th>
                        <th>Погода</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${distances}" var="distance">
                        <tr>
                            <td>${distance.stadion}</td>
                            <td>${distance.countround}</td>
                            <td>${distance.lengthround}</td>
                            <td>${distance.lowerdot}</td>
                            <td>${distance.upperdot}</td>
                            <td>${distance.tair}</td>
                            <td>${distance.tsnow}</td>
                            <td>${distance.view}</td>
                            <td>${distance.weather}</td>
                            <td><a class="btn-danger" href="${contextPath}/secure/distance-delete?id=${distance.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
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
