;;; haunt.scm - Site configuration
;;;
;;; Run:  haunt build => compiles to ./site/
;;;       haunt serve => serves at http://localhost:8080

(use-modules (haunt site)
             (src layouts base)
             (haunt builder assets)
             (src layouts landing)
             (src layouts linkbio)
             (src layouts consulting))

;; PROG: ajusta o domínio da página de acordo com o ambiente (dev/prod)
(define %site-domain
  (let ((site-environment (getenv "SITE_ENVIRONMENT")))
    (if site-environment
        (cond
         ((string=? site-environment "qa")
          "https://pachamama.codeberg.page/gaiaviva.neocities.org/")
         ((string=? site-environment "prod")
          "https://gaiaviva.neocities.org/")
         (else "http://localhost:8080/"))
        "http://localhost:8080/")))

;;;;;;;;;;;;;;;;;;;;;;;
;; Definição do site ;;
;;;;;;;;;;;;;;;;;;;;;;;
(site #:title            "Gaia Vivá"
      #:domain           %site-domain
      #:default-metadata `((domain . ,%site-domain)                           
                           (author      . "Victor Santos")
                           (email       . "vct.santos@protonmail.com")
                           (lang        . "pt-BR")
                           (encoding    . "utf-8")
                           (description . "Página da Gaia Vivá")
                           ;; Imagem de exibição (Card do WhatsApp):
                           ;; Proporção ideal para redes sociais é 1200x630 pixels
                           (img-preview . "assets/img/og-preview.jpg")
                           (img-preview-size . (1200 630)) ;; (width height)
                           (img-preview-description . "Imagem da Gaia Vivá")
                           (favicon . ((path . "assets/img/favicon/")
                                       (icon . (("apple-touch-icon" "180x180" "favicon-apple-touch-icon-180x180.png" #f)
                                                ("icon"             "16x16"   "favicon-16x16.png"                   "image/png")
                                                ("icon"             "32x32"   "favicon-32x32.png"                   "image/png")
                                                ("icon"             "512x512" "favicon-512x512.png"                 "image/png")
                                                ("icon"             #f        "favicon.ico"                          "image/x-icon")))))
                           (custom-css . ("assets/css/default.css"
                                          "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css")))
      #:build-directory  "public_html/"
      #:readers          '()
      #:file-filter      (make-file-filter '("^\\." "^#" "~$" "default.input.css" "\\.bash$"))
      #:builders         (list landing-page
                               linkbio-page
                               consulting-page
                               ;; Static files
                               (static-directory "assets")))
