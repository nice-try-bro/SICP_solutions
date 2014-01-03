;;---Ex. 1.1---------------------------------------------------
10						;; 10
(+ 5 3 4)					;; 12
(- 9 1)						;; 8
(/ 6 2)						;; 3
(+ (* 2 4) (- 4 6))				;; 6
(define a 3)					;;
(define b (+ a 1))				;;
(+ a b (* a b))					;; 19
(= a b)						;; #f
(if (and (> b a) (< b (* a b)))
    b
    a)						;; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))				;; 16
(+ 2 (if (> b a) b a)) 			        ;; 6
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))                                     ;; 16


;;---Ex. 1.2---------------------------------------------------
(/	(+ 5 4 (- 2
                  (- 3
                     (+ 6 (/ 4 5)))))
        (* 3 (- 6 2)(- 2 7)))

;;---Ex. 1.3---------------------------------------------------
(define (two-of-three-square x y z)
  (if (= x (larger x y))
             (sum-of-squares x (larger y z))
             (sum-of-squares y (larger x z))
         ) )
(define (larger x y)
    (if (> x y) x y))
(two-of-three-square 1 5 7)

;;---Ex. 1.6---------------------------------------------------
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(sqrt-iter guess x)
(cond ((good-enough? guess x) guess)
      (else (sqrt-iter (improve guess x)
		       x)))

;---Ex.1.7---------------------------------------------------
(define (sqrt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough-alt? guess improved-guess x)
      guess
      (sqrt-iter improved-guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough-alt? guess improved-guess x)
  (> (* guess 0.001) (abs (- guess improved-guess))))

(define (sqrt-new x)
  (sqrt-iter 1.0 x))

;---Ex.1.8---------------------------------------------------

(define (cube-root-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough-alt? guess improved-guess x)
      guess
      (cube-root-iter improved-guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
	(* 2 guess))
     3))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough-alt? guess improved-guess x)
  (> (* guess 0.001) (abs (- guess improved-guess))))

(define (cube-root x)
  (cube-root-iter 1.0 x))

;---Ex.1.9---------------------------------------------------

;(define (+ a b)
;  (if (= a 0)
;      b
;      (inc (+ (dec a) b))))
;
;(+ 4 5)
;(inc (+ 3 5))
;(inc (inc (+ 2 5)))
;(inc (inc (inc (+ 1 5))))
;(inc (inc (inc (inc (+ 0 5)))))
;(inc (inc (inc (inc (5)))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9
;recursive
;
;(define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))
;
;(+ 4 5)
;(+ 3 6)
;(+ 2 7)
;(+ 2 7)
;(+ 1 8)
;(+ 0 9)
;9
;iterative

;;---Ex.1.10--------------------------------------------------

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
				 
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024

(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 (A 0 (A 0 4)))
(A 1 (A 0 8))
(A 1 16)
65536

(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 4)
65536

(define (f n) (A 0 n)) ;; 2*n

(define (g n) (A 1 n)) ;; 2^n

(define (h n) (A 2 n)) ;; 2^(n^2)

;;---Ex. 1.11--------------------------------------------------

; recursive
(define (func-rec n)
  (if (< n 3)
      n
    (+ (func-rec (- n 1))
       (* 2 (func-rec (- n 2)))
       (* 3 (func-rec (- n 3))))))

(func-rec 5)
(+ (func-rec 4)
   (* 2 (func-rec 3))
   (* 3 (func-rec 2)))
(+ (+ (func-rec 3)
      (2 * (func-rec 2))
      (3 * (func-rec 1)))
   (2 * (+ (func-rec 2)
	   (2 * (func-rec 1))
	   (3 * (func-rec 0))))
(+ (+ (+ (func-rec 2)
	 (2 * (func-rec 1))
	 (3 * (func-rec 0)))
      (2 * (func-rec 2))
      (3 * (func-rec 1)))
   (2 * (+ (func-rec 2)
	   (2 * (func-rec 1))
	   (3 * (func-rec 0)))))

; iterative

; modelling for n = 6
; total-sum = 0
; total-sum = total-sum + 
; f(5) + 2f(4) + 3f(3)
; f(4) + 2f(3) + 3f(2) + 2f(3) + 4f(2) + 6f(1) + 3f(2) + 6f(1) + 9f(0)
; f(3) + 2f(2) + 3f(1) + 


(define (func-iter n)
  (define (func-iter-core a b c n max)
    (cond ((> n max) a)
	  ((< n 3) (func-iter-core n a b (+ 1 n) max))
	  (else (func-iter-core
		 (+  a (* 2 b) (* 3 c))
		 a b (+ 1 n) max))))
  (func-iter-core 0 0 0 0 n))
(func-iter 5)

;;---Ex. 1.12--------------------------------------------------

(define (get-pascal-triangle-number line column)
  (cond	((or (> column row) (< column 0) (< row 0)) 0)
	((or (= column 1) (= column row)) 1)
	(else (+ (get-pascal-triangle-number (- line 1) (- column 1))
		 (get-pascal-triangle-number (- line 1) column)))))
      
;;---Ex. 1.13--------------------------------------------------

; Fib(0) = 0
; Fib(1) = 1
; Fib(n) = Fib(n-1) + Fib(n-2)

;;---Ex. 1.15--------------------------------------------------

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine (/ 12.15 3)))
(sine 4.05)
(p (sine (/ 4.05 3)))
(sine 1.35)
(p (sine (/ 1.35 3)))
(sine 0.45)
(p (sine (/ 0.45 3)))
(sine 0.15)
(p (sine (/ 0.15 3)))
(sine 0.05)
0.05
; time: O(log n)
; space: 0(log n)


;;---Ex. 1.16--------------------------------------------------

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (cond ((= counter 0) product)
    ((even? n)
	(expt-iter b
		   (/ counter 2)
		   (square product)))
      (else (expt-iter b
       (- counter 1)
       (* b product))))))

(define (square x)
  (* x x))

;;---Ex. 1.17--------------------------------------------------

(define (double a) 
  (* a 2))

(define (halve a) 
  (/ a 2))

(define (fast-mul a b)
  (cond ((= b 0) 0)
	((even? b) (fast-mul (double a) (halve b)))
	(else (+ a (fast-mul a (- b 1))))))

;;---Ex. 1.18--------------------------------------------------

;; negative integers not supported
(define (russian-mul a b)
  (russian-mul-iter a b 0))

(define (russian-mul-iter a counter product)
  (cond ((= counter 0) product)
	((even? counter) (russian-mul-iter (double a)
					   (halve counter)
					   product))
	(else (russian-mul-iter a
				(- counter 1)
				(+ product a)))))