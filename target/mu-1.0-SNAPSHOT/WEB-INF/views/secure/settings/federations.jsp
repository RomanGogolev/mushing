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
      <form class="form-search" method="get" action="${contextPath}/federation-create">
        <input type="text" name="federation" class="input-medium search-query"/>
        <button type="submit" class="btn">Создать</button>
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
                <th>Федерация</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${federations}" var="federation">
                <tr>
                  <td>${federation.federation}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
