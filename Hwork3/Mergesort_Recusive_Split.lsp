
(defun partition (list-to-sort)
  (let* ((mid (floor (length list-to-sort) 2))
        (left (subseq list-to-sort 0 mid))
        (right (subseq list-to-sort mid))
		)
    (values left right)
	)
)

(defun mergeLists (listA listB)
	(cond
		((= (list-length listA) 0) listB)
		((= (list-length listB) 0) listA)
		;if item smaller than other
		((< (car listA) (car listB)) (append (list (car listA)) (mergeLists (cdr listA) listB)))
		((> (car listA) (car listB)) (append (list (car listB)) (mergeLists listA (cdr listB))))
		;if both items the same
		((= (car listA) (car listB)) (append (list (car listA) 
													(car listB)) 
													(mergeLists (cdr listA) (cdr listB)))
		)
    )
 )


(defun mergesort (list-to-sort)
	(if (> (length list-to-sort) 1)
		(multiple-value-bind (left right) (partition list-to-sort)
        (mergeLists (mergesort left) (mergesort right))
		)
      
	list-to-sort)
)




(print "Loading Mergesort_Recusive_Split: Q2")
(print "runing list (9 7 5 3 1 2 4 6 8)")
(print "")
(write (mergesort '(9 7 5 3 1 2 4 6 8)))















