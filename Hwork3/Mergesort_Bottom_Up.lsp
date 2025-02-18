
(defun get2 (list-to-split)
	;get first 2 eliments in list in there own list 
	(cons (car list-to-split) (cons (cadr list-to-split) nil)))


(defun partition (split-list list-to-split)
	;def to turn (# # # # #) into  ((# #)(# #)())
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
 
(defun listMergeDriver (partitiondList)
	(if (> (length partitiondList) 0)
		(setq partitiondList (mergeLists (mergeLists (list (caar partitiondList))
													(cdar partitiondList))
										(listMergeDriver (cdr partitiondList))
								)
		)
	partitiondList)
)


(defun mergesort (list-to-sort)
	(if (> (length list-to-sort) 1)
		(setq list-to-sort (listMergeDriver (partition nil 
													list-to-sort)))
      
	list-to-sort)
)



(print "Loading Mergesort_Bottom_Up: Q3")
(print "runing list (9 7 5 3 1 2 4 6 8)")
(print "")
(write (mergesort '(9 7 5 3 1 2 4 6 8)))
















