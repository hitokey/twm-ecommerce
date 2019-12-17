#!/home/strue028/racket/bin/racket

#lang racket

(provide gen-list)



(define (gen-list xl)
  (let build((rst "") (n (first xl)) (m (second xl)) (v (third xl)) (i (fourth xl)) (c (fifth xl)))
    (if (or (empty? n) (empty? m) (empty? v) (empty? i) (empty? c)) rst
        (build (string-append rst (~a "<div class=\"mt-5 shadow p-3 produto\">
                                       <div class=\"row align-items-center\">
                                       <div class=\"col-lg-2 text-center\">
                                      <img src=\"" (car i) "\" width=\"100%\" alt=\"\"></div>
                                      <div class=\"col-lg-9\"><p class=\"nome-produto\"> 
                                      <span class=\"marca-produto\"> " (car n) "</span>  " (car m) "</p>
                                       <p class=\"preco-produto\">$" (~a (car v) #:width 5)
                                      "</p><p>Cores disponíveis:" (car c) "</p>
                                       <p class=\"mt-4\">" (car n) " - " (car m) " : Simples discrição</p></div>
                                                 <div class=\"col-lg-1 text-center\">
                                       <button class=\"btn btn-custom\">
                                        <img src=\"./assets/add.svg\" width=\"20\">
                                        </button></div></div></div>"))
               (cdr n) (cdr m) (cdr v) (cdr i) (cdr c)) )))
