(define-module (builder linktree)
  #:use-module (haunt artifact)
  #:use-module (haunt html)
  #:use-module (haunt post)
  #:use-module (haunt site)
  #:export (linktree-builder
            card))

(define* (card #:key
               (type 'image)
               (link "www.example.com")
               (title "My Card")
               (asset "/img.png")
               (description "Card description"))

  (let ((img-class (if (eq? type 'image) "card-image" "card-icon")))
    `(a (@ (href ,link)
           (target "_blank")
           (rel "noopener noreferrer"))
        (div (@ (class "card"))
             (div (@ (class ,img-class))
                  (img (@ (src ,asset) (alt ,description) )))
             (div (@ (class "card-content"))
                  (h3 ,title)
                  (p ,(if description description "")))))))

(define (template-default title description avatar entries footer)
  `(html
    (@ (lang "pt-BR"))
    (head
     (meta (@ (charset "utf-8")))
     (meta (@ (name "viewport") (content "width=device-width, initial-scale=1")))
     (link (@ (rel "apple-touch-icon") (sizes "180x180") (href "assets/img/apple-touch-icon.png")))
     (link (@ (rel "icon") (type "image/png") (sizes "32x32") (href "assets/img/favicon-32x32.png")))
     (link (@ (rel "icon") (type "image/png") (sizes "16x16") (href "assets/img/favicon-16x16.png")))
     (link (@ (rel "manifest") (href "/site.webmanifest"))) 
     (link (@ (rel "stylesheet") (href "assets/css/default.css")))
     (title ,title))
    (body
     (div (@ (class "container"))
          (div (@ (class "header"))
               (div (@ (class "avatar"))
                    (img (@ (src ,avatar)
                            (alt "Profile Avatar"))))
               (h1 (@ (class "title")) ,title)
               (p (@ (class "description")) ,description)
               (div (@ (class "divider"))))
          (nav (@ (class "navigation"))
               (ul
                ,@(map
                   (lambda (entry)
                     ;; Format each link
                     `(li ,entry))
                   entries)))
          (footer (@ (class "profile-footer")) ,footer)))))

(define* (linktree-builder metadata
                           #:optional
                           (template template-default)
                           (output "index.html"))
  (lambda (site posts)
    (let* ((title (or (assoc-ref metadata 'title) "John Doe"))
           (description (or (assoc-ref metadata 'description) "Empregado do mês"))
           (avatar (or (assoc-ref metadata 'avatar) #f))
           (entries (or (assoc-ref metadata 'entries) '()))
           (footer (or (assoc-ref metadata 'footer) "Feito com Haunt & Guile Scheme")))
      (list
        (serialized-artifact
          output
          (template title description avatar entries footer)
          sxml->html)))))
