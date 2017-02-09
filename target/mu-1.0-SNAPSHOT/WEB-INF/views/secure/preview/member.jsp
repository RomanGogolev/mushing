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
                    <label for="surname" class="col-sm-2 control-label">Фамилия</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="surname">${member.surname}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="name">${member.name}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="fathername">${member.fathername}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="city">${member.city}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="phoneNumber">${member.phonenumber}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="email">${member.email}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">Пол</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="sex">${member.sex}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateBirth" class="col-sm-2 control-label">Дата рождения(год/месяц/день)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="dateBirth">${member.datebirth}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateenter" class="col-sm-2 control-label">Дата вступления(год/месяц/день)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="dateenter">${member.dateenter}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="img" class="col-sm-2 control-label">Копия заявления</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="img"><img src="${contextPath}/images/${image}"/></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="${contextPath}" class="btn bg-info">Назад</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
