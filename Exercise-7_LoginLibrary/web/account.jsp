<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="SimpleLibrary - Ihre Anlaufstelle für Bücher, Zeitungen und Hörspiele!">
        <meta name="keywords" content="SimpleLibrary, Bibliothek, Bücher, Zeitungen, Hörspiele">
        <meta name="robots" content="index, follow">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
        <title>SimpleLibrary</title>

        <!-- CSS -->
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/custom.css">
        <link rel="stylesheet" href="./css/print.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
              crossorigin="anonymous">

        <!-- JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8=" crossorigin="anonymous"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/validation.js"></script>
        <script src="./js/cookieHandler.js"></script>

        <c:if test="${sessionScope.registrationFailed && !sessionScope.login.validLogin}">
            <script>
                window.addEventListener('load', function () {
                    alert('User-ID bereits in Verwendung!');
                });
            </script>
        </c:if>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="home.html"><i class="fa fa-book"></i> SimpleLibrary</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar"
                    aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbar">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="media/books.html">Bücher</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="media/newspapers.html">Zeitungen</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="media/audio.html">Hörspiele</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="guestbook">Gästebuch</a>
                    </li>
                </ul>
                <ul class="navbar-nav right">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Account beantragen <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mailto:donot@sendan.email">
                            <i class="fa fa-envelope-o" aria-hidden="true"></i> Kontakt via E-Mail
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main">
            <div class="container" style="padding-top: 2rem;">
                <h2>Beantragen einer User-ID und eines Passworts</h2>
                <hr>
                <form onsubmit="return validateForm()"
                      action="registrationHandler"
                      method="post" novalidate>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Vorname</label>
                            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Max">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Nachname</label>
                            <input type="text" class="form-control" name="lastName" id="lastName"
                                   placeholder="Mustermann">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="address">Adresse</label>
                            <textarea class="md-textarea form-control" name="address" id="address" rows="3"></textarea>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="country">Land</label>
                            <select class="custom-select" name="country" id="country">
                                <option selected value="">Auswählen..</option>
                                <option>Österreich</option>
                                <option>Schweiz</option>
                                <option>Deutschland</option>
                                <option>Andere</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Geschlecht</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="sex" id="maleSex" value="male">
                            <label class="form-check-label" for="maleSex">Männlich</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="sex" id="femaleSex" value="female">
                            <label class="form-check-label" for="femaleSex">Weiblich</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="sex" id="diverseSex" value="diverse">
                            <label class="form-check-label" for="diverseSex">Divers</label>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="userID">Gewünschte User-ID</label>
                        <input type="text" class="form-control" name="userID" id="userID" placeholder="max_muster">
                        <small id="userIDHelpBlock" class="form-text text-muted">
                            Die User-ID muss zwischen 5 und 12 Zeichen lang sein und darf nur Buchstaben und "_",
                            keine Leer- oder Sonderzeichen und keine Ziffern enthalten
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="email">E-Mail</label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="your@email.com">
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="password">Passwort</label>
                            <input type="password" class="form-control" name="password" id="password">
                            <small id="passwordHelpBlock" class="form-text text-muted">
                                Das Passwort muss zwischen 6 und 11 Zeichen lang sein und mit einem Buchstaben anfangen
                                und darf nur Buchstaben, Ziffern und "_", keine Leer- oder Sonderzeichen enthalten
                            </small>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="confirmPassword">Passwort bestätigen</label>
                            <input type="password" class="form-control" id="confirmPassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Nutzerkategorien</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="role" id="childRole" value="child">
                            <label class="form-check-label" for="childRole">minderjähriger Kunde</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="role" id="adultRole" value="adult">
                            <label class="form-check-label" for="adultRole">volljähriger Kunde</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="role" id="employeeRole"
                                   value="employee">
                            <label class="form-check-label" for="employeeRole">Mitarbeiter</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" name="role" id="adminRole" value="admin">
                            <label class="form-check-label" for="adminRole">Admin</label>
                        </div>
                    </div>
                    <button class="btn btn-success" type="submit">Formular abschicken</button>
                    <button class="btn btn-secondary" type="reset">Formular zurücksetzen</button>
                </form>
            </div>
        </main>

        <footer class="container">
            <hr>
            <p>&copy; SimpleLibrary 2020</p>
        </footer>

    </body>
</html>
