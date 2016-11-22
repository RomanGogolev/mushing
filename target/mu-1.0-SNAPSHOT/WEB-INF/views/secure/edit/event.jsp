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
      <form class="form-horizontal" name="eventEditForm" method="post" action="${contextPath}/secure/event-edit">
        <input type="number" id="id" name="id" value="${event.id}" hidden>
        <div class="form-group">
          <label for="headerEvent" class="col-sm-2 control-label">Название мероприятия</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" value="${event.headerevent}" id="headerEvent" name="headerEvent" placeholder="Название мероприятия" required>
          </div>
        </div>
        <div class="form-group">
          <label for="organizers" class="col-sm-2 control-label">Организаторы</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="organizers" value="${event.organizers}" name="organizers" placeholder="Организаторы" required>
          </div>
        </div>
        <div class="form-group">
          <label for="place" class="col-sm-2 control-label">Место провождения</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="place" value="${event.place}" name="place" placeholder="Место провождения" required>
          </div>
        </div>
        <div class="form-group">
          <label for="season" class="col-sm-2 control-label">Сезон</label>
          <div class="col-sm-10">
            <select class="input-medium search-query" name="season" id="season">
              <option>Зима</option>
              <option>Лето</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="idRank" class="col-sm-2 control-label">Ранг</label>
          <div class="col-sm-10">
            <select class="input-medium search-query" name="idRank" id="idRank">
              <c:forEach items="${ranks}" var="rank">
                <option value="${rank.id}">${rank.rank}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label for="dateStart" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
          <div class="col-sm-10">
            <input type="date" class="form-control" id="dateStart" value="${event.datestart}" name="dateStart" placeholder="Дата" required>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-success">Сохранить</button>
          </div>
        </div>
      </form>
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
