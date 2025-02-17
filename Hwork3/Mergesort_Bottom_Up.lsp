
(defun get2 (list-to-split)
	(cons (car list-to-split) (cons (cadr list-to-split) nil)))
		

(defun partition (split-list list-to-split)
	(if (> (length list-to-split) 1)
		(setq split-list (partition (cons (get2 list-to-split) 
											split-list)
									(cddr list-to-split)
							)
		)
	)
	(if (= (length list-to-split) 1)
		(setq split-list (cons list-to-split split-list))
	)
	split-list)


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




















