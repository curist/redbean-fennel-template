(fn resolve-path [base name]
  (case name
    :.. (path.dirname base)
    _ (path.join base name)))

(fn Row [{: name : kind : ino}]
  (let [basepath (path.join (unix.getcwd) (GetParam :path))
        target-path (resolve-path basepath name)]
    [:tr
     [:td (if (= 4 kind)
            [:a {:href (.. "?path=" target-path)} name]
            name)]
     [:td kind]
     [:td ino]]))

(fn Page []
  ;; https://redbean.dev/#unix.opendir
  (let [path (or (GetParam :path) ".")
        tbody (icollect [name kind ino (unix.opendir path)]
                (Row {: name : kind : ino}))
        tbody (doto tbody (tset 1 :fragment))]
    [:fragment
     [:style "a { text-decoration: underline; }"]
     [:h4 "dir info"]
     [:table
      [:thead [:th :name] [:th :kind] [:th :ino]]
      [:tbody tbody]]]))

{:GET Page}
