;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; f : Number -> Number
; performs a mysterious operation to a number

(check-expect (f 1) 2)
(check-expect (f 2) 5)
(check-expect (f 3) 10)
(check-expect (f 4) 17)

(define (f x)
  (add1
   (* x x)))
