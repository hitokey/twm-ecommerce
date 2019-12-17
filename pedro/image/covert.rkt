#!/home/strue028/racket/bin/racket


#lang racket

(require 2htdp/image)

(define (covert-images p out)
 (let ((ary (bitmap/file p)))
  (save-image ary out)))

(covert-images "./cm1.jpg" "camisa01.png")
(covert-images "./cm2.jpg" "camisa02.png")
(covert-images "./cm3.jpg" "camisa03.png")
(covert-images "./cm4.jpg" "camisa04.png")
(covert-images "./cm6.jpg" "camisa05.png")
(covert-images "./cm7.jpg" "camisa06.png")
(covert-images "./cm8.jpg" "camisa07.png") 
(covert-images "./cm9.jpg" "camisa09.png")
(covert-images "./cm10.jpg" "camisa10.png")

(covert-images "./tenis1.jpg" "tenis01.png")
(covert-images "./tenis2.jpg" "tenis02.png")
(covert-images "./tenis3.jpg" "tenis03.png")
(covert-images "./tenis4.jpg" "tenis04.png")
(covert-images "./tenis5.jpg" "tenis05.png")
(covert-images "./tenis6.jpg" "tenis06.png")
(covert-images "./tenis7.jpg" "tenis07.png")
;;(covert-images "tenis8.jpg" "tenis08.png")
(covert-images "./tenis9.jpg" "tenis09.png")
(covert-images "./tenis10.jpg" "tenis10.png")
(covert-images "./tenis11.jpg" "tenis11.png")

