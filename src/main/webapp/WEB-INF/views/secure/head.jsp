<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

    <!-- Custom styles for this template -->
    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../../resources/css/navbar-fixed-top.css" rel="stylesheet">
    <script src="../../../resources/js/ie8-responsive-file-warning.js"></script>
    <script src="../../../resources/js/ie-emulation-modes-warning.js"></script>
    <script src="../../../resources/js/jquery-3.1.1.min.js"></script>
    <script src="../../../resources/js/bootstrap.min.js"></script>
    <script src="../../../resources/js/ie10-viewport-bug-workaround.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../../../resources/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="../../../resources/js/bootstrap-select.min.js"></script>


    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">MU</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Документы<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${contextPath}/rules">Правила</a></li>
                            <li><a href="${contextPath}/blanks">Бланки</a></li>
                            <li><a href="${contextPath}/statements">Заявления</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Справочники<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${contextPath}/">Спортсмены Федерации</a></li>
                            <li><a href="${contextPath}/dogs">Собаки Федерации</a></li>
                            <li><a href="${contextPath}/anothermembers">Спортсмены</a></li>
                            <li><a href="${contextPath}/anotherdogs">Собаки</a></li>
                            <li><a href="${contextPath}/classesinfo">Классы</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${contextPath}/reports">Отчеты</a>
                    </li>
                    <li>
                        <a href="${contextPath}/events">Мероприятия</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Настройки<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${contextPath}/fci">FCI группы</a></li>
                            <li><a href="${contextPath}/classes">Классы соревнований</a></li>
                            <li><a href="${contextPath}/breeds">Породы собак</a></li>
                            <li><a href="${contextPath}/judges">Типы судьей</a></li>
                            <li><a href="${contextPath}/ranks">Ранги</a></li>
                            <li><a href="${contextPath}/federations">Федерации</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
