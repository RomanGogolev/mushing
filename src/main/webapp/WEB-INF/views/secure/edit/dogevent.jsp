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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Профиль</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal" name="dogCreateForm" method="post" action="${contextPath}/secure/dogevent-edit">
                <input type="number" id="id" name="id" value="${dogevent.id}" hidden>
                <input type="number" id="idevent" name="idevent" value="${dogevent.idevent}" hidden>
                <input type="number" id="idmember" name="idmember" value="${dogevent.idmember}" hidden>
                <div class="form-group">
                    <label for="fioowner" class="col-sm-2 control-label">ФИО хозяина</label>
                    <div class="col-sm-10">
                        <input type="text" value="${dogevent.fioowner}" class="form-control" id="fioowner" name="fioowner" placeholder="ФИО хозяина" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nameonpedigree" class="col-sm-2 control-label">Кличка собаки по родословной</label>
                    <div class="col-sm-10">
                        <input type="text" value="${dogevent.nameonpedigree}" class="form-control" id="nameonpedigree" name="nameonpedigree" placeholder="Кличка собаки по родословной">
                    </div>
                </div>
                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">Пол собаки</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="sex" id="sex" required>
                            <c:if test="${dogevent.sex eq 'Сука'}">
                                <option>Сука</option>
                            </c:if>
                            <c:if test="${dogevent.sex eq 'Кобель'}">
                                <option>Кобель</option>
                            </c:if>
                            <c:if test="${dogevent.sex ne 'Сука'}">
                                <option>Сука</option>
                            </c:if>
                            <c:if test="${dogevent.sex ne 'Кобель'}">
                                <option>Кобель</option>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                    <div class="col-sm-10">
                        <input type="date" value="${dogevent.datebirth}" class="form-control" id="datebirth" name="datebirth" placeholder="Дата" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idbreed" class="col-sm-2 control-label">Порода</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="idbreed" id="idbreed">
                            <c:forEach items="${breeds}" var="breed">
                                <c:if test="${breed.id == dogevent.idbreed}">
                                    <option value="${breed.id}">${breed.breed}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${breeds}" var="breed">
                                <c:if test="${breed.id != dogevent.idbreed}">
                                    <option value="${breed.id}">${breed.breed}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="marknumber" class="col-sm-2 control-label">Номер клейма</label>
                    <div class="col-sm-10">
                        <input type="text" value="${dogevent.marknumber}" class="form-control" id="marknumber" name="marknumber" placeholder="Номер клейма">
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberchip" class="col-sm-2 control-label">Номер чипа</label>
                    <div class="col-sm-10">
                        <input type="text" value="${dogevent.numberchip}" class="form-control" id="numberchip" name="numberchip" placeholder="Номер чипа">
                    </div>
                </div>
                <div class="form-group">
                    <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="idfederation" id="idfederation">
                            <c:forEach items="${federations}" var="federation">
                                <c:if test="${federation.id == dogevent.idfederation}">
                                    <option value="${federation.id}">${federation.federation}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${federations}" var="federation">
                                <c:if test="${federation.id != dogevent.idfederation}">
                                    <option value="${clazz.id}">${clazz.classrace}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberpedigree" class="col-sm-2 control-label">Номер родослвной</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${dogevent.numberpedigree}" id="numberpedigree" name="numberpedigree" placeholder="Номер родослвной">
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberbookkv" class="col-sm-2 control-label">Номер квалификационной книжки</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${dogevent.numberbookkv}" id="numberbookkv" name="numberbookkv" placeholder="Номер квалификационной книжки">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inqualification" class="col-sm-2 control-label">Собака участвует в квалификации</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="inqualification" id="inqualification">
                            <c:if test="${dogevent.inqualification == true}">
                                <option value="true">Да</option>
                            </c:if>
                            <c:if test="${dogevent.inqualification == false}">
                                <option value="false">Нет</option>
                            </c:if>
                            <c:if test="${dogevent.inqualification == true}">
                                <option value="false">Нет</option>
                            </c:if>
                            <c:if test="${dogevent.inqualification == false}">
                                <option value="true">Да</option>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">Подтвердить</button>
                        <a href="${contextPath}/secure/memberevent-view?id=${dogevent.idmember}&idevent=${dogevent.idevent}" class="btn bg-info">Назад</a>
                    </div>
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
