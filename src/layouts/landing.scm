;;; landing.scm --- Layout da página de aterrissagem

(define-module (src layouts landing)
  #:use-module (haunt site)
  #:use-module (haunt html)
  #:use-module (haunt artifact)
  #:use-module (src layouts base))

(define (landing-layout site posts)
  (base-layout
   (site-title site)
   (site-default-metadata site)
   `(div (@ (class "bg-surface text-primary min-h-screen flex items-center justify-center p-5 font-sans"))
    (div (@ (class "max-w-xl text-center py-10 px-5"))
      
      ;; Tag / Badge
      (h1 (@ (class "inline-block  text-primary text-lg font-semibold px-4 py-1.5 mb-6"))
        "Gaia Vivá")

      ;; Título Principal
      (h2 (@ (class "text-4xl md:text-5xl font-bold tracking-tight mb-4 leading-tight"))
        "Estamos construindo algo incrível!")

      ;; Descrição
      (p (@ (class "text-muted text-lg leading-relaxed mb-8"))
         "🏗️ O nosso site está atualmente em construção!")

      (ul (@ (class "list-style-none p-0 flex justify-center gap-4 mt-8"))
       
          (li (@ (class "inline bg-muted text-raised text-sm font-semibold px-4 py-1.5 rounded-full border border-sky-500/20"))
              (a (@ (href "bio"))
                 "Linkbio"))
       (li (@ (class "inline bg-primary text-raised text-sm font-semibold px-4 py-1.5 rounded-full border border-sky-500/20"))
         (a (@ (href "consultoria"))
            "Consultoria Personalizada")))))))

(define-public (landing-page site posts)
  (serialized-artifact
   "index.html"
   (landing-layout site posts)
   sxml->html))
