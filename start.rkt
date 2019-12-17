#!/home/strue028/racket/bin/racket

#lang racket

(require "database.rkt")
(require "inicio.rkt")


(define 5view (format-random-5-6 (select-random-5)))

(displayln "Content-text: text/html")
(newline) (newline)

(displayln (~a
            (head)
            "<body>
  <div id=\"tela-principal\" class=\"d-flex\" style=\"min-height: 100vh;\">
  <div class=\"left-bar l-0\">
  <div id=\"area-menu-lateral\" class=\"d-flex flex-column flex-lg-row align-items-center w-100\">
  <ul id=\"menu-lateral\">"
       (menu '(HOME BUSCAR LOGIN CADASTRE-SE SOBRE)
                 '("./start.rkt" "./busca.rkt" "./login.html" "./cadastro.html" "./sobre.html"))

"</ul>
  <button id=\"left-bar-menu\" class=\"btn\">
  <img src=\"./assets/menu.svg\" width=\"25\" alt=\"\">
  </button>
  </div>
  </div>
<div class=\"content row\">
" (principal-produto (first 5view))
"<div class=\"col-lg-6\"><div class=\"row h-100 h-100\">" (other-list (cdr 5view)) "
          <div class=\"opcoes col-lg-6\">
            <ul class=\"nav nav-pills mb-3\" id=\"pills-tab\" role=\"tablist\">
              <li class=\"nav-item\">
                <a class=\"nav-link active\" id=\"pills-home-tab\" data-toggle=\"pill\" href=\"#pills-home\" role=\"tab\"
                  aria-controls=\"pills-home\" aria-selected=\"true\">Novos</a>
              </li>
              <li class=\"nav-item\">
                <a class=\"nav-link\" id=\"pills-profile-tab\" data-toggle=\"pill\" href=\"#pills-profile\" role=\"tab\"
                  aria-controls=\"pills-profile\" aria-selected=\"false\">Populares</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class=\"right-bar\">
      <button class=\"btn btn-custom\">
        <img src=\"./assets/cart.svg\" width=\"25\">
      </button>
    </div>
  </div>

  <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"
    integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\"
    crossorigin=\"anonymous\"></script>
  <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"
    integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\"
    crossorigin=\"anonymous\"></script>
  <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"
    integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\"
    crossorigin=\"anonymous\"></script>

  <script>
    $(\"#paginaAnterior\").click(() => {
      let novaPagina = parseInt($(\"#paginaAtual\").text()) - 1;

      if (novaPagina > 0) {
        $(\"#paginaAtual\").text(novaPagina);
      }
    });

    $(\"#paginaSeguinte\").click(() => {
      let novaPagina = parseInt($(\"#paginaAtual\").text()) + 1;

      if (novaPagina <= 3) {
        $(\"#paginaAtual\").text(novaPagina);
      }
    });

    $(\"#left-bar-menu\").click(() => {
      if ($(\".left-bar\").hasClass(\"left-0\")) {
        $(\".left-bar\").removeClass(\"left-0\");
        $(\".left-bar\").removeClass(\"top-0\");
      }
      else {
        $(\".left-bar\").addClass(\"left-0\");
        $(\".left-bar\").addClass(\"top-0\");
      }
    });


  </script>
</body>

</html>"))