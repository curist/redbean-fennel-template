(local hup (require :hup))

(fn GetPage []
  [:fragment
   [:div "shutdown?"]
   [:form {:action "/shutdown.fnl" :method :post}
    [:button "yes"]]])

(fn PostPage []
  (unix.kill (unix.getppid) 15)
  [:fragment
   [:div "shutting down server"]
   [:div "bye"]])

(let [page (if (= :POST (GetMethod)) PostPage GetPage)]
  (-> (page) hup Write))

