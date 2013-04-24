(load "materials/simply.scm")
; Chapter 7 exercises

;7.1
(define (vowel? x)
  (member x '(a e i o u)))

(define (gertrude wd)
  (let ((a-or-an (if (vowel? (first wd)) 'an 'a)))
    (let ((phrase (se a-or-an wd)))
      (se phrase
          'is
          phrase
          'is
          phrase))))

; a rose is a rose is a rose
(gertrude 'rose)

;an iguana is an iguana is an iguana
(gertrude 'iguana)

;7.2
(let ((pi 3.14159)
      (pie '(lemon meringue)))
  (se '(pi is) pi '(but pie) 'is pie))
;(PI IS 3.14159 BUT PIE IS LEMON MERINGUE)

;7.3

; It doesn't work because it's trying to use the function "word", but that has become a named parameter.

;fixed:
(define (superlative adjective wd)
  (se (word adjective 'est) wd))

; (dumbest exercise)
(superlative 'dumb 'exercise)

;7.4

(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))

; What does this do? => Its a sum of squares.  Given two numbers it adds their squares.
; It works by redefining "*" to be addition and "+" to be multiplication within that let block.
; Because they are in the same let block they don't "know" about each other's redefinition.

; 13
(sum-square 2 3)
