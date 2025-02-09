(local hup (require :hup))

(local Pages {})

(fn Pages.GET []
  [:fragment
   [:h4 "just a simple form"]
   [:form {:method :post}
    [:label "name"
     [:input {:name "name"}]]
    [:label "age"
     [:input {:name "age"}]]
    [:input {:type :submit}]]])

(fn Pages.POST []
  [:fragment
   [:div "posted params:"]
   [:div (EncodeLua (GetParams))]])

(fn NotFound []
  [:fragment
   [:h2 "404 not found"]])

(-> ((or (. Pages (GetMethod)) NotFound)) hup Write)

