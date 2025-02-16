


(defun mergesort (list-to-sort)
  (if (> (length list-to-sort) 1)
      (let* ((mid (floor (length list-to-sort) 2))
             (left (subseq list-to-sort 0 mid))
             (right (subseq list-to-sort mid))
             (i 0)
             (j 0)
             (k 0))
        
        ;; Sorting the first half
        (mergesort left)
        
        ;; Sorting the second half
        (mergesort right)
        
        ;; Copy data from temp arrays
        (loop while (and (< i (length left)) (< j (length right)))
              do (if (< (nth i left) (nth j right))
                     (setf (nth k list-to-sort) (nth i left))
                     (setf (nth k list-to-sort) (nth j right)))
              (incf k)
              (if (< (nth i left) (nth j right))
                  (incf i)
                  (incf j)))

        ;; Double check
        (loop while (< i (length left))
              do (setf (nth k list-to-sort) (nth i left))
              (incf i)
              (incf k))

        (loop while (< j (length right))
              do (setf (nth k list-to-sort) (nth j right))
              (incf j)
              (incf k))))
  
  list-to-sort)