{:repl {} ;; FIXME
 :user
 {:dependencies [;; FIXME
                 ;; [com.cemerick/pomegranate "0.3.1"]

                 ;; FIXME
                 ;; [im.chit/vinyasa "0.4.7"]

                 ;; Pretty-print stack traces
                 [io.aviso/pretty "0.1.29"]

                 ;; FIXME
                 ;; [leiningen-core "2.6.1"]

                 ;; Properly refresh a dirty namespace
                 [org.clojure/tools.namespace "0.2.11"]]

  :plugins [;; Integration with Emacs
            [cider/cider-nrepl "0.13.0"]

            ;; Miscellaneous linting
            [jonase/eastwood "0.2.3"]

            ;; Check for outdated dependencies and plugins
            [lein-ancient "0.6.10"]

            ;; Basic linting
            [lein-bikeshed "0.3.0"]

            ;; Style linting
            [lein-cljfmt "0.5.3"]

            ;; Generate HTML documentation
            [lein-codox "0.9.5"]

            ;; Miscellaneous linting
            [lein-kibit "0.1.2"]

            ;; Check for unused functions
            [venantius/yagni "0.1.4"]]

  :java-source-paths ["/Users/raxod502/.lein/inject"]

  :injections [
               (set! *err* (raxod502.dotfiles.WarningFilteringWriter. *err*))

               ;; (require '[vinyasa.inject :as inject])

               ;; (let [specs '[[clojure.pprint pp pprint]
               ;;               [clojure.repl doc pst source]
               ;;               [clojure.tools.namespace.repl refresh]]
               ;;       original-ns (symbol (str *ns*))]
               ;;   (ns &user)
               ;;   (def &exclusions (zipmap (map first specs)
               ;;                            (repeat #{})))
               ;;   (alter-var-root #'clojure.core/ns
               ;;                   (fn [ns]
               ;;                     (fn [&form &env name & args]
               ;;                       `(do
               ;;                          (println ~(str "Starting to load " (clojure.core/name name)))
               ;;                          ~(apply ns &form &env name args)
               ;;                          (println ~(str "Finished loading " (clojure.core/name name)))
               ;;                          (let [~'interns (keys (ns-interns *ns*))]
               ;;                            ~@(let
               ;;                                  (keep (fn [[ns & fns]]
               ;;                                          ;; By not doing injection on any of the namespace
               ;;                                          ;; that we are injecting, we prevent cyclic load
               ;;                                          ;; dependency errors.
               ;;                                          (print (str "Checking if we should import " ns " -- "))
               ;;                                          (if-not (some #{name} (map first specs))
               ;;                                            (do
               ;;                                              (println "yes")
               ;;                                              `(do
               ;;                                                 (println ~(str "actually importing " ns))
               ;;                                                 (require ['~ns :refer '~fns :exclude ~'interns])
               ;;                                                 (println "(finished)")))
               ;;                                            (println "no")))
               ;;                                        specs))))))))

               ;; Inject some functions into clojure.core, so that
               ;; they are available everywhere.
               ;; (inject/in clojure.core
               ;;            [clojure.pprint pp pprint]
               ;;            [clojure.repl doc pst source]
               ;;            [clojure.tools.namespace.repl refresh]
               ;;            ;; [vinyasa.lein lein]
               ;;            ;; [vinyasa.maven pull]
               ;;            )

               ;; Use pretty stack traces by default.
               ;; (require 'clojure.main 'clojure.repl 'io.aviso.repl)
               ;; (alter-var-root #'clojure.main/repl-caught
               ;;                 (constantly io.aviso.repl/pretty-pst))
               ;; (alter-var-root #'clojure.repl/pst
               ;;                 (constantly io.aviso.repl/pretty-pst))


               ;; Prevent the Clojure REPL from showing in the Mac app switcher.
               ;; See http://stackoverflow.com/questions/24619300/hide-clojure-repl-from-command-tab-application-switcher-via-lein-command-line
               :jvm-opts ["-Dapple.awt.UIElement=true"]]}}
