<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.util.Date"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Ninja Gold</title>
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <!-- For any Bootstrap that uses JS -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/gold.css" />
  </head>
  <body>
    <div class="container m-5 p-0">
      <h1 class="mb-5">
        Your Gold:
        <span
          class="border border-primary border-3 m-2 d-inline-block ps-4 pe-4"
          >${gold}</span
        >
      </h1>
      <div class="row">
        <div class="col">
          <form action="/gold" method="POST">
            <input type="hidden" name="lugar" value="farm" />
            <div class="card text-center" style="width: 12rem">
              <div class="card-body">
                <h5 class="card-title">Farm</h5>
                <p class="card-text">(earns 10 - 20 gold)</p>
                <button
                  type="submit"
                  class="btn btn-primary"
                  id="farm"
                  name="farm"
                >
                  Find Gold!
                </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col">
          <form action="/gold" method="POST">
            <input type="hidden" name="lugar" value="cave" />
            <div class="card text-center" style="width: 12rem">
              <div class="card-body">
                <h5 class="card-title">Cave</h5>
                <p class="card-text">(earns 5 - 10 gold)</p>
                <button
                  type="submit"
                  class="btn btn-primary"
                  id="cave"
                  name="cave"
                >
                  Find Gold!
                </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col">
          <form action="/gold" method="POST">
            <input type="hidden" name="lugar" value="house" />
            <div class="card text-center" style="width: 12rem">
              <div class="card-body">
                <h5 class="card-title">House</h5>
                <p class="card-text">(earns 2 - 5 gold)</p>
                <button
                  type="submit"
                  class="btn btn-primary"
                  id="house"
                  name="house"
                >
                  Find Gold!
                </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col">
          <form action="/gold" method="POST">
            <div class="card text-center" style="width: 12rem">
              <div class="card-body">
                <h5 class="card-title">Casino!</h5>
                <p class="card-text">(earns/takes 0 - 50 gold)</p>
                <input type="hidden" name="lugar" value="casino" />
                <button
                  type="submit"
                  class="btn btn-primary"
                  id="casino"
                  name="casino"
                >
                  Find Gold!
                </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col">
          <form action="/gold" method="POST">
            <div class="card text-center" style="width: 12rem">
              <div class="card-body">
                <h5 class="card-title">Spa</h5>
                <p class="card-text">(takes 5 - 20 gold)</p>
                <input type="hidden" name="lugar" value="spa" />
                <button
                  type="submit"
                  class="btn btn-primary"
                  id="spa"
                  name="spa"
                >
                  Find Gold!
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <h2 class="mt-2">Actividades</h2>
      <div class="scroll">
        <c:forEach var="actividad" items="${actividades}">
          <c:if test="${actividad.contains('earned')}">
            <p class="text-success"><c:out value="${actividad}" /></p>
          </c:if>
          <c:if test="${actividad.contains('lost')}">
            <p class="text-danger"><c:out value="${actividad}" /></p>
          </c:if>
        </c:forEach>
      </div>
      <div class="mt-2">
        <form action="/reset" method="POST">
          <input type="hidden" name="reset" value="reset" />
          <button type="submit" class="btn btn-primary" id="reset" name="reset">
            Reset
          </button>
        </form>
      </div>
    </div>
  </body>
</html>
