(local hup (require :hup))

; (SetHeader :Content-Type "text/html; charset=utf-8")

(-> (hup [:div "<script>alert('hi!!')</script>"]) Write)
(-> (hup [:div "hello world!!"]) Write)
(-> (hup
      [:svg {:width 500 :height 100}
       [:circle {:cx  25 :cy 50 :r 25 :fill "blue"}]
       [:circle {:cx 100 :cy 75 :r 25 :fill "red"}]])
    Write)
