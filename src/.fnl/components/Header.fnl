(fn Sakura []
  [:link
   {:rel :stylesheet
    :type :text/css
    :href "https://cdn.jsdelivr.net/npm/sakura.css/css/sakura.css"}])

(fn Header []
  [:fragment
   [:meta {:name :viewport
           :content "width=device-width, initial-scale=1.0"}]
   (Sakura)])
