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
<c:import url="../head.jsp"/>
<div class="modal fade" id="createDogEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Добавить собаку</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" name="dogCreateForm" method="post" action="${contextPath}/secure/dogevent-create">
                    <input type="number" id="idevent" name="idevent" value="${memberevent.idevent}" hidden>
                    <input type="number" id="idmember" name="idmember" value="${memberevent.id}" hidden>
                    <div class="form-group">
                        <label for="fioowner" class="col-sm-2 control-label">ФИО хозяина</label>
                        <div class="col-sm-10">
                            <input type="text" value="${memberevent.surname} ${memberevent.name} ${memberevent.fathername}" class="form-control" id="fioowner" name="fioowner" placeholder="ФИО хозяина" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nameonpedigree" class="col-sm-2 control-label">Кличка собаки по родословной</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nameonpedigree" name="nameonpedigree" placeholder="Кличка собаки по родословной">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sex" class="col-sm-2 control-label">Пол собаки</label>
                        <div class="col-sm-10">
                            <select class="input-medium search-query" name="sex" id="sex" required>
                                <option>Кабель</option>
                                <option>Сука</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="datebirth" name="datebirth" placeholder="Дата" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idbreed" class="col-sm-2 control-label">Порода</label>
                        <div class="col-sm-10">
                            <select class="input-medium search-query" name="idbreed" id="idbreed">
                                <c:forEach items="${breeds}" var="breed">
                                    <option value="${breed.id}">${breed.breed}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="marknumber" class="col-sm-2 control-label">Номер клейма</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="marknumber" name="marknumber" placeholder="Номер клейма">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numberchip" class="col-sm-2 control-label">Номер чипа</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberchip" name="numberchip" placeholder="Номер чипа">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                        <div class="col-sm-10">
                            <select class="input-medium search-query" name="idfederation" id="idfederation">
                                <c:forEach items="${federations}" var="federation">
                                    <option value="${federation.id}">${federation.federation}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numberpedigree" class="col-sm-2 control-label">Номер родослвной</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberpedigree" name="numberpedigree" placeholder="Номер родослвной">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numberbookkv" class="col-sm-2 control-label">Номер квалификационной книжки</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberbookkv" name="numberbookkv" placeholder="Номер квалификационной книжки">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inqualification" class="col-sm-2 control-label">Собака участвует в квалификации</label>
                        <div class="col-sm-10">
                            <select class="input-medium search-query" name="inqualification" id="inqualification">
                                <option value="false">Нет</option>
                                <option value="true">Да</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Подтвердить</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
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
                        <div class="form-control" id="surname">${memberevent.surname}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="name">${memberevent.name}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="fathername">${memberevent.fathername}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                    <div class="col-sm-10">
                        <div name="datebirth" class="form-control" id="datebirth">${memberevent.datebirth}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <div name="city" id="city" class="form-control">${memberevent.city}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <div name="numberphone" id="numberphone" class="form-control">${memberevent.numberphone}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <div name="email" id="email" class="form-control">${memberevent.email}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="club" class="col-sm-2 control-label">Клуб</label>
                    <div class="col-sm-10">
                        <div name="club" id="club" class="form-control">${memberevent.club}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                    <div class="col-sm-10">
                        <div name="idclassrace" id="idclassrace" class="form-control">${clazz.classrace}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descr" class="col-sm-2 control-label">Примечания</label>
                    <div class="col-sm-10">
                        <div name="descr" id="descr" class="form-control">${memberevent.descr}</div>
                    </div>
                </div>
                <a href="${contextPath}/secure/event-view?id=${memberevent.idevent}" class="btn btn-success">Назад</a>
            </div>
        </div>
    </div>
    <BR>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Собаки</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Кличка собаки по родословной</th>
                        <th>Порода</th>
                        <th>Пол собаки</th>
                        <th>Дата рождения</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dogevents}" var="dogevent">
                        <tr>
                            <td>${dogevent.nameonpedigree}</td>
                            <c:forEach items="${breeds}" var="breed">
                                <c:if test="${breed.id == dogevent.idbreed}">
                                    <td>${breed.breed}</td>
                                </c:if>
                            </c:forEach>
                            <td>${dogevent.sex}</td>
                            <td>${dogevent.datebirth}</td>
                            <td><a class="btn-success" href="${contextPath}/secure/dogevent-view?id=${dogevent.id}&idmember=${dogevent.idmember}">Просмотр</a><a class="btn-default" href="${contextPath}/secure/dogevent-edit?id=${dogevent.id}">Редактировать</a><a class="btn-danger" href="${contextPath}/secure/dogevent-delete?id=${dogevent.id}&idmember=${dogevent.idmember}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createDogEvent">
                    Добавить
                </button>
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
