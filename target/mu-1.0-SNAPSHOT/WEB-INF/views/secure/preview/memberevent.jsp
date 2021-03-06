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
<div class="modal fade" id="createDogEvent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Добавить собаку</h4>
            </div>
            <div class="modal-body">
                <div class="radio">
                    <button style="display: none" id="buttonCreate" class="btn btn-default" onclick="hideChoose()">Создать</button>
                    <button id="buttonChoose" class="btn btn-default" onclick="hideCreate()">Выбрать</button>
                </div>
                <form class="form-horizontal" id="dogCreateForm" method="post" action="${contextPath}/dogevent-create">
                    <input type="number" id="idevent" name="idevent" value="${memberevent.event.id}" hidden>
                    <input type="number" id="idmember" name="idmember" value="${memberevent.id}" hidden>
                    <div class="form-group" id="fioownerForm-group">
                        <label for="fioowner" class="col-sm-2 control-label">ФИО хозяина</label>
                        <div class="col-sm-10">
                            <input type="text" value="${memberevent.surname} ${memberevent.name} ${memberevent.fathername}" class="form-control" id="fioowner" name="fioowner" placeholder="ФИО хозяина" required>
                        </div>
                    </div>
                    <div class="form-group" id="nameonpedigreeForm-group">
                        <label for="nameonpedigree" class="col-sm-2 control-label">Кличка собаки по родословной</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nameonpedigree" name="nameonpedigree" placeholder="Кличка собаки по родословной">
                        </div>
                    </div>
                    <div class="form-group" id="sexForm-group">
                        <label for="sex" class="col-sm-2 control-label">Пол собаки</label>
                        <div class="col-sm-10">
                            <select class="selectpicker" name="sex" id="sex" required>
                                <option>Кабель</option>
                                <option>Сука</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="datebirthForm-group">
                        <label for="datebirth" class="col-sm-2 control-label">Дата </label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="datebirth" name="datebirth" placeholder="Дата" required>
                        </div>
                    </div>
                    <div class="form-group" id="idbreedForm-group">
                        <label for="idbreed" class="col-sm-2 control-label">Порода</label>
                        <div class="col-sm-10">
                            <select class="selectpicker" name="idbreed" id="idbreed">
                                <c:forEach items="${breeds}" var="breed">
                                    <option value="${breed.id}">${breed.breed}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="marknumberForm-group">
                        <label for="marknumber" class="col-sm-2 control-label">Номер клейма</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="marknumber" name="marknumber" placeholder="Номер клейма">
                        </div>
                    </div>
                    <div class="form-group" id="numberchipForm-group">
                        <label for="numberchip" class="col-sm-2 control-label">Номер чипа</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberchip" name="numberchip" placeholder="Номер чипа">
                        </div>
                    </div>
                    <div class="form-group" id="idfederationForm-group">
                        <label for="idfederation" class="col-sm-2 control-label">Федерация</label>
                        <div class="col-sm-10">
                            <select class="selectpicker" name="idfederation" id="idfederation">
                                <c:forEach items="${federations}" var="federation">
                                    <option value="${federation.id}">${federation.federation}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="numberpedigreeForm-group">
                        <label for="numberpedigree" class="col-sm-2 control-label">Номер родослвной</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberpedigree" name="numberpedigree" placeholder="Номер родослвной">
                        </div>
                    </div>
                    <div class="form-group" id="numberbookkvForm-group">
                        <label for="numberbookkv" class="col-sm-2 control-label">Номер квалификационной книжки</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberbookkv" name="numberbookkv" placeholder="Номер квалификационной книжки">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inqualification" class="col-sm-2 control-label">Собака участвует в квалификации</label>
                        <div class="col-sm-10">
                            <select class="selectpicker" name="inqualification" id="inqualification">
                                <option value="false">Нет</option>
                                <option value="true">Да</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Подтвердить</button>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" style="display: none;" id="dogChooseForm" method="get" action="${contextPath}/dogevent-choose">
                    <input type="number" id="idevent" name="idevent" value="${memberevent.event.id}" hidden>
                    <input type="number" id="idmember" name="idmember" value="${memberevent.id}" hidden>
                    <div class="form-group" id="idDogForm-group">
                        <label for="idDogForm" class="col-sm-2 control-label">Собака</label>
                        <div class="col-sm-10">
                        <select oninput="getListDogs()" id="idDogForm" name="iddog" class="selectpicker" data-live-search="true" data-live-search-placeholder data-liveSearchNormalize="true" required>
                        </select>
                        </div>
                    </div>
                    <div class="form-group" id="numberbookkvForm-group">
                        <label for="numberbookkv" class="col-sm-2 control-label">Номер квалификационной книжки</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="numberbookkv" name="numberbookkv" placeholder="Номер квалификационной книжки">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inqualification" class="col-sm-2 control-label">Собака участвует в квалификации</label>
                        <div class="col-sm-10">
                            <select class="selectpicker" name="inqualification" id="inqualification">
                                <option value="false">Нет</option>
                                <option value="true">Да</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Добавить</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
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
                        <div class="form-control" id="surname">${memberevent.surname}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Имя</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="name">${memberevent.name}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fathername" class="col-sm-2 control-label">Отчество</label>
                    <div class="col-sm-10">
                        <div class="form-control" id="fathername">${memberevent.fathername}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datebirth" class="col-sm-2 control-label">Дата </label>
                    <div class="col-sm-10">
                        <div name="datebirth" class="form-control" id="datebirth">${memberevent.datebirth}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Город</label>
                    <div class="col-sm-10">
                        <div name="city" id="city" class="form-control">${memberevent.city}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="numberphone" class="col-sm-2 control-label">Телефон</label>
                    <div class="col-sm-10">
                        <div name="numberphone" id="numberphone" class="form-control">${memberevent.numberphone}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <div name="email" id="email" class="form-control">${memberevent.email}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="club" class="col-sm-2 control-label">Клуб</label>
                    <div class="col-sm-10">
                        <div name="club" id="club" class="form-control">${memberevent.club}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="idclassrace" class="col-sm-2 control-label">Класс</label>
                    <div class="col-sm-10">
                        <div name="idclassrace" id="idclassrace" class="form-control">${memberevent.clazz.classrace}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descr" class="col-sm-2 control-label">Примечания</label>
                    <div class="col-sm-10">
                        <div name="descr" id="descr" class="form-control">${memberevent.descr}</div>
                    </div>
                </div>
                <a href="${contextPath}/event-view?id=${memberevent.event.id}" class="btn btn-success">Назад</a>
            </div>
        </div>
    </div>
    <BR>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Собаки</h3>
        </div>
        <div class="panel-body">
            <div class=bs-example data-example-id=condensed-table>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Кличка собаки по родословной</th>
                        <th>Порода</th>
                        <th>Пол собаки</th>
                        <th>Дата рождения</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dogevents}" var="dogevent">
                        <tr>
                            <td>${dogevent.nameonpedigree}</td>
                            <td>${dogevent.breed.breed}</td>
                            <td>${dogevent.sex}</td>
                            <td>${dogevent.datebirth}</td>
                            <td><a class="btn-success" href="${contextPath}/dogevent-view?id=${dogevent.id}&idmember=${dogevent.member.id}">Просмотр</a><a class="btn-default" href="${contextPath}/dogevent-edit?id=${dogevent.id}">Редактировать</a><a class="btn-danger" href="${contextPath}/dogevent-delete?id=${dogevent.id}&idmember=${dogevent.member.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#createDogEvent">
                    Добавить
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function hideChoose() {
//        document.getElementById("idDogForm").disabled=true;
        $('#buttonCreate').hide();
        $('#buttonChoose').show();
        $('#dogCreateForm').show();
        $('#dogChooseForm').hide();
//        $('#idDogForm-group').hide();
//        $('#fioownerForm-group').show();
//        $('#nameonpedigreeForm-group').show();
//        $('#sexForm-group').show();
//        $('#datebirthForm-group').show();
//        $('#idbreedForm-group').show();
//        $('#marknumberForm-group').show();
//        $('#numberchipForm-group').show();
//        $('#idfederationForm-group').show();
//        $('#numberpedigreeForm-group').show();
//        document.getElementById("fioowner").disabled=false;
//        document.getElementById("nameonpedigree").disabled=false;
//        document.getElementById("sex").disabled=false;
//        document.getElementById("datebirth").disabled=false;
//        document.getElementById("idbreed").disabled=false;
//        document.getElementById("marknumber").disabled=false;
//        document.getElementById("numberchip").disabled=false;
//        document.getElementById("idfederation").disabled=false;
//        document.getElementById("numberpedigree").disabled=false;
    }

    function hideCreate() {
//        document.getElementById("idDogForm").disabled=false;
        $('#buttonCreate').show();
        $('#buttonChoose').hide();
        $('#dogChooseForm').show();
        $('#dogCreateForm').hide();
//        $('#idDogForm-group').show();
//        $('#fioownerForm-group').hide();
//        $('#nameonpedigreeForm-group').hide();
//        $('#sexForm-group').hide();
//        $('#datebirthForm-group').hide();
//        $('#idbreedForm-group').hide();
//        $('#marknumberForm-group').hide();
//        $('#numberchipForm-group').hide();
//        $('#idfederationForm-group').hide();
//        $('#numberpedigreeForm-group').hide();
//        document.getElementById("fioowner").disabled=true;
//        document.getElementById("nameonpedigree").disabled=true;
//        document.getElementById("sex").disabled=true;
//        document.getElementById("datebirth").disabled=true;
//        document.getElementById("idbreed").disabled=true;
//        document.getElementById("marknumber").disabled=true;
//        document.getElementById("numberchip").disabled=true;
//        document.getElementById("idfederation").disabled=true;
//        document.getElementById("numberpedigree").disabled=true;
    }

    function getList() {
        name = $('#searchInput').val();
        $.ajax({
            url: '/ajax/dogs',
            data: { name: name} ,
            contentType: "application/json;charset:UTF-8",
            dataType:"json" ,
            success: function(data){
                $("#idDogForm").empty();
                dogString = '';
                $.each(data, function(index) {
                    dogString += "<option value='" + data[index].id + "'>" + data[index].name + "</option>";
                });
                $('#idDogForm').append(dogString);
                $('#idDogForm').selectpicker('refresh');
            }
        });
    }
</script>
</body>
</html>
