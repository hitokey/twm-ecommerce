#!/home/strue028/racket/bin/racket

#lang racket

(define getvalor (getenv "QUERY_STRING"))


(require "inicio.rkt")
(require "genlist.rkt")
(require "database.rkt")



(define info (format-busca-seletiva (get-busca (if getvalor getvalor ";32;"))))

;(define info (format-start-busca (select-start-busca)))



(displayln "Content-text: html")
(newline) (newline)


(displayln (~a
 "<html>

<head>
  <meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
  <title>TWM Store</title>
  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"
    integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">
  <link rel=\"stylesheet\" href=\"./css/styles.css\">
  <link rel=\"stylesheet\" href=\"./css/busca.css\">
</head>

<body>
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

    <div class=\"content py-4 w-100 pl-3 pl-lg-0 pr-3 pr-lg-0\">
      <div class=\"form-row\">
        <div class=\"col-12\">
          <input type=\"text\" id=\"input-busca\" placeholder=\"Buscar produto\">
        </div>
	 <div class=\"col-12\">
           <button class=\"w-100\" type=\"button\" onclick=\"myBusca();\">Busca</button>
	 </div>
      </div> 
"

             (gen-list info)
             
"
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
    
    function myBusca()
    {
	var input = document.getElementById(\"input-busca\").value;
	x = \"busca.rkt\"
	url = input.concat(\";\",\";\");
	x = x.concat(\"?\",url);
	location.href = x
    }
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


