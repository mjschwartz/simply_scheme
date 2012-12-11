(load "materials/simply.scm")
; Chapter 6 exercises

;6.1

; prints 'nowhere man

(cond ((= 3 4) '(this boy))
      ((< 2 5) '(nowhere man))
      (else '(two of us)))

; prints 3

(cond (empty? 3)
      (square 7)
      (else 9))

; prints goes


(define (third-person-singular verb)
  (cond ((equal? verb 'be) 'is)
        ((equal? (last verb) 'o) (word verb 'es))
        (else (word verb 's))))

(third-person-singular 'go)

; 6.2


; #t
(or #f #f #f #t)

; #f
(and #f #f #f #t)

; #f
(or (= 2 3) (= 4 3))

; #t
(not #f)

; #t
(or (not (= 2 3)) (= 4 3))

; #t
(or (and (= 2 3) (= 3 3)) (and (< 2 3) (< 3 4)))

; 6.3

(define (sign number)
  (cond ((< number 0) 'negative)
        ((= number 0) 'zero)
        (else 'positive)))
(sign 0)
(sign -2)
(sign 100)

;6.4

(define (utensil meal)
  (if (equal? meal 'chinese)
      'chopsticks
      'fork))

(utensil 'chinese)
(utensil 'burgers)

; 6.5

(define (plus-twelve-hours time)
  (+ time 12))

(define (minus-twelve-hours time)
  (- time 12))

(define (european-time time)
  (cond ((equal? (last time) 'pm) (plus-twelve-hours (first time)))
        ((= 12 (first time)) '0) ; the book says the answer is 24, but i have always though midnight is 0:00
        (else (first time)
)))

(define (american-time time)
  (cond ((> time 12) (se (minus-twelve-hours time) ' pm))
        ((= time 12) (se '(12 pm)))
        (else (se( time ' am)))))


(european-time '(8 am))
(european-time '(4 pm))
(american-time 21)
(american-time 12)
(european-time '(12 am))

; 6.6

(define (teen? num)
  (and (>= num 13) (< num 20)))

(teen? 14)
(teen? 12.9)
(teen? 213)

; 6.7

(define (type-of thing)
  (cond ((boolean? thing) 'BOOLEAN)
        ((number? thing) 'NUMBER)
        ((empty? (bf (se thing))) 'WORD)
        (else 'SENTENCE)))

(type-of '(getting better))
(type-of 'revolution)
(type-of (= 3 3))
(type-of 12)

; 6.8

(define (indef-article word)
  (cond ((member? (first word) 'aeiou) (se '(an ) word))
        (else (se '(a ) word))))

(indef-article 'beatle)
(indef-article 'album)

; 6.9

(define (thismany num thing)
  (cond ((= num 1) (se '(1 ) thing))
        (else (se num (word thing 's)))))

(thismany 1 'partridge)
(thismany 3 'french-hen)

; 6.10

(define (sort2 x)
  (cond ((<= (first x) (last x)) (se (first x) '( ) (last x)))
        (else (se (last x) '( ) (first x)))))

(sort2 '(5 7))
(sort2 '(7 5))

; 6.11

(define (valid-leap-year year)
  (and (= 0 (remainder year 4))
       (or (not (= 0 (remainder year 100)))
           (= 0 (remainder year 400)))))

(define (valid-date? month day year)
  (cond ((or (> month 12) (< month 1)) #f)
        ((or (> day 31) (< day 1)) #f)
        ((and (> day 30) (member? month '(2 4 6 10 11))) #f)
        ((or (and (> day 29) (= month 2)) (and (= month 2) (= day 29) (not (valid-leap-year year)))) #f)
        (else #t)))

(valid-date? 10 4 1949)
(valid-date? 20 4 1776)
(valid-date? 31 6 1977)
(valid-date? 5 0 1992)
(valid-date? 2 29 1900)
(valid-date? 2 29 2000)

; 6.12

(define (plural wd)
  (if (equal? (last wd) 'y)
      (word (bl wd) 'ies)
      (word wd 's)))

(define (plural wd)
  (cond ((and (equal? (last wd) 'y) (not (member? (last (bl wd)) 'aeiou))) (word (bl wd) 'ies))
        ((member? (last wd) 'sxz) (word wd 'es))
        (else (word wd 's))))



(plural 'body)
(plural 'boy)
(plural 'buzz)
(plural 'car)
(plural 'box)

; 6.13

(define (greet name)
  (cond ((member? (first name) (se '(dr mr mrs miss)))
         (if (member? (last name) (se '(jr sr)))
             (se 'hello (first name) (last (bl name)))
             (if (equal? (last name) 'lahey)
                 (se '(hello trailor park supervisor lahey))
                 (se 'hello (first name) (last name)))))
        ((member? (first name) (se '(queen king prince princess)))
         (se '(hello your majesty)))
        ((equal? name (se '(david livingstone)))
         (se '(dr livingstone i presume?)))
        (else (se 'hello (first name)))))

(greet '(john lennon))
(greet '(dr marie curie))
(greet '(dr martin luther king jr))
(greet '(queen elizabeth))
(greet '(david livingstone))
(greet '(mr lahey))

; 6.14

(define (describe-time time)
  (cond ((> time (* 60 60 24 365 100)) (se (/ time (* 60 60 24 365 100)) '( centuries)))
        ((> time (* 60 60 24 365)) (se (/ time (* 60 60 24 365)) '( years)))
        ((> time (* 60 60 24)) (se (/ time (* 60 60 24)) '( days)))
        ((> time (* 60 60)) (se (/ time (* 60 60)) '( hours)))
        ((> time 60) (se (/ time 60) '( minutes)))
        (else (se time '( seconds)))))

(describe-time 45)
(describe-time 930)
(describe-time 30000000000)