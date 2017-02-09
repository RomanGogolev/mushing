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
              ${dog.fcigroup.fci}
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="datebirth" class="col-sm-2 control-label">Дата рождения(год/месяц/день)</label>
          <div class="col-sm-10">
            <div class="form-control" id="datebirth">${dog.datebirth}</div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-10">
            <a href="${contextPath}/dogs" class="btn bg-info">Назад</a>
          </div>
        </div>
      </div>
        </div>
      </div>
    </div>
  </body>
</html>
