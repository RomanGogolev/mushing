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
  </head>
  <body>
    <c:import url="head.jsp"/>
    <div class="modal fade" id="createMember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Добавить члена федерации</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" enctype="multipart/form-data" name="memberCreateForm" method="post" action="${contextPath}/member-create">
              <div class="form-group">
                <label for="surname" class="col-sm-2 control-label">Фамилия</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="surname" name="surname" placeholder="Фамилия" required>
                </div>
              </div>
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Имя</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="name" name="name" placeholder="Имя" required>
                </div>
              </div>
              <div class="form-group">
                <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="fathername" name="fathername" placeholder="Отчество" required>
                </div>
              </div>
              <div class="form-group">
                <label for="city" class="col-sm-2 control-label">Город</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="city" name="city" placeholder="Отчество" required>
                </div>
              </div>
              <div class="form-group">
                <label for="phonenumber" class="col-sm-2 control-label">Телефон</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="phonenumber" name="phonenumber" placeholder="Телефон" required>
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>
              </div>
              <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/anothermembers'}">
                <div class="form-group">
                  <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                  <div class="col-sm-10">
                    <select class="selectpicker" name="idfederation" id="idfederation" required>
                      <c:forEach items="${federations}" var="federation">
                        <option value="${federation.id}">${federation.federation}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </c:if>
              <div class="form-group">
                <label for="sex" class="col-sm-2 control-label">Пол</label>
                <div class="col-sm-10">
                  <select class="selectpicker" name="sex" id="sex" required>
                    <option>Мужской</option>
                    <option>Женский</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="datebirth" class="col-sm-2 control-label">Дата рождения</label>
                <div class="col-sm-10">
                  <input type="date" class="form-control" id="datebirth" name="datebirth" placeholder="Дата рождения" required>
                </div>
              </div>
              <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/'}">
                 <div class="form-group">
                  <label for="data" class="col-sm-2 control-label">Копия заявления</label>
                  <div class="col-sm-10">
                    <input type="file" class="form-control" id="data" name="data" placeholder="Копия заявления" multiple="multiple" required>
                  </div>
                </div>
              </c:if>
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
      <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq ''}">
        <form class="form-search" method="get" action="${contextPath}/search">
          <input type="text" name="search" value="user" hidden/>
          <input type="text" name="name" class="input-medium search-query">
          <button type="submit" class="btn">Найти</button>
        </form>
      </c:if>
      <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/anothermembers'}">
        <form class="form-search" method="get" action="${contextPath}/searchAnother">
          <input type="text" name="search" value="user" hidden/>
          <input type="text" name="name" class="input-medium search-query">
          <button type="submit" class="btn">Найти</button>
        </form>
      </c:if>
      <BR>
      <c:if test="${not empty birthmembers}">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Именинники</h3>
          </div>
          <div class="panel-body">
            Сегодня ${day}/${month}(день/месяц)<BR>
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
                          <td><a href="${contextPath}/member-view?id=${birthmember.id}">${birthmember.surname} ${birthmember.name} ${birthmember.fathername}</a></td>
                          <td>${birthmember.datebirth.date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
          </div>
        </div>
      </c:if>
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
                  <td><a class="btn-success" href="${contextPath}/member-view?id=${member.id}">Просмотр</a><a class="btn-default" href="${contextPath}/member-edit?id=${member.id}">Изменить</a><a class="btn-danger" href="${contextPath}/member-delete?id=${member.id}">Удалить</a></td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createMember">
        Добавить
      </button>
    </div>
  </body>
</html>
