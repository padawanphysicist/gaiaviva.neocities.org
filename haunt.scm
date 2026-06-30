;;; haunt.scm - Site configuration
;;;
;;; Run:  haunt build => compiles to ./site/
;;;       haunt serve => serves at http://localhost:8080

(use-modules (haunt site)
             (haunt reader commonmark)
             (haunt builder assets)
             (haunt artifact)
             (haunt post)
             (haunt html)
             (builder linktree))

(define *metadata*
  `((title . "Gaia Vivá")
    (description . "🌿 Culinária Consciente, prática e saborosa. Retiros, oficinas e encontros de saúde")
    (avatar . "assets/img/avatar.png")
    (footer .
            `(p "2026 • Desenvolvido com ❤️ por: "
                (a (@ (href "https://padawanphysicist.gitlab.io/") (target "_blank") (rel "noopener noreferrer"))
                   "@vct")))
    (entries .
             (
              ,(card
                #:type 'image
                #:title "Inscrição"
                #:description "Oficina de Culinária Saudável e Prática"
                #:asset "assets/img/oficina.jpeg"
                #:link "https://wa.me/5585997491882")
              ,(card
                #:type 'image
                #:title "Jornada de Desintoxicação"
                #:description "Retiro Presencial no Ceará/Outubro 2026"
                #:link "https://gaiatm.wixsite.com/jornada-de-desintoxi"
                #:asset "assets/img/jornada.jpeg")
              ,(card
                #:type 'image
                #:title "E-book"
                #:description "Cozinha Saudável e Prática para o dia a dia"
                #:link "https://gaiaviva-ebook-cozinhasaudavel.my.canva.site/"
                #:asset "assets/img/ebook.jpeg")
              ,(card
                #:type 'image
                #:title "Curso Online"
                #:description "Coma Bem, Viva Melhor Ainda"
                #:link "https://gaiaviva.orbitpages.online/coma-bem-viva-melhor-ainda"
                #:asset "assets/img/curso.jpeg")
              ,(card
                #:type 'icon
                #:title "Fale Comigo"
                #:description #f
                #:link "https://wa.me/5585997491882"
                #:asset "assets/img/whatsapp.png")))))

;;;;;;;;;;;;;;;;;;;;;;;
;; Definição do site ;;
;;;;;;;;;;;;;;;;;;;;;;;
(site #:title     "Gaia Vivá"
      #:domain    "https://gaiaviva.neocities.org"
      #:make-slug post-slug-v2
      #:readers   (list commonmark-reader)
      #:builders
      (list
       ;; Link in Bio
       (linktree-builder *metadata*)
       (static-directory "assets")))
