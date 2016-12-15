<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                        <li><a href="${contextPath}/secure/rules">Правила</a></li>
                        <li><a href="${contextPath}/secure/blanks">Бланки</a></li>
                        <li><a href="${contextPath}/secure/statements">Заявления</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Справочники<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${contextPath}/secure">Спортсмены Федерации</a></li>
                        <li><a href="${contextPath}/secure/dogs">Собаки Федерации</a></li>
                        <li><a href="${contextPath}/secure/anothermembers">Спортсмены</a></li>
                        <li><a href="${contextPath}/secure/anotherdogs">Собаки</a></li>
                        <li><a href="${contextPath}/secure/classesinfo">Классы</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${contextPath}/secure/reports">Отчеты</a>
                </li>
                <li>
                    <a href="${contextPath}/secure/events">Мероприятия</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Настройки<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${contextPath}/secure/fci">FCI группы</a></li>
                        <li><a href="${contextPath}/secure/classes">Классы соревнований</a></li>
                        <li><a href="${contextPath}/secure/breeds">Породы собак</a></li>
                        <li><a href="${contextPath}/secure/judges">Типы судьей</a></li>
                        <li><a href="${contextPath}/secure/ranks">Ранги</a></li>
                        <li><a href="${contextPath}/secure/federations">Федерации</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
