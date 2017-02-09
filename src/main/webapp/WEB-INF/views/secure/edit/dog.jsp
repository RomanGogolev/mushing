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
            <form class="form-horizontal" name="dogEditForm" method="post" action="${contextPath}/dog-edit">
                <input type="number" id="id" name="id" value="${dog.id}" hidden>
                <div class="form-group">
                    <label for="fullName" class="col-sm-2 control-label">Полное имя</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="fullName" value="${dog.fullname}" name="fullName" placeholder="Полное имя" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ownerName" class="col-sm-2 control-label">ФИО хозяина</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="ownerName" value="${dog.ownername}" name="ownerName" placeholder="ФИО хозяина" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="homeName" class="col-sm-2 control-label">Домашняя кличка</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="homeName" value="${dog.homename}" name="homeName" placeholder="Домашняя кличка" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="markNumber" class="col-sm-2 control-label">Номер клейма</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="markNumber" value="${dog.marknumber}" name="markNumber" placeholder="Номер клейма" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberPedigree" class="col-sm-2 control-label">Номер родословной</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="numberPedigree" value="${dog.numberpedigree}" name="numberPedigree" placeholder="Номер родословной">
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberChip" class="col-sm-2 control-label">Номер чипа</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="numberChip" value="${dog.numberchip}" name="numberChip" placeholder="Номер чипа" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idfciGroup" class="col-sm-2 control-label">Группа FCI</label>
                    <div class="col-sm-10">
                        <select class="input-medium search-query" name="idfciGroup" id="idfciGroup" required>
                            <option value="${dog.fcigroup.id}">${dog.fcigroup.fci}</option>
                            <c:forEach items="${fcigroups}" var="fcigroup">
                                <c:if test="${fcigroup.id != dog.fcigroup.id}">
                                    <option value="${fcigroup.id}">${fcigroup.fci}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateBirth" class="col-sm-2 control-label">Дата рождения(месяц/день/год)</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="dateBirth" value="${dog.datebirth}" name="dateBirth" placeholder="Дата рождения" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">Сохранить</button>
                        <a href="${contextPath}/dogs" class="btn bg-info">Назад</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
