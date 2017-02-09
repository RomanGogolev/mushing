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
    <div class="container">
      <c:if test="${search eq 'dog'}">
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
                  <th>Полное имя</th>
                  <th>Хозяин</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${dogs}" var="dog">
                  <tr>
                    <td>${dog.id}</td>
                    <td>${dog.fullname}</td>
                    <td>${dog.ownername}</td>
                    <td><a class="btn-success" href="${contextPath}/dog-view?id=${dog.id}">Просмотр</a><a class="btn-default" href="${contextPath}/dog-edit?id=${dog.id}">Изменить</a><a class="btn-danger" href="${contextPath}/dog-delete?id=${dog.id}">Удалить</a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </c:if>
      <c:if test="${search eq 'event'}">
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
            </div>
          </div>
        </div>
      </c:if>
      <c:if test="${search eq 'user'}">
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
                  <th>ФИО</th>
                  <th>Email</th>
                  <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${members}" var="member">
                  <tr>
                    <td>${member.id}</td>
                    <td>${member.surname} ${member.name} ${member.fathername}</td>
                    <td>${member.email}</td>
                    <td><a class="btn-success" href="${contextPath}/member-view?id=${member.id}">Просмотр</a><a class="btn-default" href="${contextPath}/member-edit?id=${member.id}">Изменить</a><a class="btn-danger" href="${contextPath}/member-delete?id=${member.id}">Удалить</a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </c:if>
    </div>
  </body>
</html>
