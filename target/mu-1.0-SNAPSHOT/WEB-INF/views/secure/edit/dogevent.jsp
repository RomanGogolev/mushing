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
            <form class="form-horizontal" name="dogCreateForm" method="post" action="${contextPath}/secure/dogevent-edit">
                <input type="number" id="id" name="id" value="${dogevent.id}" hidden>
                <input type="number" id="idevent" name="idevent" value="${dogevent.event.id}" hidden>
                <input type="number" id="idmember" name="idmember" value="${dogevent.member.id}" hidden>
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
                            <option value="${dogevent.breed.id}">${dogevent.breed.breed}</option>
                            <c:forEach items="${breeds}" var="breed">
                                <c:if test="${breed.id != dogevent.breed.id}">
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
                            <option value="${dogevent.federation.id}">${dogevent.federation.federation}</option>
                            <c:forEach items="${federations}" var="federation">
                                <c:if test="${federation.id != dogevent.federation.id}">
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
                        <a href="${contextPath}/secure/memberevent-view?id=${dogevent.member.id}&idevent=${dogevent.event.id}" class="btn bg-info">Назад</a>
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
