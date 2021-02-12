(define make-choice
	(lambda (choices)
		(let ([idx (random (length choices))])
			idx)))
			
(define vector-max
	(lambda (vec)
		(let loop ([i 1] [max-idx 0])
			(cond
			[(= i (vector-length vec)) max-idx]
			[else
			 (let ([m (vector-ref vec i)])
			 	(if (> m (vector-ref vec max-idx))
			 		(loop (+ i 1) i)
			 		(loop (+ i 1) max-idx)))]))))
			
(define run
	(lambda (choices n)
		(let ([occs (make-vector (length choices) 0)])
			(do ([i 0])
				([= i n] (printf "occs = ~a~%" occs) (values occs (list-ref choices (vector-max occs))))
				(let ([choice (make-choice choices)])
					(vector-set! occs choice (+ 1 (vector-ref occs choice)))
					(set! i (+ i 1)))))))


