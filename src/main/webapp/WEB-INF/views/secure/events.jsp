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
    <c:import url="head.jsp"/>
    <div class="modal fade" id="createEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Добавить мероприятие</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" name="eventCreateForm" method="post" action="${contextPath}/event-create">
              <div class="form-group">
                <label for="headerEvent" class="col-sm-2 control-label">Название мероприятия</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="headerEvent" name="headerEvent" placeholder="Название мероприятия" required>
                </div>
              </div>
              <div class="form-group">
                <label for="organizers" class="col-sm-2 control-label">Организаторы</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="organizers" name="organizers" placeholder="Организаторы" required>
                </div>
              </div>
              <div class="form-group">
                <label for="place" class="col-sm-2 control-label">Место провождения</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="place" name="place" placeholder="Место провождения" required>
                </div>
              </div>
              <div class="form-group">
                <label for="season" class="col-sm-2 control-label">Сезон</label>
                <div class="col-sm-10">
                  <select class="selectpicker" name="season" id="season">
                    <option>Зима</option>
                    <option>Лето</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="dateStart" class="col-sm-2 control-label">Дата </label>
                <div class="col-sm-10">
                  <input type="date" class="form-control" id="dateStart" name="dateStart" placeholder="Дата" required>
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
      <form class="form-search" method="get" action="${contextPath}/search">
        <input type="text" name="search" value="event" hidden/>
        <input type="text" name="name" class="input-medium search-query">
        <button type="submit" class="btn">Найти</button>
      </form>
      <BR>
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
                <th>Название</th>
                <th>Сезон</th>
                <th></th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${events}" var="event">
                <tr>
                  <td>${event.id}</td>
                  <td>${event.headerevent}</td>
                  <td>${event.season}</td>
                  <td><a class="btn-success" href="${contextPath}/event-view?id=${event.id}">Просмотр</a><a class="btn-default" href="${contextPath}/event-edit?id=${event.id}">Изменить</a><a class="btn-danger" href="${contextPath}/event-delete?id=${event.id}">Удалить</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createEvent">
              Добавить
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
