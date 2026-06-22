(define-module (builder linktree)
  #:use-module (haunt artifact)
  #:use-module (haunt html)
  #:use-module (haunt post)
  #:use-module (haunt site)
  #:export (linktree-builder
            template-tailwind
            template-editorial
            link/icon
            link/card
            link/image
            link/plain))

(define (link/plain label url)
  `((label . ,label)
    (url   . ,url)))

(define (link/icon label url icon)
  `((label      . ,label)
    (url        . ,url)
    (icon-image . ,icon)))

(define (link/image label url image-src)
  `((label . ,label)
    (url   . ,url)
    (image . ,image-src)))

(define (link/card label url image-src description)
  `((label       . ,label)
    (url         . ,url)
    (image       . ,image-src)
    (description . ,description)))

(define (link-label       l) (or (assoc-ref l 'label)       ""))
(define (link-url         l) (or (assoc-ref l 'url)         "#"))
(define (link-icon        l)     (assoc-ref l 'icon))
(define (link-image       l)     (assoc-ref l 'image))
(define (link-description l) (or (assoc-ref l 'description) ""))
(define (link-icon-image l) (assoc-ref l 'icon-image))

(define (tw-link-prefix link)
  (cond
    ((link-image link)
     `(img (@ (src   ,(link-image link))
              (alt   ,(link-label link))
              (class "w-6 h-6 rounded object-cover flex-shrink-0"))))
    ((link-icon-image link)                          ; ← era link-icon
     `(img (@ (src   ,(link-icon-image link))        ; ← era link-icon
              (alt   ,(link-label link))
              (class "w-6 h-6 rounded object-contain flex-shrink-0"))))
    (else
     `(span (@ (class "w-6 flex-shrink-0")) ""))))


(define (simple-link-prefix link style)
  (cond
    ((link-image link)
     `(img (@ (src   ,(link-image link))
              (alt   ,(link-label link))
              (style ,style))))
    ((link-icon-image link)                          ; ← era link-icon
     `(img (@ (src   ,(link-icon-image link))        ; ← era link-icon
              (alt   ,(link-label link))
              (style ,style))))
    (else "")))

;; (define (tw-link-prefix link)
;;   (cond
;;     ((link-image link)
;;      `(img (@ (src   ,(link-image link))
;;               (alt   ,(link-label link))
;;               (class "w-6 h-6 rounded object-cover flex-shrink-0"))))
;;     ((link-icon link)
;;      `(span (@ (class "text-lg leading-none flex-shrink-0"))
;;             ,(link-icon link)))
;;     (else
;;      `(span (@ (class "w-6 flex-shrink-0")) ""))))

;; (define (simple-link-prefix link style)
;;   (cond
;;     ((link-image link)
;;      `(img (@ (src   ,(link-image link))
;;               (alt   ,(link-label link))
;;               (style ,style))))
;;     ((link-icon link)
;;      `(span (@ (style "font-size:1.1rem;flex-shrink:0;"))
;;             ,(link-icon link)))
;;     (else "")))

(define (template-editorial nome iniciais bio links rodape)
  (let* ((parts    (string-split bio #\|))
         (headline (string-trim (car parts)))
         (sub      (if (> (length parts) 1)
                       (string-trim (cadr parts))
                       "")))
    `(html (@ (lang "pt-BR"))
       (head
         (meta (@ (charset "utf-8")))
         (meta (@ (name "viewport") (content "width=device-width, initial-scale=1")))
         (title ,nome)
         (link (@ (rel "preconnect") (href "https://fonts.googleapis.com")))
         (link (@ (rel "preconnect") (href "https://fonts.gstatic.com") (crossorigin "")))
         (link (@ (rel "stylesheet")
                  (href "https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap")))
         (style "
           *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
           body { background: #f5f4f0; font-family: system-ui, sans-serif;
                  min-height: 100vh; display: flex; justify-content: center;
                  padding: 2.5rem 0 4rem; }
           .page { width: 100%; max-width: 420px; padding: 0 1.25rem; }
           .header { display: flex; align-items: center; gap: 10px; margin-bottom: 1.5rem; }
           .avatar { width: 44px; height: 44px; border-radius: 50%; background: #c9b8a8;
                     overflow: hidden; flex-shrink: 0; border: 2px solid #e0d8cf;
                     display: flex; align-items: center; justify-content: center;
                     font-size: 13px; font-weight: 500; color: #5a4a3a; }
           .avatar img { width: 100%; height: 100%; object-fit: cover; display: block; }
           .header-name { font-size: 11px; font-weight: 500; letter-spacing: .12em;
                          color: #3a3028; text-transform: uppercase; line-height: 1.5; }
           .divider { width: 48px; height: 1px; background: #c9b8a8; margin: 0 auto 1.75rem; }
           h1 { font-family: 'Playfair Display', Georgia, serif; font-size: 2.6rem;
                font-weight: 700; color: #2a2118; text-align: center;
                line-height: 1.05; letter-spacing: -.01em; margin-bottom: .5rem; }
           .sub { text-align: center; font-size: 13px; color: #8a7a6a;
                  margin-bottom: 2rem; letter-spacing: .01em; line-height: 1.5; }
           .cards { display: flex; flex-direction: column; gap: 10px; }
           .card { display: flex; align-items: stretch; background: #fff;
                   border-radius: 10px; overflow: hidden; border: .5px solid #e8e2da;
                   text-decoration: none; color: inherit; min-height: 90px;
                   transition: background .15s; }
           .card:hover { background: #faf9f7; }
           .card-media { width: 96px; flex-shrink: 0; align-self: stretch; background: #e8e0d5; }
           .card-media img { width: 100%; height: 100%; object-fit: cover; display: block; }
           .card-placeholder { width: 100%; height: 100%; min-height: 90px;
                               display: flex; align-items: center; justify-content: center;
                               font-size: 1.5rem; color: #b0a090; }
           .card-body { padding: 14px 16px; display: flex; flex-direction: column;
                        justify-content: center; gap: 5px; }
           .card-title { font-size: 11px; font-weight: 500; letter-spacing: .1em;
                         color: #2a2118; text-transform: uppercase; }
           .card-desc { font-size: 12px; color: #8a7a6a; line-height: 1.55; }
           footer { text-align: center; font-size: 11px; color: #c0b0a0; margin-top: 2.5rem; }
         "))
       (body
         (div (@ (class "page"))
           (div (@ (class "header"))
             (div (@ (class "avatar")) ,iniciais)
             (div (@ (class "header-name"))
               ,@(map (lambda (parte)
                        `(span ,(string-trim parte) (br)))
                      (string-split nome #\space))))
           (div (@ (class "divider")))
           (h1 ,headline)
           (p  (@ (class "sub")) ,sub)
           (nav (@ (class "cards") (aria-label "Links"))
             ,@(map (lambda (link)
                      `(a (@ (href   ,(link-url link))
                             (target "_blank")
                             (rel    "noopener noreferrer")
                             (class  "card"))
                          (div (@ (class "card-media"))
                               ,(cond
                                 ((link-image link)
                                  `(img (@ (src ,(link-image link))
                                           (alt ,(link-label link)))))
                                 ((link-icon-image link)                         ; ← era link-icon
                                  `(div (@ (class "card-placeholder"))
                                        (img (@ (src   ,(link-icon-image link))  ; ← era link-icon
                                                (alt   ,(link-label link))
                                                (style "width:36px;height:36px;object-fit:contain;border-radius:6px;")))))
                                 (else
                                  `(div (@ (class "card-placeholder")) "·"))))
                          ;; (div (@ (class "card-media"))
                          ;;   ,(if (link-image link)
                          ;;        `(img (@ (src ,(link-image link))
                          ;;                 (alt ,(link-label link))))
                          ;;        `(div (@ (class "card-placeholder"))
                          ;;              ,(or (link-icon link) "·"))))
                          (div (@ (class "card-body"))
                            (div (@ (class "card-title")) ,(link-label link))
                            (div (@ (class "card-desc"))  ,(link-description link)))))
                    links))
           (footer ,rodape))))))

(define (template-tailwind nome iniciais bio links rodape)
  `(html (@ (lang "pt-BR"))
     (head
       (meta (@ (charset "utf-8")))
       (meta (@ (name "viewport") (content "width=device-width, initial-scale=1")))
       (title ,nome)
       (script (@ (src "https://cdn.tailwindcss.com")) ""))
     (body (@ (class "bg-gray-50 dark:bg-gray-950 min-h-screen flex items-start justify-center py-16 px-4"))
       (main (@ (class "w-full max-w-sm flex flex-col items-center"))
         (div (@ (class "w-20 h-20 rounded-full bg-blue-100 dark:bg-blue-900
                         flex items-center justify-center
                         text-blue-700 dark:text-blue-200
                         text-2xl font-medium mb-3"))
              ,iniciais)
         (h1 (@ (class "text-lg font-medium text-gray-900 dark:text-gray-100 mb-1")) ,nome)
         (p  (@ (class "text-sm text-gray-500 dark:text-gray-400 text-center mb-8")) ,bio)
         (nav (@ (class "w-full flex flex-col gap-3") (aria-label "Links"))
           ,@(map (lambda (link)
                    `(a (@ (href   ,(link-url link))
                           (target "_blank")
                           (rel    "noopener noreferrer")
                           (class  "flex items-center gap-3 px-5 py-4
                                    rounded-xl border border-gray-200 dark:border-gray-800
                                    bg-white dark:bg-gray-900
                                    text-sm font-medium text-gray-800 dark:text-gray-100
                                    hover:bg-gray-50 dark:hover:bg-gray-800
                                    transition-colors duration-150"))
                        ,(tw-link-prefix link)
                        (span (@ (class "flex-1")) ,(link-label link))
                        (span (@ (class "text-gray-400 dark:text-gray-600 text-xs")) "→")))
                  links))
         (footer (@ (class "mt-10 text-xs text-gray-400 dark:text-gray-600")) ,rodape)))))

(define (linktree-builder config)
  (lambda (site posts)
    (let* ((template (or (assoc-ref config 'template) template-tailwind))
           (nome     (assoc-ref config 'name))
           (iniciais (assoc-ref config 'initials))
           (bio      (assoc-ref config 'bio))
           (links    (assoc-ref config 'links))
           (rodape   (or (assoc-ref config 'footer) "Feito com Haunt & Guile Scheme"))
           (output   (or (assoc-ref config 'output)  "index.html")))
      (list
        (serialized-artifact
          output
          (template nome iniciais bio links rodape)
          sxml->html)))))
