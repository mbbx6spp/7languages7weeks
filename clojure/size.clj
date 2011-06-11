(defn size [lst] 
	(if (empty? lst)
		0
		(inc (size (rest lst)))))

(println "size" (size '(1 2 3)))

(defn fast-size [lst]
	(loop [l lst c 0] 
	(if (empty? l)
		c
		(recur (rest l) (inc c)))))

(println "fast-size" (fast-size '(1 2 3 4 5)))