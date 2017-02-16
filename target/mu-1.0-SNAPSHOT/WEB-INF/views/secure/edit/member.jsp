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
    <c:import url="../head.jsp"/>
    <div class="container">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">Профиль</h3>
        </div>
        <div class="panel-body">
          <form class="form-horizontal" enctype="multipart/form-data" name="memberEditForm" method="post" action="${contextPath}/member-edit">
            <input type="number" id="id" name="id" value="${member.id}" hidden>
            <input type="date" id="dateenter" name="dateenter" value="${member.dateenter}" hidden>
            <input type="text" id="infeder" name="infeder" value="${member.inFeder}" hidden>
            <div class="form-group">
              <label for="surname" class="col-sm-2 control-label">Фамилия</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${member.surname}" id="surname" name="surname" placeholder="Фамилия" required>
              </div>
            </div>
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label">Имя</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${member.name}" id="name" name="name" placeholder="Имя" required>
              </div>
            </div>
            <div class="form-group">
              <label for="fathername" class="col-sm-2 control-label">Отчество</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${member.fathername}" id="fathername" name="fathername" placeholder="Отчество" required>
              </div>
            </div>
            <div class="form-group">
              <label for="city" class="col-sm-2 control-label">Город</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${member.city}" id="city" name="city" placeholder="Город" required>
              </div>
            </div>
            <div class="form-group">
              <label for="phonenumber" class="col-sm-2 control-label">Телефон</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="phonenumber" value="${member.phonenumber}" name="phonenumber" placeholder="Телефон" required>
              </div>
            </div>
            <div class="form-group">
              <label for="email" class="col-sm-2 control-label">Email</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="email" value="${member.email}" name="email" placeholder="Email" required>
              </div>
            </div>
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
                <input type="date" class="form-control" id="datebirth" value="${member.datebirth}" name="datebirth" placeholder="Дата рождения" required>
              </div>
            </div>
            <div class="form-group">
              <label for="data" class="col-sm-2 control-label">Копия заявления</label>
              <div class="col-sm-10">
                <input type="file" class="form-control" id="data" name="data" placeholder="Копия заявления" multiple="multiple">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Сохранить</button>
                <a href="${contextPath}" class="btn bg-info">Назад</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
