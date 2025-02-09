(local hup (require :hup))

(fn Sakura []
  [:link
   {:rel :stylesheet
    :type :text/css
    :href "https://cdn.jsdelivr.net/npm/sakura.css/css/sakura.css"}])

(fn InfoPage []
  ;; https://redbean.dev/#unix.opendir
  (let [tbody (icollect [name kind ino off (unix.opendir ".")]
                [:tr [:td name] [:td kind] [:td ino] [:td off]])]
    [:table
     [:thead [:th :name] [:th :kind] [:th :ino] [:th :off]]
     [:tbody (table.unpack tbody)]]))

(-> [:fragment
     (Sakura)
     (InfoPage)]
    hup Write)



