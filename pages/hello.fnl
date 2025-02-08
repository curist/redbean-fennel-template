(local hup (require :hup))

(-> (hup [:div "hello world!!"]) Write)
(-> (hup
      [:svg {:width 500 :height 100}
       [:circle {:cx  25 :cy 50 :r 25 :fill "blue"}]
       [:circle {:cx 100 :cy 75 :r 25 :fill "red"}]])
    Write)
