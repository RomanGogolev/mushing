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
          <form class="form-horizontal" name="eventEditForm" method="post" action="${contextPath}/event-edit">
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
                <select class="selectpicker" name="season" id="season">
                  <option>Зима</option>
                  <option>Лето</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="dateStart" class="col-sm-2 control-label">Дата </label>
              <div class="col-sm-10">
                <input type="date" class="form-control" id="dateStart" value="${event.datestart}" name="dateStart" placeholder="Дата" required>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Сохранить</button>
                <a href="${contextPath}/events" class="btn bg-info">Назад</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
