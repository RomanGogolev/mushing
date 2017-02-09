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
            <form class="form-horizontal" name="dogEditForm">
                <div class="form-group">
                    <label for="fioowner" class="col-sm-2 control-label">ФИО хозяина</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="fioowner" name="fioowner">${dogevent.fioowner}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nameonpedigree" class="col-sm-2 control-label">Кличка собаки по родословной</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="nameonpedigree" name="nameonpedigree">${dogevent.nameonpedigree}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sex" class="col-sm-2 control-label">Пол собаки</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="sex" name="sex">${dogevent.sex}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата (месяц/день/год)</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="datebirth" name="datebirth">${dogevent.datebirth}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idbreed" class="col-sm-2 control-label">Порода</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="idbreed" name="idbreed">
                            ${dogevent.breed.breed}
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="marknumber" class="col-sm-2 control-label">Номер клейма</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="marknumber" name="marknumber">${dogevent.marknumber}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberchip" class="col-sm-2 control-label">Номер чипа</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="numberchip" name="numberchip">${dogevent.numberchip}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="idfederation" name="idfederation">
                            ${dogevent.federation.federation}
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberpedigree" class="col-sm-2 control-label">Номер родословной</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="numberpedigree" name="numberpedigree">${dogevent.numberpedigree}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberbookkv" class="col-sm-2 control-label">Номер квалификационной книжки</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="numberbookkv" name="numberbookkv">${dogevent.numberbookkv}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inqualification" class="col-sm-2 control-label">Собака участвует в квалификации</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="inqualification" name="inqualification">
                            <c:if test="${dogevent.inqualification == true}">
                                <option value="true">Да</option>
                            </c:if>
                            <c:if test="${dogevent.inqualification == false}">
                                <option value="false">Нет</option>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="${contextPath}/memberevent-view?id=${dogevent.member.id}&idevent=${dogevent.event.id}" class="btn btn-success">Назад</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
