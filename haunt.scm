;;; haunt.scm - Site configuration
;;;
;;; Run:  haunt build => compiles to ./site/
;;;       haunt serve => serves at http://localhost:8080

(use-modules (haunt site)
             (haunt reader commonmark)   ; CommonMark/Markdown reader
             (haunt builder assets)
             (haunt artifact)
             (haunt post)
             (haunt html)
             (builder linktree))

;;;;;;;;;;;;;;;;;;;;;
;; Site definition ;;
;;;;;;;;;;;;;;;;;;;;;
(site #:title     "Gaia Vivá "
      #:domain    "https://gaiaviva.neocities.org"
      #:make-slug post-slug-v2
      #:readers   (list commonmark-reader)
      #:builders
      (list
        (linktree-builder          ; ← called here, inside (site ...)
          `((name     . "Gaia Vivá")
            (initials . "GV")
            (bio      . "Bem-vinda!|Está pronta para dar o seu próximo passo?")
            (template . ,template-editorial)
            (output   . "index.html")
            (links    .
              (,(link/card "Inscrição"
                           "https://wa.me/558597491882"
                           "assets/img/example.jpg"
                           "Oficina de Culinária Saudável e Prática")
               ,(link/card "Jornada de Desintoxicação"
                           "https://gaiatm.wixsite.com/jornada-de-desintoxi"
                           "assets/img/example.jpg"
                           "Retiro Presencial no Ceará/Outubro 2026")
               ,(link/card "E-book"
                           "https://gaiaviva-ebook-cozinhasaudavel.my.canva.site/"
                           "assets/img/example.jpg"
                           "Cozinha Saudável e Prática para o dia a dia")
               ,(link/card "Curso online"
                           "https://gaiaviva.orbitpages.online/coma-bem-viva-melhor-ainda"
                           "assets/img/example.jpg"
                           "Curso online Coma Bem, Viva Melhor Ainda")               
               ,(link/icon "Fale comigo"
                           "https://wa.me/5585997491882"
                           "/assets/img/whatsapp.jpg")))))
        (static-directory "assets")))
