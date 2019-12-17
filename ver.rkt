#!/home/strue028/racket/bin/racket

#lang racket

(require "inicio.rkt")
(require "database.rkt")

(define getvalor (getenv "QUERY_STRING"))


(define info (vector->list (get-it-ver (if getvalor getvalor "99"))))


(displayln "Content-text: html")
(newline) (newline)

(display (~a
"<html>

<head>
  <meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
  <title>TWM Store</title>
  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"
    integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">
  <link rel=\"stylesheet\" href=\"./css/styles.css\">
  <link rel=\"stylesheet\" href=\"./css/ver-produto.css\">
</head>

<body>
  <div id=\"tela-principal\" class=\"d-flex\" style=\"min-height: 100vh;\">
    <div class=\"left-bar l-0\">
      <div id=\"area-menu-lateral\" class=\"d-flex flex-column flex-lg-row align-items-center w-100\">
        <ul id=\"menu-lateral\">
          "

            (menu '(HOME BUSCAR LOGIN CADASTRE-SE SOBRE)
                  '("./start.rkt" "./busca.rkt" "./login.html" "./cadastro.html" "./sobre.html"))

        "</ul>
        <button id=\"left-bar-menu\" class=\"btn\">
          <img src=\"./assets/menu.svg\" width=\"25\" alt=\"\">
        </button>
      </div>
    </div>

    <div class=\"content row\">
      <div class=\"produto-principal h-100 col-lg-6 bg-1\">
     <img src=\"" (third info) "\" alt=\"\">
    </div>
    <div class=\"col-lg-6 mt-lg-0 mt-4\">
        <div class=\"h-100 h-100\">
          <h1>" (sixth info) " - " (first info) " </h1>
     <p class=\"font-weight-bold mt-3\">Descrição</p>
          <p>"
             (sixth info) " - " (first info) "  : É um produto que nem todos pode ter.
          </p>
          <div class=\"mt-4\">
            <label for=\"tamanho\">Selecione o tamanho</label>
            <select name="" id=\"tamanho\">"
           (process-all-tamanho (fourth info))
           " </select>
          </div>

          <div class=\"mt-4\">
            <div class=\"row align-items-end\">
              <div class=\"col-lg-6\">
                <label for=\"quantidade\">Quantidade</label>
                <div class=\"d-flex w-100 justify-content-between align-items-center\">
                  <img id=\"diminuirQtd\" src=\"./assets/minus.svg\" width=\"20\" class=\"hand-over\">
                  <span id=\"quantidade\" style=\"font-size: 2.5rem;\">1</span>
                  <img id=\"aumentarQtd\" src=\"./assets/add.svg\" width=\"20\" class=\"hand-over\">
                </div>
              </div>

              <div class=\"col-lg-6 mt-lg-0 mt-2\">
                <p class=\"text-center\" style=\"font-size: 2.5rem; margin: 0;\">$ <span id=\"valor\">"
                 (~a (second info) #:width 5) "</span>
             </p>
               </div>
            </div>
          </div>

          <div class=\"mt-5\">
            <button id=\"adicionar-carrinho\" class=\"w-100\">
              Adicionar ao carrinho
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class=\"right-bar\">
      <button class=\"btn btn-custom\">
        <img src=\"./assets/cart.svg\" width=\"25\">
      </button>
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
    let valor = " (~a (second info) #:width 5) ";

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

    $(\"#diminuirQtd\").click(() => {
      let novaQtd = parseInt($(\"#quantidade\").text()) - 1;
      let novoValor = (valor * novaQtd).toFixed(2);

      if (novaQtd >= 1) {
        $(\"#quantidade\").text(novaQtd);
        $(\"#valor\").text(novoValor);
      }
    });

    $(\"#aumentarQtd\").click(() => {
      let novaQtd = parseInt($(\"#quantidade\").text()) + 1;
      let novoValor = (valor * novaQtd).toFixed(2);
      
      if (novaQtd <= " (fifth info) " ) {
        $(\"#quantidade\").text(novaQtd);
        $(\"#valor\").text(novoValor);
      }
    });
  </script>
</body>

</html>"))

