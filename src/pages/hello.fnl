(local hup (require :hup))

; (SetHeader :Content-Type "text/html; charset=utf-8")

(-> [:fragment
     [:div "<script>alert('hi!!')</script>"]
     [:div "hello world!!"]
     [:svg {:width 500 :height 100}
      [:circle {:cx  25 :cy 50 :r 25 :fill "blue"}]
      [:circle {:cx 100 :cy 75 :r 25 :fill "red"}]]
     [:hr]
     [:div
      [:h4 "params"]
      [:pre (EncodeJson (GetParams))]]
     ]
  hup Write)
