(load "materials/simply.scm")
; Chapter 3 exercises

; 3.1
(* 5 (+ 3 4))

; 3.2

(+ 3 (* 4 5) (- 10 4)) ; requires 3 "little people"

(+ (* (- (/ 8 2) 1) 5) 2) ; requires 4 "little people"

(* (+ (- 3 (/ 4 2))
      (sin ( * 3 2))
      (- 8 (sqrt 5)))
   (- (/ 2 3)
      4))                ; requires 10 "little people"

; 3.3

; 3.2.1 has 3 sub-expresions
; 3.2.2 has 2 sub-expresions
; 3.2.3 has 2 sub-expresions

; 3.4
(+ (* 3 (- 4 7))
   (- 8 (- 3 5)))
; Little people:
; Julian's specialty is subtraction and he recieves 4 and 7, he gives his results to Bubbles
; Bubble's specialty is multiplication, he recieves -3 from Julian and 3, he gives his results to Ricky
; Randy's specialty is subtraction and he receives 3 and 5, he gives his result to Mr. Lehey
; Mr. Lehey's specialty is subtraction and he recieves -2 from Randy and 8. He gives his results to Ricky
; Ricky's specialty is addition he receives -9 from Bubbles and 10 from Mr. Lehey

; 3.5
(sqrt (+ 6 (* 5 2)))
(sqrt (+ 6 10))
(sqrt 16)
4

(+ (+ (+ 1 2) 3) 4)
(+ (+ 3 3) 4)
(+ 6 4)
10

; 3.6

; ommiting drawn diagrams

; 3.7
(/ 1 3)

; 3.8
; variable numbers of args
(+ 1 2 3 1 3 2)
(- 1 3 1 41 2)
(* 1 31 2 31)
(/ 2 41 2 1)

; 3.9
(+ 8 2) ; 3 atoms
10 ; 1 atom
(* 5 2) ; another compound expression made up of 3 atoms
(+ (+ 4 1) (+ 3 2)) ; compound expression with 1 atom and 2 compound subexpressions
(+ 1 2 7) ; another kind of expression