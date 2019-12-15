#!/home/strue028/racket/bin/racket

#lang racket

(provide head opt-menu doctype start-end)

(define (head [name "twm-store"]
              [view "viewport"]
              [scale 1]
              [style "./css/styles.css"]
              [css "./css/index.css"])
   (format
     "<head><meta charset=\"utf-8\">
       <meta name=\"~a\" content=\"width=device-width, initial-scale=~a\"><title>\"~a\"</title>
      <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\"
          integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">
      <link rel=\"stylesheet\" href=\"~a\">
      <link rel=\"stylesheet\" href=\"~a\">
      </head>~a" view name scale style css "~a"))

(define (opt-menu y x m w)
  (format "<div id=\"tela-principal\"class=\"d-flex\" style=\"min-height: ~a;\">\n<div class=\"left-bar l-0\"> 
           <div id=\"area-menu-lateral\" class=\"d-flex flex-column flex-lg-row align-items-center w-100\"><ul id=\"~a\">\"~a\"</ul>
            <button id=\"left-bar-menu\" class=\"btn\"><img src=\"~a\" width=\"~a\" alt=\"\"></button>\n</div></div>"
          y x "~a" m w))

(define (doctype [doc "html"]) (format "<!DOCTYPE ~a>" doc))
(define (start-end intro [name "html"] [clss #f]) (if  clss (format "<~a ~a> ~a</~a>" name clss intro name)
                                                (format "<~a>~a</~a>" name intro name)))

(define (menu nlist alist [aling "menu-lateral"]
              [height "100vh"] [width 25]
              [assets "./assets/menu.svg"])
  (define results (opt-menu height aling assets width))
  (if (= (length nlist) (length alist)) (print "[INFO] EQUAL") (print "[WARNING] NOT Equal Lenght"))
  (let build((rst "") (n nlist) (a alist))
    (if (or (empty? n) (empty? a))
        (format results rst)
        (build (string-append rst (start-end (start-end (format "herf=\"~a\">~a" (first a) (first n)) "a") "li"))
               (cdr n) (cdr a)) )))



(define (view-produto name marca valor image
                      [index 1] [tipo "-principal"] [x #f]
                      [coluna 6] [phtml "ver-produto.html"]
                      [span "font-weight-bold d-block"])
  (define clss (~a (if x "produto" (~a "produto" tipo))
                   " col-lg-" coluna "bg-" index))
  (start-end (~a (start-end (~a "$ " valor) "p" (~a "id=\"preco" tipo "\""))
          (format "<img clss=\"image-produto\" src=\"~a\" alt=\"\">" image)
          (start-end (~a (start-end marca "span" (~a "class=\"" span "\"")) name) "p" (~a "id=\"nome" tipo "\"")))
      "a" (~a "href=\"" phtml "\" class=\"" clss "\"")) )



(define (build-rest nlist mlist vlist ilist
                    [c 6] [h 100])
  (define results (start-end (start-end "~a" "div" (~a "class=\"row h-" h " h-" h "\">")) "div"
                      (~a "class=\"col-lg-" c)))
  (let build((rst "") (n nlist) (m mlist) (v vlist) (i ilist) (x 2))
    (if (or (empty? n) (empty? m) (empty? v) (empty? i))
        (format results rst)
        (build (string-append rst (view-produto (car n) (car m) (car v) (car i)
                                            x "-produto" #f c))
               (cdr n) (cdr m) (cdr v) (cdr i) (add1 x)) )))


(define (ship-menu [left-align "&larr"]
                   [right-align "&rarr"]
                   [c 6] [s 1] [e 3] [font-size 2])
  
  (format (start-end "~a" "div" (~a "class=\"opcoes col-lg-" c "\""))
          (format (start-end "~a ~a ~a" "div" "class=\"d-flex align-items-center\"")
                  (start-end left-align "p" (~a "id=\"paginaAnterior\" style=\"font-size: " font-size "rem;\""
                                         " class=\"hand-over\""))
                  (start-end (~a (start-end s "span" " id=\"paginaAtual\"") " / " e)
                      "p" (~a " style=\"font-size: " (add1 font-size) "rem;\""
                              " class=\"mx-" (add1 font-size) "\""))
                      
                  (start-end right-align "p" (~a " id=\"paginaSeguinte\" style=\"font-size: " font-size "rem;\""
                                          " class=\"hand-over\"")) )))          

(define (buttom-link-image [locate "right-bar"]
                           [svg "./assets/cart.svg"]
                           [width 25]
                           [links "./web-carrinho.rkt"])
  (start-end (start-end (~a "<img src=\"" svg "\" width=\"" width "\"")
          "button" (~a "onclick=\"window.location.href='" links "';\""))
      "div" (~a "class=\"" locate "\"")))
  
(define run-ship-script
  "<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\"
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
  </script>")

