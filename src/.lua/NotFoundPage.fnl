(fn NotFound []
  [:fragment
   [:h2 "404 not found"]
   [:h3 "method"]
   [:div (GetMethod)]
   [:h3 "path"]
   [:div (GetPath)]])

