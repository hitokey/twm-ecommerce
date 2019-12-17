#!/home/strue028/racket/bin/racket

#lang racket

(require db)

(provide cnn inserir-produto select-random-5 select-user-password format-random-5 get-it-ver format-random-5-6 select-start-busca format-start-busca get-busca format-busca-seletiva)


(define (cnn)
  (mysql-connect #:user "user"
                 #:database "passowd"
                 #:password "12345"
                 #:port 3306))


(define (inserir-produto nome marca valor quantidade image tamanho cor)
  (let ((c (cnn))
        (q (format "INSERT INTO tb_produto(nome,marca,valor,quantidade,image,tamanho,cor)
                            VALUES('~a','~a',~a,~a,'~a','~a','~a');" nome marca valor quantidade image tamanho cor)))
    (query-exec c q)))


;(define (inserir-list-produto nlist mlist vlist qlist ilist)
;  (let build((q "") (c (cnn)) (n nlist) (m mlist) (v vlist) (ql qlist) (i ilist))
;    (if (or (empty? n) (empty? m) (empty? v) (empty? ql) (empty? i))
;        (query-exec c q)
;        (build (string-append q
;                 (format "INSERT INTO tb_produto(nome,marca,valor,quantidade,image)
;                            VALUES(~a,~a,~a,~a,~a);" (car n) (car m) (car v) (car ql) (car i)))
;               (cdr n) (cdr m) (cdr v) (cdr ql) (cdr i))) ));

(define (select-random-5)
  (let ((c (cnn)) (q "SELECT nome,marca,valor,image,id FROM tb_produto ORDER BY RAND() LIMIT 5;"))
    (query-rows c q)))

(define (select-random-7)
  (let ((c (cnn)) (q "SELECT nome,marca,valor,image,id FROM tb_produto ORDER BY RAND() LIMIT 7;"))
    (query-rows c q)))


(define (select-start-busca)
  (let ((c (cnn)) (q "SELECT nome,marca,valor,image,cor,tamanho FROM tb_produto ORDER BY id ASC LIMIT 5;"))
    (query-rows c q)))


(define (get-it-ver it)
      (let ((c (cnn))
            (q (format "SELECT marca,valor,image,tamanho,quantidade,nome FROM tb_produto WHERE id LIKE '~a';" it)))
        (query-row c q)))
;; adicionar observaçao

(define (select-user-password user)
  (let ((c (cnn)) (q (format "SELECT nome,senha FROM tb_user WHERE user LIKE '~a';" user)))
    (query-rows c q)))

(define (select-tenis-cor cor)
  (let* ((c (cnn))
         (cr (string-upcase cor)) (q (format "SELECT * FROM tb_produto WHERE cor LIKE '%~a';" cr)))
    (query-rows c q)))

(define (get-id nome)
  (let ((c (cnn)) (q (format "SELECT id FROM tb_produto WHERE name LIKE '~a';" nome)))
    (query-rows c q)))

(define (select-all-50)
  (let ((c (cnn)) (q (format "SELECT nome,marca,valor,image,image,tamanho,cor FROM tb_produto LIMITE 50;")))
    (query-rows c q)))

(define (inserir-cliente nome sobrenome senha cpf cidade rua numero cep)
   (let ((c (cnn)) (q (format "INSERT INTO tb_client(nome,sobrenome,senha,cpf,cidade,rua,numero,cep)
                                VALUES('~a','~a','~a','~a','~a','~a','~a','~a');" nome sobrenome senha cpf cidade rua numero cep))) 
     (query-exec c q)))

(define (inserir-user nome sobrenome email senha)
  (let ((c (cnn)) (q (format "INSERT INTO tb_user(nome,sobrename,email,senha)
                                VALUES('~a','~a','~a','~a');" nome sobrenome email senha)))
    (query-exec c q)))


(define (get-busca sx)
  (let ((rst "SELECT nome,marca,valor,image,cor,tamanho FROM tb_produto")
        (xl (if sx (regexp-split #rx";"  sx) '())))
    (if (null? xl) (select-start-busca)
        (begin
          (unless (string=? (first xl) "")  (set! rst (~a rst (format " WHERE nome LIKE '%~a%'" (first xl)))))
         ; (unless (string=? (second xl) "") (set! rst (~a rst (format " AND tamanho = '~a'" (second xl)))))
         ; (unless (string=? (third xl) "")  (set! rst (~a rst (format " AND cor = '~a'"))))
          (query-rows (cnn) (~a rst ";")))) ))

#|                                                                

(inserir-user "Aline" "Silva" "aline@twm.com" "1234A")
(inserir-user "TWM" "BOOLS"  "twm@medicina.tips" "12345")

(inserir-cliente "Grabiel" "Ribeiro" "123A" "12323445421" "UBERLANDIA" "STREET" "103" "3414123")
(inserir-cliente "Bianca" "Maria" "123B" "12312312312" "UBERLANDIA" "AFONSO" "10" "3142123")
(inserir-cliente "Ben" "Alves" "123C" "33412345621" "RIO" "TIRADENTE" "31" "3442122")
(inserir-cliente "Aline" "Silva" "221A" "31423576421" "SÃO" "JARGAS" "12" "3214123")


(inserir-produto "Camisa 82A" "nobody cares" 15.9 4 "./image/camisa01.png" "P" "CINZA")
(inserir-produto "Camisa 32S" "whatever" 22.90 2 "./image/camisa02.png" "G" "BRANCA")
(inserir-produto "Camisa C32" "whatever" 22.9 2 "./image/camisa03.png" "GG" "AZUL")
(inserir-produto "Camisa D12" "whatever" 43.2 2 "./image/camisa04.png" "PP" "VERMELHA")
(inserir-produto "Camisa I03" "whatever" 32.9  2 "./image/camisa05.png" "M" "CINZA")
(inserir-produto "Camisa Z41" "whatever" 32.9  2 "./image/camisa06.png" "P" "AZUL")
(inserir-produto "Camisa 12V" "whatever" 32.9  2 "./image/camisa07.png" "M" "PRETO")
(inserir-produto "Camisa 420" "whatever" 32.9  2 "./image/camisa08.png" "M" "CINZA")
(inserir-produto "Camisa R41" "whatever" 32.9  2 "./image/camisa09.png" "P" "MARRON")
(inserir-produto "Camisa K42" "whatever" 32.9  2 "./image/camisa10.png" "M" "AZUL")
(inserir-produto "Tenis ZWK" "whatever" 12.90 2 "./image/tenis01.png" 33 "BRANCA")
(inserir-produto "Tenis C42" "whatever" 9.90 2 "./image/tenis02.png" 34 "AZUL")
(inserir-produto "Tenis CIK" "whatever" 21.5 5 "./image/tenis03.png" 30 "CINZA")
(inserir-produto "Tenis AZQ" "whatever" 22.90 2 "./image/tenis04.png" 35 "PRETO")
(inserir-produto "Tenis RS1" "whatever" 22.90 2 "./image/tenis05.png" 31 "ROSA")
(inserir-produto "Tenis PYO" "whatever" 22.90 2 "./image/tenis06.png" 40 "PRETO")
(inserir-produto "Tenis PQ1" "whatever" 22.90 2 "./image/tenis07.png" 38 "PRETO")
(inserir-produto "Tenis UEQ" "whatever" 22.90 2 "./image/tenis08.png" 35 "PRETO")
(inserir-produto "Tenis JK1" "whatever" 22.90 2 "./image/tenis09.png" 41 "PRETO")
(inserir-produto "Tenis NIK" "whatever" 22.90 2 "./image/tenis10.png" 39 "AZUL")
(inserir-produto "Tenis C8N" "whatever" 22.90 2 "./image/tenis11.png" 28 "CINZA")
(inserir-produto "Tenis 1QA" "whatever" 22.90 2 "./image/tenis12.png" 40 "ROSA")
(inserir-produto "Tenis VX1" "whatever" 22.90 2 "./image/tenis13.png" 33 "ROSA")
|#

(define (format-busca-seletiva vx)
  (unless (null? vx)
    (define xl (for/list ([x vx]) (vector->list x)))
    (let build((rst (cdr xl)) (nlist '()) (mlist '()) (vlist '()) (ilist '()) (clist '()) (tlist '()))
      (if (empty? rst) (list nlist mlist vlist ilist clist)
          (build (cdr rst)
                 (cons (first (car rst)) nlist)
                 (cons (second (car rst)) mlist)
                 (cons (third (car rst)) vlist)
                 (cons (fourth (car rst)) ilist)
                 (cons (fifth (car rst)) clist)
                 (cons (sixth (car rst)) tlist))))))  
  
  

(define (format-all-50 vx)
 (define xl
  (for/list ([x vx]) (vector->list x)))
 (let build((rst xl) (nlist '()) (mlist '()) (vlist '()) (ilist '()) (clist '()) (tlist '()))
     (if (empty? rst) (list nlist mlist vlist ilist clist tlist xl)
         (build (cdr rst) (cons (first (car rst)) nlist) (cons (second (car rst)) mlist) (cons (third (car rst)) vlist) (cons (fourth (car rst)) ilist))) ))  



(define (format-random-5 vx)
 (define xl
  (for/list ([x vx]) (vector->list x)))
 (let build((rst (cdr xl)) (nlist '()) (mlist '()) (vlist '()) (ilist '()))
     (if (empty? rst) (list (car xl) nlist mlist vlist ilist)
         (build (cdr rst) (cons (first (car rst)) nlist) (cons (second (car rst)) mlist) (cons (third (car rst)) vlist) (cons (fourth (car rst)) ilist))) ))  
  
;(format-random-5 (select-random-5))


(define (format-random-5-6 vx)
 (define xl (for/list ([x vx]) (vector->list x)))
 (let build((rst (cdr xl)) (nlist '()) (mlist '()) (vlist '()) (ilist '()) (idlist '()))
     (if (empty? rst) (list (car xl) nlist mlist vlist ilist idlist)
         (build (cdr rst) (cons (first (car rst)) nlist) (cons (second (car rst)) mlist) (cons (third (car rst)) vlist) (cons (fourth (car rst)) ilist) (cons (fifth (car rst)) idlist)) )))  

(define (format-start-busca vx)
 (define xl (for/list ([x vx]) (vector->list x)))
 (let build((rst (cdr xl)) (nlist '()) (mlist '()) (vlist '()) (ilist '()) (clist '()))
     (if (empty? rst) (list nlist mlist vlist ilist clist)
         (build (cdr rst) (cons (first (car rst)) nlist) (cons (second (car rst)) mlist) (cons (third (car rst)) vlist) (cons (fourth (car rst)) ilist) (cons (fifth (car rst)) clist)) )))  

;(format-busca-seletiva (get-busca ";;"))
