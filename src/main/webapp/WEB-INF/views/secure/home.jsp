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
      <form class="form-search" method="get" action="${contextPath}/secure/search">
        <input type="text" name="search" value="user" hidden/>
        <input type="text" name="name" class="input-medium search-query">
        <button type="submit" class="btn">Найти</button>
      </form>
      <BR>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Именинники</h3>
        </div>
        <div class="panel-body">
          Сегодня день/месяц ${day}/${month}<BR>
          В этом месяце дни рождения у:
          <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                  <thead>
                  <tr>
                    <th>ФИО</th>
                    <th>День</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${birthmembers}" var="birthmember">
                      <tr>
                        <td><a href="${contextPath}/secure/member-view?id=${birthmember.id}">${birthmember.surname+" "+birthmember.name+" "+birthmember.fathername}</a></td>
                        <td>${birthmember.datebirth.date}</td>
                      </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Список</h3>
        </div>
        <div class="panel-body">
          <div class=bs-example data-example-id=condensed-table>
            <table class="table table-condensed">
              <thead>
              <tr>
                <th>id</th>
                <th>Фамилия</th>
                <th>Имя</th>
                <th>Отчество</th>
                <th>Email</th>
                <th></th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${members}" var="member">
                <tr>
                  <td>${member.id}</td>
                  <td>${member.surname}</td>
                  <td>${member.name}</td>
                  <td>${member.fathername}</td>
                  <td>${member.email}</td>
                  <td><a class="btn-success" href="${contextPath}/secure/member-view?id=${member.id}">Просмотр</a><a class="btn-default" href="${contextPath}/secure/member-edit?id=${member.id}">Изменить</a><a class="btn-danger" href="${contextPath}/secure/member-delete?id=${member.id}">Удалить</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <a class="btn btn-success" href="${contextPath}/secure/member-create">Добавить</a>
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
