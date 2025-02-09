(fn Page []
  ;; https://redbean.dev/#unix.opendir
  (let [tbody (icollect [name kind ino off (unix.opendir ".")]
                [:tr [:td name] [:td kind] [:td ino] [:td off]])]
    [:table
     [:thead [:th :name] [:th :kind] [:th :ino] [:th :off]]
     [:tbody (table.unpack tbody)]]))

{:GET Page}



