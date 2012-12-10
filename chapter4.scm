; Chapter 4 exercises
(load "materials/simply.scm")

;4.1
(define (ho-hum x y)
  (+ x (* 2 y)))

(ho-hum 8 12)

(+ 8 (* 2 12))
(+ 8 24)

;4.2

(define (yawn x)
  (+ 3 (* x 2)))

(yawn (/ 8 12))

; People invovled in yawn:
; Alonzo: Interpreter specialist hires:
; Trinity: division specialist to find the argument
; Lucy: Yawn specialist, hires:
; Ricky: addition specialist, hires:
; Bubbles: multiplication specialist

; 4.3
(define (f x y) (- y x))
; This function takes 2 arguments and subtracts the first from the second
(f 2 10)
8

(define (identity x) x)
; This function returns its argument
(identity 3)
3

(define (three x) 3)
; This function takes a parameter but always returns 3 regardless of the param
(three 10000)
3

(define (seven) 7)
; This function has no paramters and always returns 7
(seven)
7

(define (magic n)
  (- (/ (+ (+ (* 3 n)
              13)
           (- n 1))
        4)
     3))

; This function implements the following mathmatical formula:
; ( 3n + 13 + (n - 1) / 4 ) - 3
; this formula will always evaluate to the argument
(magic 2)
2
(magic 100)
100

; 4.4

; incorrect:
;(define (sphere-volume r)
;  (* (/ 4 3) 3.141592654)
;  (* r r r))

; as written the first multiplication is separate from the 2nd, so it doesn't effect the term
; this simply return r^3
; Correct:

(define (sphere-volume r)
  (* (/ 4 3) 3.141592654
     (* r r r)))

(sphere-volume 3)

;incorrect:
;(define (next x)
;  (x + 1))

; The addition is written incorrectly, the operator leads

(define (next x)
  (+ x 1))

(next 3)
4

;incorrect
;(define (square)
;  (* x x))
; The  definition doesn't include a parameter

(define (square x)
  (* x x))

(square 4)
16

; incorrect
;(define (triangle-area triangle)
;  (* 0.5 base height))
; The parameter isn't able to be used. Base and Height can't be derived from a parameter of triangle

(define (triangle-area base height)
  (* 0.5 base height))

(triangle-area 10 10)
50

; incorrect
;(define (sum-of-squares (square x) (square y))
;  (+ (square x) (square y)))

; Functions can be arguments in a call, but can't be parameters

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 2 1)
5

; 4.5
(define (to-f x)
  (+ 32
     (* x (/ 9 5))))

(define (to-c x)
  (* (/ 5 9)
     (- x 32)))

(to-c 32)
(to-f 0)

;4.6
(define (fourth x)
  (* x x x x))

(define (fourth-2 x)
  (square (square x)))

(fourth 9)
(fourth-2 9)

; 4.7
(define (absolute x)
  (sqrt (square x)))

(absolute -10)

; 4.8

(define (scientific x y)
  (* x (expt 10 y)))

(scientific 3.29 4)
(scientific 7 -9)

; find a number's scientific notation exponent and coefficent
; from what i can tell Scheme only has log base e built in,
; Log base 10 will = ( (Log base e of the number) / (Log base e of 10) )

(define (sci-exponent x)
  (floor (/ (log x) (log 10))))

(define (sci-coefficent x)
  (/ x 
     (expt 10 (sci-exponent x))))

(sci-coefficent 7000)
7

(sci-exponent 7000)
3

; 4.9

;discount = price - (price * discount)
(define (discount x y) 
  (- x 
     (* x
        (/ y 100))))

(discount 10 5)
(discount 29.90 50)

; 4.10

(define (tip-percent x)
  (* x 0.15))

(define (round-tip x)
  (/ 
   (round
    (* 100 x))
   100))

(define (tip x)
  (round-tip
   (+ (tip-percent x)
      (- (ceiling(+ x (tip-percent x))) 
         (+ x (tip-percent x))))))



(tip 19.98)
(tip 29.23)
(tip 7.54)


