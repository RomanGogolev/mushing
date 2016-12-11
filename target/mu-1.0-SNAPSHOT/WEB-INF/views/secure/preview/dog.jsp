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
            <li><a href="${contextPath}/secure">Члены Федерации</a></li>
            <li class="active"><a href="${contextPath}/secure/dogs">Собаки Федерации</a></li>
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
      <div class="form-horizontal">
        <div class="form-group">
          <label for="fullname" class="col-sm-2 control-label">Полное имя</label>
          <div class="col-sm-10">
            <div class="form-control" id="fullname">${dog.fullname}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="ownername" class="col-sm-2 control-label">ФИО хозяина</label>
          <div class="col-sm-10">
            <div class="form-control" id="ownername">${dog.ownername}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="homename" class="col-sm-2 control-label">Домашняя кличка</label>
          <div class="col-sm-10">
            <div class="form-control" id="homename">${dog.homename}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="marknumber" class="col-sm-2 control-label">Номер клейма</label>
          <div class="col-sm-10">
            <div class="form-control" id="marknumber">${dog.marknumber}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="numberpedigree" class="col-sm-2 control-label">Номер родословной</label>
          <div class="col-sm-10">
            <div class="form-control" id="numberpedigree">${dog.numberpedigree}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="numberchip" class="col-sm-2 control-label">Номер чипа</label>
          <div class="col-sm-10">
            <div class="form-control" id="numberchip">${dog.numberchip}</div>
          </div>
        </div>
        <div class="form-group">
          <label for="fcigroup" class="col-sm-2 control-label">Группа FCI</label>
          <div class="col-sm-10">
            <div class="form-control" id="fcigroup">
              <c:forEach items="${fcigroups}" var="fcigroup">
                <c:if test="${fcigroup.id == dog.idfcigroup}">
                    ${fcigroup.fci}
                </c:if>
              </c:forEach>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="datebirth" class="col-sm-2 control-label">Дата рождения(год/месяц/день)</label>
          <div class="col-sm-10">
            <div class="form-control" id="datebirth">${dog.datebirth}</div>
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
