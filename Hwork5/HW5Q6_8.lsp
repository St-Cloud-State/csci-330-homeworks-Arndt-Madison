
;(load "HW5Q6.lsp")

;I = iES | iESeS
;E = GE | oG 
;G = x | y | z | w 
;S = s | dLb
;L = sL | nil



(defun parse-i (input-str)
  (if (> (length input-str) 0)
      (if (char= (aref input-str 0) #\i)
			(multiple-value-bind (parse result) (parse-e (subseq input-str 1))
				(if result
					(multiple-value-bind (parse result) (parse-s parse)
						(if (and result (> (length parse) 0))
							(if (char= (aref parse 0) #\e)
								(parse-s (subseq parse 1))
								(values "I parsing Error" nil))
							(values parse nil)))
                (values parse nil)))
          (values (format nil "~A != i" (aref input-str 0)) nil))
      (values "I input str cannot be empty" nil)))



(defun parse-e-recursive (input-str)
	(multiple-value-bind (parse result) (parse-g input-str)
    (if result
        (parse-e-recursive parse)
        parse)))

(defun parse-e (input-str)
	(if (> (length input-str) 0)
		(let* ((parse (parse-e-recursive input-str)))
			(if (char= (aref parse 0) #\o)
				(multiple-value-bind (parse result) (parse-g (subseq parse 1))
					(if result
						(values parse t)
						(values "G terminator not foud after o" nil)
					)
				)
				(values "o is not after a G terminator" nil)
			)
		)
		(values "E input str should not be empty" nil)
	)
)

(defun parse-g (input-str)
	(if (> (length input-str) 0)
		(if (or (char= (aref input-str 0) #\x)
				(char= (aref input-str 0) #\y)
				(char= (aref input-str 0) #\z)
				(char= (aref input-str 0) #\w))
			(values (subseq input-str 1) t)
			(values input-str nil)
		)
		(values input-str nil)
	)
)

(defun parse-s (input-str)
	(if (> (length input-str) 0)
		(progn
			(if (char= (aref input-str 0) #\s)
				(values (subseq input-str 1) t)
				
				(if (char= (aref input-str 0) #\d)
					(multiple-value-bind (parse result) (parse-l (subseq input-str 1))
						(if (and result (> (length parse) 0))
							(if (char= (aref parse 0) #\b)
								(values (subseq parse 1) t)
								(values "b is not found after s" nil)
							)
						(values "str should not end after ds^n" nil)
						)
					)
					(values "S parse error" nil)
				)
			)
			
		)
		(values "S input str should not be empty" nil)
	)
)

(defun parse-l (input-str)
	(if (> (length input-str) 0)
		(if (char= (aref input-str 0) #\s)
			(multiple-value-bind (parse result) (parse-l (subseq input-str 1))
				(values parse t)
			)
		(values input-str nil)
		)
		(values input-str nil)
	)
)

(format t "Loading HW5Q6: Q6~%")

(defparameter *valid* '("ixoys" "izowdsb" "izoydsssb" "ixowses" "izoydssbedsb" "iozses" "iozdssbes"))
(defparameter *invalid* '("ixoyc" "iysdbs" "izwdb" "iwxos" "ixsdls" "iysowzdl" "izwowsdsbsowx"))

(format t "Testing Valid strs~%")
(dolist (v *valid*)
  (format t "testing ~A~%" v)
  (format t "~A~%" (parse-i v))
  (format t "~%"))

(format t "Testing Invalid strs~%")
(dolist (v *invalid*)
  (format t "testing ~A~%" v)
  (format t "~A~%" (parse-i v))
  (format t "~%"))









