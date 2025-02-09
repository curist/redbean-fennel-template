(fn NavBar []
  [:fragment
   [:style
    (.. "nav.menu ul { padding: 0; }"
        "nav.menu li { display: inline-block; margin-right: 15px; }"
        "nav.menu a { text-decoration: none; }")]
   [:nav {:class :menu}
    [:ul
     [:li [:a {:href "/"} "Home"]]
     [:li [:a {:href "/pages/hello.fnl"} "Hello"]]
     [:li [:a {:href "/pages/form.fnl"} "Simple Form"]]
     [:li [:a {:href "/pages/dir"} "Explore Dir"]]]]])
