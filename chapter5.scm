(load "materials/simply.scm")
; Chapter 5 exercises

; 5.1

(sentence 'I '(me mine))
(sentence '() '(is empty))
(word '23 '45)
(se '23 '45)
(bf 'a)
(bf '(aye))
( count (first '(maggie mae)))
(se "" '() "" '())
(count (se "" '() "" '()))

;5.2

(define (f1 x y)
  (se
     (bf x) (bl y)))

(f1 '(a b c) '(d e f))

(define (f2 x y)
  (se 
   (f1 x y)
   (word (first x) (last y))
))

(f2 '(a b c) '(d e f))

(define (f3 x y)
  (se
   x x))

(f3 '(a b c) '(d e f))

(define (f4 x y)
  (word (first (bf x)) 
        (last (bl y))))

(f4 '(a b c) '(d e f))

;5.3

(first 'mezzanine)
(first '(mezzanine))

; the difference is that the argument in the first expression is a word, in the second its a one word sentance.
; The "first" of a word is a character, the "first" of a sentance is a word.

; 5.4

(first (square 7))
(first '(square 7))

; the difference is that the argument in the first expression is an expression that returns 49
; the argument in the second is the text "(square 7)" and is not evaluated as an expression

; 5.5

(word 'a 'b 'c)
(se 'a 'b 'c)

; the first generates a 3 character word
; the second generates a 3 character sentance

; 5.6

(bf 'zabadak)
(butfirst 'zabadak)

; There isn't a difference  - bf is an alias for butfirst

; 5.7

(bf 'x)
(butfirst '(x))

; The difference is that the first evaluates to an empty word, 
; the second evaluates to an empty sentance

; 5.8 

'(here, there and everywhere)
'(help!)
'(all i've got to do)
'(you know my name (look up the number))

; 2 and 4 are valid as is, the comma and the apostrophe will bork things as is though

; 5.9

; first will = a sentance with (matt wright)
; second will = a sentance with (brian harvey)

(se (word (bl (bl (first '(make a))))
          (bf (bf (last '(baseball mitt)))))
    (word (first 'with) (bl (bl (bl (bl 'rigidly))))
          (first 'held) (first (bf 'stitches))))

(se (word (bl (bl 'bring)) 'a (last 'clean))
    (word (bl (last '(baseball hat))) (last 'for) (bl (bl 'very))
	  (last (first '(sunny days)))))

; 5.10

; for butfirst to return a word you must give it a word.
; if you give it a two word sentence it will return a one word sentence

(bf 'things)
(bf '(things and))

; 5.11

; last behaves differently - it will return a word from a sentance

(last 'things)
(last '(things and))
(last 24)

; 5.12

; butfirst and butlast can return an empty sentance

(bl '(a))
; and an empty word
(bl 'a)

; 5.13

; it stands for a word with an apostrophe in it

''banana

; it is the character single quote
(first ''banana)

; 5.14

(define (third x)
  (first (bf (bf x))))

(third 'abcd)
(third '(Unleaded tastes a little tangy))

; 5.15

(define (first-two x)
  (word (first x) (first (bf x))))

(first-two 'ambulatory)

; 5.16

(define (two-first x y)
  (word (first x) (first y)))

(two-first 'brian 'epstein)

; 5.17

(define (knight x)
  (se '(Sir) x))

(knight '(david wessel))

; 5.18

(define (ends word)
  (word (first word) (last word)))

;(ends 'john)

; this is going to error because it using the reserved word "word" as the name of an argument
; (word (first word) can't generate a word because the function to do so is out of scope

; 5.19

(define (insert-and x)
  (se (bl x) '(and) (last x)))

(insert-and '(john bill wayne fred joey))

; 5.20

(define (middle-names x)
  (se (bf (bl x))))

(middle-names '(james paul mccartney))

(middle-names '(john ronald raoul tolkien))

(middle-names '(bugs bunny))

; 5.21

(define (query x)
  (se (first (bf x)) (first x) (bl (bf (bf x))) (word (last x) '"?")))

(query '(you are experienced))
(query '(i should have known better))