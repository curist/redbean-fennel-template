(local links
  [["/" "Home"]
   ["/pages/hello.fnl" "Hello"]
   ["/pages/form.fnl" "Simple Form"]
   ["/pages/dir/" "Explore Dir"]])

(fn NavBar []
  (let [path (GetPath)
        Links (icollect [_ [href name] (ipairs links)]
                (let [class (if (= path href) :active)]
                  [:li {: class}
                   [:a {: href} name]]))]
    [:fragment
     [:style
      (.. "nav.menu ul { padding: 0; }"
          "nav.menu li { display: inline-block; padding: 0 15px; }"
          "nav.menu li.active { border-bottom: 3px solid; border-color: #1d7484; }"
          "nav.menu a { text-decoration: none; }")]
     ;; TODO: handle active route?
     [:nav {:class :menu}
      [:ul (table.unpack Links)]]]))
