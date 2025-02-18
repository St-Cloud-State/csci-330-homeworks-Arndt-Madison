

(defun addend (lst item)
	;adds item to end of list
	(append lst (cons item nil)))


(defun insert (sortedlsta itemsToSort sortedlstb)
	(if (> (length sortedlstb) 0)
		(progn
		(if (or (eql itemsToSort (first sortedlstb))
				(< itemsToSort (first sortedlstb)))
			(setq sortedlsta (append (addend sortedlsta itemsToSort)
										sortedlstb))
		)
		(if (> itemsToSort (first sortedlstb))
			(setq sortedlsta (insert (addend sortedlsta (car sortedlstb))
									itemsToSort 
									(cdr sortedlstb)))
		)
		)
		(setq sortedlsta (addend sortedlsta itemsToSort))
	)
sortedlsta)



(defun insertion-sort (lst)
	(if (> (length lst) 0)
		(setq lst (insert nil (car lst) (insertion-sort (cdr lst))))
	)
lst)



(print "Loading InsertionSort: Q4")
(print "runing list (9 7 5 3 1 2 4 6 8)")
(print "")
(write (insertion-sort '(9 7 5 3 1 2 4 6 8)))





