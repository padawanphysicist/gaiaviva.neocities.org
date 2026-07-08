(define-module (maak)
  #:declarative? #t
  #:use-module (maak maak)  
  #:use-module (haunt ui)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 popen) 
  #:use-module (ice-9 rdelim)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-1))

;; By default (no task given) run help.
(define (default)
  ($ '("maak --list")))

(define (build)
  "Constrói a página com o Haunt"
  ($ '("tailwindcss -i assets/css/default.input.css -o assets/css/default.css"))
  ($ '("haunt build")))

;; Task para fazer o deploy em ambiente de QA (branch 'pages' do
;; Codeberg)
;; (define (qa-publish)
;;   "Gera o site estático com o Haunt e atualiza a branch 'pages'"
;;   ($ '("SITE_ENVIRONMENT=qa bash ./bin/publish-pages.bash")))

;; (use-modules (ice-9 ftw)
;;              (ice-9 popen)
;;              (ice-9 rdelim)
;;              (srfi srfi-1))

(define (get-git-commit-hash)
  (let* ((port (open-input-pipe "git rev-parse --short HEAD"))
         (output (read-line port)))
    (close-pipe port)
    (if (eof-object? output)
        "unknown"
        (string-trim-right output))))

(define (qa-publish)
  "Gera o site estático com o Haunt e atualiza a branch 'pages'"
  (setenv "SITE_ENVIRONMENT" "qa")
  
  (let* ((commit-hash (get-git-commit-hash))
         (tmp-dir ".tmp-pages-worktree")
         (haunt-build-dir "public_html"))

    ;; Limpeza preventiva de worktrees antigas
    (system* "git" "worktree" "prune")
    (system* "rm" "-rf" tmp-dir)

    ;; 1. Criar worktree temporária para a branch 'pages'
    (format #t "--> Criando worktree temporária para a branch 'pages'...\n")
    (unless (zero? (system* "git" "worktree" "add" tmp-dir "pages"))
      (error "Falha ao criar worktree para a branch 'pages'."))

    ;; 2. Compilar o site com o Haunt
    (format #t "--> Compilando site estático com o Haunt...\n")
    (unless (zero? (system* "haunt" "build"))
      (system* "git" "worktree" "remove" "--force" tmp-dir)
      (error "Falha no build do Haunt."))

    ;; 3. Copiar os arquivos PRESERVANDO o arquivo .git da worktree
    (format #t "--> Atualizando arquivos da branch 'pages'...\n")
    (unless (zero? (system* "rsync" "-a" "--delete" "--exclude=.git"
                            (string-append haunt-build-dir "/") 
                            (string-append tmp-dir "/")))
      (system* "git" "worktree" "remove" "--force" tmp-dir)
      (error "Falha ao copiar arquivos para a worktree."))

    ;; 4. Commitar as alterações na branch 'pages'
    (format #t "--> Commitando alterações na branch 'pages'...\n")
    (system* "git" "-C" tmp-dir "add" "-A")
    
    ;; Verifica se há algo novo para commitar antes de dar o commit
    (if (zero? (system* "git" "-C" tmp-dir "diff" "--staged" "--quiet"))
        (format #t "Nenhuma alteração detectada no build.\n")
        (system* "git" "-C" tmp-dir "commit" "-m"
                 (string-append "QA: Atualiza página estática (referente ao commit " commit-hash ")")))

    ;; 5. Remover worktree temporária
    (format #t "--> Limpando diretório temporário...\n")
    (system* "git" "worktree" "remove" "--force" tmp-dir)

    (format #t "\n✔ Sucesso! A branch 'pages' foi atualizada com os arquivos do commit ~a.\n" commit-hash)))
;; (define (qa-publish)
;;   "Gera o site estático com o Haunt e atualiza a branch 'pages'"
;;   (begin
;;     (setenv "SITE_ENVIRONMENT" "qa")
;;     (define commit-hash (get-git-commit-hash))
;;     (define tmp-dir ".tmp-pages-worktree")
;;     ;; Defina aqui a pasta onde o Haunt gera os arquivos por padrão (ex: "site" ou "public")
;;     (define haunt-build-dir "public_html") 

;;     ;; Limpeza preventiva
;;     (system* "git" "worktree" "prune")
;;     (system* "rm" "-rf" tmp-dir)

;;     ;; 1. Criar worktree temporária para a branch 'pages'
;;     (format #t "--> Criando worktree temporária para a branch 'pages'...\n")
;;     (unless (zero? (system* "git" "worktree" "add" tmp-dir "pages"))
;;       (error "Falha ao criar worktree para a branch 'pages'."))

;;     ;; 2. Compilar o site normalmente com o Haunt
;;     (format #t "--> Compilando site estático com o Haunt...\n")
;;     (unless (zero? (system* "haunt" "build"))
;;       (system* "git" "worktree" "remove" "--force" tmp-dir)
;;       (error "Falha no build do Haunt."))

;;     ;; 3. Copiar os arquivos gerados para dentro da worktree
;;     (format #t "--> Atualizando arquivos da branch 'pages'...\n")
;;     ;; Usando rsync para copiar e remover arquivos antigos que não existem mais no novo build
;;     (unless (zero? (system* "rsync" "-a" "--delete" 
;;                             (string-append haunt-build-dir "/") 
;;                             (string-append tmp-dir "/")))
;;       (system* "git" "worktree" "remove" "--force" tmp-dir)
;;       (error "Falha ao copiar arquivos para a worktree."))

;;     ;; 4. Commitar as alterações na branch 'pages'
;;     (format #t "--> Commitando alterações na branch 'pages'...\n")
;;     (system* "git" "-C" tmp-dir "add" "-A")
;;     (system* "git" "-C" tmp-dir "commit" "-m"
;;              (string-append "QA: Atualiza página estática (referente ao commit " commit-hash ")"))

;;     ;; 5. Remover worktree temporária
;;     (format #t "--> Limpando diretório temporário...\n")
;;     (system* "git" "worktree" "remove" "--force" tmp-dir)

;;     (format #t "\n✔ Sucesso! A branch 'pages' foi atualizada com os arquivos do commit ~a.\n" commit-hash)))

(define (www-live)
  "Constrói a página com o Haunt"
  ($ '("haunt serve --watch")))

;; (define (www-haunt-build)
;;   "Publica a página pessoal com Haunt"
;;   ($ '("tailwindcss -i ./3.resources/haunt/assets/static/css/lightray.input.css -o ./3.resources/haunt/assets/static/css/lightray.css"))
;;   ($ '("GUILE_LOAD_PATH=./3.resources haunt build")
;;      #:verbose? #t))

;; (define (www-sync-repo)
;;   "Publica a página pessoal no repo do Codeberg"
;;   ;; Deleta os arquivos atuais do repo (são versionados!)
;;   ($ '("rm -rvf /home/vct/2.areas/padawanphysicist.codeberg.page/*") #:verbose? #t)
  
;;   ;; Copia os arquivos atualizados
;;   ($ '("cp -rv ./public/* /home/vct/2.areas/padawanphysicist.codeberg.page/") #:verbose? #t))


;; ;; https://tomarkdown.dev/tools/markdown-to-context
;; (define (resume-build)
;;   "Constrói os currículos personalizados com o Pandoc"
;;   ($ '("for mdfile in $(ls ./3.resources/templates/curriculo/*.md) ; do pandoc ${mdfile} --pdf-engine=context -o 4.archive/dist/${mdfile%.md}.pdf --template=3.resources/templates/tex/prd_resume_pandoc.tex --top-level-division=section ; done")))

