;;; linkbio.scm --- Layout da página Linkbio

(define-module (src layouts linkbio)
  #:use-module (haunt site)
  #:use-module (haunt html)
  #:use-module (haunt artifact)
  #:use-module (src layouts base))

(define (linkbio-layout site posts)
  (base-layout
   (site-title site)
   (site-default-metadata site)
     `(div (@ (class "w-full min-h-screen bg-surface text-text-dark flex flex-col items-center justify-start p-5 md:justify-center"))
        (div (@ (class "w-full max-w-2xl flex flex-col"))
             
             ;; Header
             (header (@ (class "text-center mb-6"))
                     (div (@ (class "w-28 h-28 mx-auto mb-4 rounded-full overflow-hidden border-3 border-primary-light shadow-md"))
                          (img (@ (src "assets/img/avatar.png") (alt "Profile Avatar") (class "w-full h-full object-cover"))))
                     (h1 (@ (class "text-4xl font-serif font-bold mb-2 text-primary")) "Gaia Vivá")
                     (p (@ (class "text-lg italic text-muted leading-relaxed"))
                        "🌿 Culinária saudável, Prática e Consciente." (br) "Retiros, oficinas e encontros de saúde")
                     (div (@ (class "h-[2px] w-3/5 mx-auto my-6 bg-gradient-to-r from-transparent via-primary-light to-transparent"))))
             
             ;; Navegação
             (nav (@ (class "w-full"))
                  (ul (@ (class "grid grid-cols-1 md:grid-cols-2 gap-4 list-none p-0 m-0"))
                      
                      ;;;;;;;;;;;;;;;;;;;;;;;
                      ;; Cartão 1: Oficina ;;
                      ;;;;;;;;;;;;;;;;;;;;;;;
                      (li (@ (class "md:col-span-2"))
                          (a (@ (href "https://wa.me/5585997491882?text=Ol%C3%A1!%20Gostaria%20de%20me%20inscrever%20na%20oficina.") (target "_blank") (class "block transition transform hover:-translate-y-1"))
                          (div (@ (class "flex bg-raised overflow-hidden h-28 rounded-xl border border-emphasis shadow-sm"))
                               (div (@ (class "w-24 h-full flex-shrink-0")
                                       (style "-webkit-mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%); mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%);"))
                                    (img (@ (src "assets/img/oficina.jpeg") (class "w-full h-full object-cover"))))
                               (div (@ (class "flex-1 p-4 flex flex-col justify-center"))
                                    (h3 (@ (class "text-lg font-serif font-bold text-primary mb-1")) "Inscrição")
                                    (p (@ (class "text-sm text-muted leading-tight")) "Oficina de Culinária Saudável e Prática para o Dia a Dia")
                                    (p (@ (class "text-sm text-secondary leading-tight mt-1"))
                                       (b "10/10/2026 - 8 às 13h"))))))
                      
                      ;; Cartão 2: Jornada de Desintoxicação
                      ;; (li
                      ;;  (a (@ (href "https://gaiatm.wixsite.com/jornada-de-desintoxi") (target "_blank") (class "block transition transform hover:-translate-y-1"))
                      ;;     (div (@ (class "flex bg-raised overflow-hidden h-28 rounded-xl border border-emphasis shadow-sm"))
                      ;;          (div (@ (class "w-24 h-full flex-shrink-0")
                      ;;                  (style "-webkit-mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%); mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%);"))
                      ;;               (img (@ (src "assets/img/jornada.jpeg") (class "w-full h-full object-cover"))))
                      ;;          (div (@ (class "flex-1 p-4 flex flex-col justify-center"))
                      ;;               (h3 (@ (class "text-lg font-serif font-bold text-primary mb-1")) "Jornada de Desintoxicação")
                      ;;               (p (@ (class "text-sm text-muted leading-tight")) "Retiro Presencial no Ceará/Outubro 2026")))))
                      
                      ;; Cartão 3: E-book
                      (li
                       (a (@ (href "https://gaiaviva-ebook-cozinhasaudavel.my.canva.site/") (target "_blank") (class "block transition transform hover:-translate-y-1"))
                          (div (@ (class "flex bg-raised overflow-hidden h-28 rounded-xl border border-emphasis shadow-sm"))
                               (div (@ (class "w-24 h-full flex-shrink-0")
                                       (style "-webkit-mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%); mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%);"))
                                    (img (@ (src "assets/img/ebook.jpeg") (class "w-full h-full object-cover"))))
                               (div (@ (class "flex-1 p-4 flex flex-col justify-center"))
                                    (h3 (@ (class "text-lg font-serif font-bold text-primary mb-1")) "E-book")
                                    (p (@ (class "text-sm text-muted leading-tight")) "Cozinha Saudável e Prática para o dia a dia")))))
                      
                      ;; Card 4: Curso
                      (li
                       (a (@ (href "https://gaiaviva.orbitpages.online/coma-bem-viva-melhor-ainda") (target "_blank") (class "block transition transform hover:-translate-y-1"))
                          (div (@ (class "flex bg-raised overflow-hidden h-28 rounded-xl border border-emphasis shadow-sm"))
                               (div (@ (class "w-24 h-full flex-shrink-0")
                                       (style "-webkit-mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%); mask-image: linear-gradient(to right, rgba(0,0,0,1) 60%, rgba(0,0,0,0) 100%);"))
                                    (img (@ (src "assets/img/curso.jpeg") (class "w-full h-full object-cover"))))
                               (div (@ (class "flex-1 p-4 flex flex-col justify-center"))
                                    (h3 (@ (class "text-lg font-serif font-bold text-primary mb-1")) "Curso Online")
                                    (p (@ (class "text-sm text-muted leading-tight")) "Coma Bem, Viva Melhor Ainda")))))
                      
                      ;; Card 5: WhatsApp
                      (li (@ (class "md:col-span-2"))
                       (a (@ (href "https://wa.me/5585997491882") (target "_blank") (class "block transition transform hover:-translate-y-1"))
                          (div (@ (class "flex bg-raised overflow-hidden h-28 rounded-xl border border-primary-light shadow-sm"))
                               (div (@ (class "w-24 h-full flex-shrink-0 bg-emerald-500/10 flex items-center justify-center"))
                                    ;; (img (@ (src "assets/img/whatsapp.png") (class "w-11 h-11 object-contain")))
                                    (i (@ (class "fab fa-whatsapp text-4xl text-center object-contain")))
                                    )
                               (div (@ (class "flex-1 p-4 flex flex-col justify-center"))
                                    (h3 (@ (class "text-lg font-serif font-bold text-primary mb-1")) "Fale Comigo")
                                    (p (@ (class "text-sm text-muted leading-tight")) "Tire suas dúvidas direto no WhatsApp"))))))))             
             ;; Footer
             (footer (@ (class "text-center mt-10 py-4 w-full"))
                     (p (@ (class "text-xs text-muted font-sans"))
                        "2026 • Desenvolvido com ❤️ por: "
                        (a (@ (href "https://padawanphysicist.codeberg.page/") (target "_blank") (class "underline text-primary")) "@vct"))))))

(define-public (linkbio-page site posts)
   (serialized-artifact
    "bio/index.html"
    (linkbio-layout site posts)
    sxml->html))
