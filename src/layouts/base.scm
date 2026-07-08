;; layouts/base.scm --- Layout básico compartilhado entre as páginas
(define-module (src layouts base)
  #:use-module (ice-9 format))

(define (insert-base-meta-tags metadata)
  `((base (@ (href ,(assq-ref metadata 'domain))))    
    (meta (@ (charset ,(assq-ref metadata 'encoding))))
    (meta (@ (name "viewport")
             (content "width=device-width, initial-scale=1")))
    (meta (@ (name "description") (content ,(assq-ref metadata 'description))))))

(define (insert-open-graph-meta-tags title metadata)
  "Open Graph (OG) Metadata (For Social Media sharing)"
  `((meta (@ (property "og:type")             
             (content "website")))
    (meta (@ (property "og:url")             
             (content ,(assq-ref metadata 'domain))))
    (meta (@ (property "og:title")             
             (content ,title)))
    (meta (@ (property "og:description")             
             (content ,(assq-ref metadata 'description))))
    
    ;; Imagem de exibição (Card do WhatsApp) - Substitua pela URL final da imagem/logo do Dr. Marco
    ;; Proporção ideal para redes sociais é 1200x630 pixels
    (meta (@ (property "og:image")
             (content ,(assq-ref metadata 'img-preview))))
    (meta (@ (property "og:image:width")
             (content ,(format #f "~a" (car (assq-ref metadata 'img-preview-size))))))
    (meta (@ (property "og:image:height")
             (content ,(format #f "~a" (car (cdr (assq-ref metadata 'img-preview-size)))))))
    (meta (@ (property "og:image:alt")
             (content ,(assq-ref metadata 'img-preview-description))))

    ;; Twitter Cards (Garante compatibilidade extra se compartilhado em outras redes)
    (meta (@ (name "twitter:card")
             (content "summary_large_image")))
    (meta (@ (name "twitter:title")
             (content ,title)))
    (meta (@ (name "twitter:description")
             (content ,(assq-ref metadata 'img-preview-description))))
    (meta (@ (name "twitter:image")
             (content ,(assq-ref metadata 'img-preview))))))

(define* (make-favicon-link rel size href type #:key (path ""))
  `(link (@ (rel ,rel)
            ,@(if type `((type ,type)) '())
            ,@(if size `((sizes ,size)) '())
            (href ,(string-append path href)))))

(define (insert-favicon-meta-tags metadata)
  (let* ((favicon-meta (assq-ref metadata 'favicon))
         (base-path    (or (assq-ref favicon-meta 'path) ""))
         (icons        (assq-ref favicon-meta 'icon)))
    (map (lambda (spec)
           ;; Desestrutura os 4 elementos posicionais de spec e passa #:path explicitamente
           (apply (lambda (rel size href type)
                    (make-favicon-link rel size href type #:path base-path))
                  spec))
         icons)))

(define (insert-custom-css metadata)
  (map (lambda (css-path)
         `(link (@ (rel "stylesheet")
                   (href ,css-path))))
       (assq-ref metadata 'custom-css)))

(define-public (base-layout title metadata body)
  "Define o esqueleto básico das páginas"
  (begin
    `((doctype "html")
      (html (@ (lang ,(assq-ref metadata 'lang)))
            (head             
             (title ,title)
             ,(insert-base-meta-tags metadata)
             ,(insert-open-graph-meta-tags title metadata)
             ,(insert-favicon-meta-tags metadata)
             ,(insert-custom-css metadata))
            (body
             ,body)))))
