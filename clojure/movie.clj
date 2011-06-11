(def movie (ref "The Empire Strikes Back"))
(defn movie-changed [key rf old new] (println old " > " new))
@movie
(add-watch movie :movie-watcher movie-changed)