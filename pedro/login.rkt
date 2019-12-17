#!/home/strue028/racket/bin/racket

#lang racket

(require "database.rkt")
(require net/cgi)

(define xvalor (getenv "QUERY_STRING"))


(displayln "Context-text: text/html")
(newline) (newline)

(displayln xvalor)


