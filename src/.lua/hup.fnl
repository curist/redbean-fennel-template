(local self-closing-tags
  {:area true :base true :br true :col true :command true
   :embed true :hr true :img true :input true :keygen true
   :link true :menuitem true :meta true :param true
   :source true :track true :wbr true})

(fn array? [t]
  (and (> (length t) 0)
       (= nil (next t (length t)))))

(fn attr? [t]
  (and (= "table" (type t))
       (not (array? t))))

(fn stringify-attrs [attrs]
  (accumulate [s "" attr value (pairs attrs)]
    (.. s " " attr "=\"" (tostring value) "\"")))

(fn open [tag attrs]
  (string.format "<%s%s>" tag (stringify-attrs attrs)))

(fn close [tag] (string.format "</%s>" tag))

(local M {})

(local sanitize
  (or _G.EscapeHtml
      (fn [s]
        (-> (s:gsub "&" "&amp;")
            (: :gsub "\"" "&quot;")
            (: :gsub "'" "&#39;")
            (: :gsub "<" "&lt;")
            (: :gsub ">" "&gt;")))))

(fn stringify [tag attrs children]
  (let [attrs (or attrs {})
        children (or children [])]
    (if (. self-closing-tags tag)
      (string.format "<%s%s />" tag (stringify-attrs attrs))
      (.. (open tag attrs)
          (table.concat
            (icollect [_ child (ipairs children)]
              (if (not= :table (type child))
                (if (= :string (type child))
                  (sanitize child)
                  (tostring child))
                (M.hup child)))
            " ")
          (close tag)))))

(fn M.hup [markup]
  (let [[tag & attr-or-children] markup]
    (var attr {})
    (var children [])
    (case (length attr-or-children)
      0 :skip
      1 (let [[attr-or-child] attr-or-children]
          (if (attr? attr-or-child)
            (set attr attr-or-child)
            (set children [attr-or-child])))
      _ (let [[attr-or-child & rest-children] attr-or-children]
          (if (attr? attr-or-child)
            (do
              (set attr attr-or-child)
              (set children rest-children))
            (set children attr-or-children))))
    (stringify tag attr children)))

M.hup
