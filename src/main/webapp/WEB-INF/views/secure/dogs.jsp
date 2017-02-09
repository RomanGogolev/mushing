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
    <div class="modal fade" id="createDog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Добавить собаку федерации</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" name="dogCreateForm" method="post" action="${contextPath}/dog-create">
              <div class="form-group">
                <label for="fullName" class="col-sm-2 control-label">Полное имя</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Полное имя" required>
                </div>
              </div>
              <div class="form-group">
                <label for="ownerName" class="col-sm-2 control-label">ФИО хозяина</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="ownerName" name="ownerName" placeholder="ФИО хозяина" required>
                </div>
              </div>
              <div class="form-group">
                <label for="homeName" class="col-sm-2 control-label">Домашняя кличка</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="homeName" name="homeName" placeholder="Домашняя кличка" required>
                </div>
              </div>
              <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/anotherdogs'}">
                <div class="form-group">
                  <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                  <div class="col-sm-10">
                    <select class="input-medium search-query" name="idfederation" id="idfederation" required>
                      <c:forEach items="${federations}" var="federation">
                        <option value="${federation.id}">${federation.federation}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </c:if>
              <div class="form-group">
                <label for="markNumber" class="col-sm-2 control-label">Номер клейма</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="markNumber" name="markNumber" placeholder="Номер клейма" required>
                </div>
              </div>
              <div class="form-group">
                <label for="numberPedigree" class="col-sm-2 control-label">Номер родословной</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="numberPedigree" name="numberPedigree" placeholder="Номер родословной">
                </div>
              </div>
              <div class="form-group">
                <label for="numberChip" class="col-sm-2 control-label">Номер чипа</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="numberChip" name="numberChip" placeholder="Номер чипа" required>
                </div>
              </div>
              <div class="form-group">
                <label for="idfciGroup" class="col-sm-2 control-label">Группа FCI</label>
                <div class="col-sm-10">
                  <select class="input-medium search-query" name="idfciGroup" id="idfciGroup" required>
                    <c:forEach items="${fcigroups}" var="fcigroup">
                      <option value="${fcigroup.id}">${fcigroup.fci}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="dateBirth" class="col-sm-2 control-label">Дата рождения(месяц/день/год)</label>
                <div class="col-sm-10">
                  <input type="date" class="form-control" id="dateBirth" name="dateBirth" placeholder="Дата рождения" required>
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
      <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dogs'}">
        <form class="form-search" method="get" action="${contextPath}/search">
          <input type="text" name="search" value="dog" hidden/>
          <input type="text" name="name" class="input-medium search-query">
          <button type="submit" class="btn">Найти</button>
        </form>
      </c:if>
      <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/anotherdogs'}">
        <form class="form-search" method="get" action="${contextPath}/searchAnother">
          <input type="text" name="search" value="dog" hidden/>
          <input type="text" name="name" class="input-medium search-query">
          <button type="submit" class="btn">Найти</button>
        </form>
      </c:if>
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
      <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createDog">
        Добавить
      </button>
    </div>
  </body>
</html>
