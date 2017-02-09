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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Профиль</h3>
        </div>
        <div class="panel-body">
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
                    <label for="dateStart" class="col-sm-2 control-label">Дата (год/месяц/день)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="dateStart">${event.datestart}</div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10">
                        <a href="${contextPath}/events" class="btn bg-info">Назад</a>
                        <a href="${contextPath}/time?idevent=${event.id}" class="btn bg-info">Добавить время ко всем участникам</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="addMemberEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Добавить участника</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="memberEventCreateForm" action="${contextPath}/memberevent-create">
                        <input type="number" id="idevent" name="idevent" value="${event.id}" hidden>
                        <div class="form-group">
                            <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                            <div class="col-sm-10">
                                <input type="date" name="datebirth" class="form-control" id="datebirth"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-2 control-label">Город</label>
                            <div class="col-sm-10">
                                <input type="text" name="city" id="city" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                            <div class="col-sm-10">
                                <input type="text" name="numberphone" id="numberphone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" id="email" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="club" class="col-sm-2 control-label">Клуб</label>
                            <div class="col-sm-10">
                                <input type="text" name="club" id="club" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="idclassrace" id="idclassrace">
                                    <c:forEach items="${classes}" var="clazz">
                                        <c:if test="${clazz.season eq event.season}">
                                            <option value="${clazz.id}">${clazz.classrace}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descr" class="col-sm-2 control-label">Примечания</label>
                            <div class="col-sm-10">
                                <input type="text" name="descr" id="descr" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <button type="submit" class="btn">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="createMemberEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Добавить участника</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="memberEventCreateForm" action="${contextPath}/memberevent-create">
                        <input type="number" id="idevent" name="idevent" value="${event.id}" hidden>
                        <div class="form-group">
                            <label for="surname" class="col-sm-2 control-label">Фамилия</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="surname" name="surname" placeholder="Фамилия" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Имя" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="fathername" name="fathername" placeholder="Отчество" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                            <div class="col-sm-10">
                                <input type="date" name="datebirth" class="form-control" id="datebirth"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-2 control-label">Город</label>
                            <div class="col-sm-10">
                                <input type="text" name="city" id="city" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                            <div class="col-sm-10">
                                <input type="text" name="numberphone" id="numberphone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" id="email" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="club" class="col-sm-2 control-label">Клуб</label>
                            <div class="col-sm-10">
                                <input type="text" name="club" id="club" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="idclassrace" id="idclassrace">
                                    <c:forEach items="${classes}" var="clazz">
                                        <c:if test="${clazz.season eq event.season}">
                                            <option value="${clazz.id}">${clazz.classrace}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descr" class="col-sm-2 control-label">Примечания</label>
                            <div class="col-sm-10">
                                <input type="text" name="descr" id="descr" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <button type="submit" class="btn">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Участники</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Отчество</th>
                        <th>Откуда</th>
                        <th>Тип</th>
                        <th>Дата рождения</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberEvents}" var="memberEvent">
                        <tr>
                            <td>${memberEvent.surname}</td>
                            <td>${memberEvent.name}</td>
                            <td>${memberEvent.fathername}</td>
                            <td>${memberEvent.city}</td>
                            <td>${memberEvent.clazz.classrace}</td>
                            <td>${memberEvent.datebirth}</td>
                            <td><a class="btn-success" href="${contextPath}/memberevent-view?id=${memberEvent.id}&idevent=${event.id}">Просмотр</a><a class="btn-default" href="${contextPath}/memberevent-edit?id=${memberEvent.id}&idevent=${event.id}">Редактировать</a><a class="btn-danger" href="${contextPath}/memberevent-delete?id=${memberEvent.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createMemberEvent">
                    Cоздать участника
                </button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addMemberEvent">
                    Добавить участника из ИБ
                </button>
            </div>
        </div>
    </div>

    <div class="modal fade" id="createJudge" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Добавить судью</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="judgeCreateForm" action="${contextPath}/judge-create">
                        <input type="number" id="idEvent" name="idEvent" value="${event.id}" hidden>
                        <div class="form-group">
                            <label for="fio" class="col-sm-2 control-label">Фамилия Имя Отчество</label>
                            <div class="col-sm-10">
                                <input type="text" name="fio" id="fio" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="judgeFrom" class="col-sm-2 control-label">Откуда</label>
                            <div class="col-sm-10">
                                <input type="text" name="judgeFrom" id="judgeFrom" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="typeId" class="col-sm-2 control-label">Тип</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="typeId" id="typeId">
                                    <c:forEach items="${judgeTypes}" var="judgeType">
                                        <option value="${judgeType.id}">${judgeType.type}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <button type="submit" class="btn">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
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
                            <td>${judge.type.type}</td>
                            <td><a class="btn-danger" href="${contextPath}/judge-delete?id=${judge.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createJudge">
                    Добавить судью
                </button>
            </div>
        </div>
    </div>
    <div class="modal fade" id="createDistance" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" id="distanceCreateForm" action="${contextPath}/distance-create">
                        <input type="number" id="idEvent" name="idEvent" value="${event.id}" hidden>
                        <div class="form-group">
                            <label for="stadion" class="col-sm-2 control-label">Стадион</label>
                            <div class="col-sm-10">
                                <input type="text" name="stadion" id="stadion" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="countRound" class="col-sm-2 control-label">Количество кругов</label>
                            <div class="col-sm-10">
                                <input type="text" name="countRound" id="countRound" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lengthRound" class="col-sm-2 control-label">Длина круга</label>
                            <div class="col-sm-10">
                                <input type="text" name="lengthRound" id="lengthRound" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lowerDot" class="col-sm-2 control-label">Низшая точка</label>
                            <div class="col-sm-10">
                                <input type="text" name="lowerDot" id="lowerDot" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="upperDot" class="col-sm-2 control-label">Высшая точка</label>
                            <div class="col-sm-10">
                                <input type="text" name="upperDot" id="upperDot" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tair" class="col-sm-2 control-label">Температура воздуха</label>
                            <div class="col-sm-10">
                                <input type="text" name="tair" id="tair" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tsnow" class="col-sm-2 control-label">Температура снега</label>
                            <div class="col-sm-10">
                                <input type="text" name="tsnow" id="tsnow" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="view" class="col-sm-2 control-label">Вид</label>
                            <div class="col-sm-10">
                                <input type="text" name="view" id="view" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="weather" class="col-sm-2 control-label">Погода</label>
                            <div class="col-sm-10">
                                <input type="text" name="weather" id="weather" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <button type="submit" class="btn">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
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
                            <td><a class="btn-danger" href="${contextPath}/distance-delete?id=${distance.id}&idevent=${event.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty distances}">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createDistance">
                        Добавить дистанцию
                    </button>
                </c:if>
            </div>
            <button id="mybutton" onclick="getListMembers();" type="button" class="btn btn-success"/>
                Добавить дистанцию
            </button>
        </div>
    </div>
</div>
<script type="text/javascript">
    function getListMembers () {
        $.ajax({
            url: '/ajax/members',
            contentType: "application/json;charset:UTF-8",
            dataType:"json" ,
            success: function(){

            }
        });
    }
</script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
