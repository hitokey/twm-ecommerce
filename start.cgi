#!/home/strue028/racket/bin/racket

#lang racket

(require "database.rkt")
(require "inicio.rkt")
(define 5view (format-random-5 (select-random-5)))

(displayln "Content-text: html")
(newline) (newline)

(displayln (head))
(displayln start-menu)
(displayln (menu '(HOME BUSCAR LOGIN CADASTRE-SE SOBRE)
                 '("./start.rkt" "./busca.rkt" "./login.rkt" "./cadastro.rkt" "./sobre.rkt")))
(displayln end-menu)
(displayln start-matrix)
(displayln (principal-produto (first 5view)))
(display "<div class=\"col-lg-6\"><div class=\"row h-100 h-100\">") 
(displayln (other-list (cdr 5view)))

(displayln end-matrix)


