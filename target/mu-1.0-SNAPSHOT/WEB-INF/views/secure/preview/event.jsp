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
    <div class="modal fade" id="createMemberEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Добавить участника</h4>
                </div>
                <div class="modal-body">
                    <div class="radio">
                        <button style="display: none" id="buttonCreate" class="btn btn-default" onclick="hideChoose()">Создать</button>
                        <button id="buttonChoose" class="btn btn-default" onclick="hideCreate()">Выбрать</button>
                    </div>
                    <form class="form-horizontal" method="post" id="memberEventCreateForm" action="${contextPath}/memberevent-create">
                        <input type="number" id="idevent" name="idevent" value="${event.id}" hidden>
                        <div class="form-group" id="surnameForm-group">
                            <label for="surnameForm" class="col-sm-2 control-label">Фамилия</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="surnameForm" name="surname" placeholder="Фамилия" required>
                            </div>
                        </div>
                        <div class="form-group" id="nameForm-group">
                            <label for="nameForm" class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nameForm" name="name" placeholder="Имя" required>
                            </div>
                        </div>
                        <div class="form-group" id="fathernameForm-group">
                            <label for="fathernameForm" class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="fathernameForm" name="fathername" placeholder="Отчество" required>
                            </div>
                        </div>
                        <div class="form-group" id="datebirthForm-group">
                            <label for="datebirthForm" class="col-sm-2 control-label">Дата </label>
                            <div class="col-sm-10">
                                <input type="date" name="datebirth" class="form-control" id="datebirthForm"/>
                            </div>
                        </div>
                        <div class="form-group" id="cityForm-group">
                            <label for="cityForm" class="col-sm-2 control-label">Город</label>
                            <div class="col-sm-10">
                                <input type="text" name="city" id="cityForm" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" id="numberphoneForm-group">
                            <label for="numberphoneForm" class="col-sm-2 control-label">Телефон</label>
                            <div class="col-sm-10">
                                <input type="text" name="numberphone" id="numberphoneForm" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" id="emailForm-group">
                            <label for="emailForm" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" id="emailForm" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" id="clubForm-group">
                            <label for="clubForm" class="col-sm-2 control-label">Клуб</label>
                            <div class="col-sm-10">
                                <input type="text" name="club" id="clubForm" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                            <div class="col-sm-10">
                                <select class="selectpicker" name="idclassrace" id="idclassrace" required>
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
                    <form class="form-horizontal" method="get" style="display: none;" id="memberEventChooseForm" action="${contextPath}/memberevent-choose">
                        <input type="number" id="idevent" name="idevent" value="${event.id}" hidden>
                        <div class="form-group" id="idMemberForm-group">
                            <label for="idMemberForm" class="col-sm-2 control-label">Спортсмен</label>
                            <div class="col-sm-10">
                                <select id="idMemberForm" name="idmember" class="selectpicker" data-live-search="true" data-live-search-placeholder data-liveSearchNormalize="true" required>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                            <div class="col-sm-10">
                                <select class="selectpicker" name="idclassrace" id="idclassrace" required>
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
                                <button type="submit" class="btn">Добавить</button>
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
                                <select class="selectpicker" name="typeId" id="typeId">
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
        </div>
    </div>
</div>
<script type="text/javascript">

    function hideChoose() {
        $('#buttonCreate').hide();
        $('#buttonChoose').show();
        $('#memberEventCreateForm').show();
        $('#memberEventChooseForm').hide();
//        document.getElementById("idMemberForm").disabled=true;
//        $('#idMemberForm-group').hide();
//        $('#surnameForm-group').show();
//        $('#nameForm-group').show();
//        $('#fathernameForm-group').show();
//        $('#datebirthForm-group').show();
//        $('#cityForm-group').show();
//        $('#numberphoneForm-group').show();
//        $('#emailForm-group').show();
//        $('#clubForm-group').show();
//        document.getElementById("surnameForm").disabled=false;
//        document.getElementById("nameForm").disabled=false;
//        document.getElementById("fathernameForm").disabled=false;
//        document.getElementById("datebirthForm").disabled=false;
//        document.getElementById("cityForm").disabled=false;
//        document.getElementById("numberphoneForm").disabled=false;
//        document.getElementById("emailForm").disabled=false;
//        document.getElementById("clubForm").disabled=false;
    }

    function hideCreate() {
//        document.getElementById("idMemberForm").disabled=false;
        $('#buttonCreate').show();
        $('#buttonChoose').hide();
        $('#memberEventCreateForm').hide();
        $('#memberEventChooseForm').show();
//        $('#idMemberForm-group').show();
//        $('#surnameForm-group').hide();
//        $('#nameForm-group').hide();
//        $('#fathernameForm-group').hide();
//        $('#datebirthForm-group').hide();
//        $('#cityForm-group').hide();
//        $('#numberphoneForm-group').hide();
//        $('#emailForm-group').hide();
//        $('#clubForm-group').hide();
//        document.getElementById("surnameForm").disabled=true;
//        document.getElementById("nameForm").disabled=true;
//        document.getElementById("fathernameForm").disabled=true;
//        document.getElementById("datebirthForm").disabled=true;
//        document.getElementById("cityForm").disabled=true;
//        document.getElementById("numberphoneForm").disabled=true;
//        document.getElementById("emailForm").disabled=true;
//        document.getElementById("clubForm").disabled=true;
    }

    function getList() {
        name = $('#searchInput').val();
        $.ajax({
            url: '/ajax/members',
            data: { name: name} ,
            contentType: "application/json;charset:UTF-8",
            dataType:"json" ,
            success: function(data){
                memberString = '';
                $("#idMemberForm").empty();
                $.each(data, function(index) {
                    memberString += "<option value='" + data[index].id + "'>" + data[index].name + "</option>";
                });
                $('#idMemberForm').append(memberString);
                $('#idMemberForm').selectpicker('refresh');
            }
        });
    }
</script>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
