(local Pages {})

(fn Pages.GET []
  [:fragment
   [:div "shutdown server?"]
   [:form {:method :post}
    [:button "yes"]]])

(fn Pages.POST []
  (unix.kill (unix.getppid) 15)
  [:fragment
   [:div "shutting down server"]
   [:div "bye"]])

Pages

