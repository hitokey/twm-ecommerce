#!/home/strue028/racket/bin/racket

#lang racket

(provide head menu principal-produto other-list)

(define (ctags name intro [clss ""])
  (format "<~a~a>~a</~a>\n\t" name clss intro name)) 

(define (head [name "TWM STORE"]
              [view "viewport"]
              [scale 1]
              [style "./css/styles.css"]
              [css "./css/index.css"])
  (~a
   "<head><meta charset=\"utf-8\">" 
       "<meta name=\"" view "\" content=\"width=device-width,"
           " initial-scale=" scale "\">"
           "<title>" name "</title>"
           "<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\""
           " integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">"
           "<link rel=\"stylesheet\" href=\"" style "\">"
           "<link rel=\"stylesheet\" href=\"" css "\"></head>")) 

(define (menu nlist alist)
  (let build((rst "") (a alist) (n nlist))
    (if (or (empty? a) (empty? n))
        rst
        (build (string-append rst (ctags "li" (ctags "a" (car n) (~a " href=\"" (car a) "\""))))
               (cdr a) (cdr n)) )))

(define (principal-produto xl [links "twm/ver-produto.html"] [c 6] [i 1])
 (let ((nome (first xl)) (marca (second xl)) (valor (third xl)) (image (fourth xl)))
  (string-append "" (ctags "a" (~a (ctags "p" (~a "$" valor #:max-width 5) " id=\"preco-principal\"")
                                   (~a "<img class=\"imagem-produto\" src=\"" image "\" alt=\"\">\n\t")
                                   (ctags "p" (~a (ctags "span" marca " class=\"font-weight-bold d-block\"")
                                                  nome)
                                          " id=\"nome-principal\""))
                           (~a " href=\"" links "\"" " class=\"produto-principal col-lg-" c " bg-" i "\"") ))))



(define (other-list xl [links "twm/ver-produto.html"] [c 6] [index 2])
  (let build((rst "") (n (first xl)) (m (second xl)) (v (third xl)) (i (fourth xl)) (k index))
    (if (or (empty? n) (empty? m) (empty? v) (empty? i))
        rst
        (build (string-append rst (ctags "a" (~a (ctags "p" (~a "$" (car v) #:max-width 5) " class=\"preco-produto\"")
                                                 (~a "<img class=\"imagem-produto\" src=\"" (car i) "\">\n\t")
                                                 (ctags "p" (~a (ctags "span" (car m) " class=\"font-weight-bold d-bock\"")
                                                                (car n))
                                                        " class=\"nome-produto\""))
                                         (~a " href=\"" (~a links "?" (car n) ";" (car m) ";" (car v) ";" (car i)) "\"" " class=\"produto col-lg-" c " bg-" k "\"")))
               (cdr n) (cdr m) (cdr v) (cdr i) (add1 k)) )))
        

