;;; consulting.scm --- Layout da página de vendas (consultoria)

(define-module (src layouts consulting)
  #:use-module (haunt site)
  #:use-module (haunt html)
  #:use-module (haunt artifact)
  #:use-module (src layouts base))

(define (consulting-layout site posts)
  (base-layout
   (site-title site)
   (site-default-metadata site)
   ;; TODO: inserir aqui
   `(div (@ (class "bg-slate-900 text-slate-100 font-sans antialiased selection:bg-emerald-500 selection:text-slate-900"))

         ;; HEADER / HERO SECTION
         (header (@ (class "relative overflow-hidden border-b border-slate-800 py-20 px-6 sm:px-12 text-center bg-gradient-to-b from-slate-900 via-slate-900 to-slate-800/50"))
                 (div (@ (class "max-w-3xl mx-auto"))
                      (span (@ (class "inline-block bg-emerald-500/10 text-emerald-400 text-sm font-semibold px-4 py-1.5 rounded-full mb-6 border border-emerald-500/20"))
                            "Consultoria Alimentar Individual com Gaia Vivá")
                      
                      (h1 (@ (class "text-4xl sm:text-6xl font-extrabold tracking-tight text-white mb-6 leading-tight"))
                          "Faça as pazes com a comida de forma "
                          (span (@ (class "text-emerald-400")) "saudável, prática e saborosa."))
                      
                      (p (@ (class "text-lg sm:text-xl text-slate-300 mb-10 leading-relaxed"))
                         "Você sente que precisa se alimentar melhor, mas não sabe por onde começar? Um acompanhamento individual e sob medida para reorganizar a sua rotina sem neuras.")

                      (span (@ (class "inline-flex items-center justify-center px-8 py-4 rounded-xl bg-emerald-500 text-slate-950 font-bold text-lg hover:bg-emerald-400 transition-all shadow-lg shadow-emerald-500/20 active:scale-95"))
                            (i (@ (class "fab fa-whatsapp text-xl mr-3")))
                            (a (@ (href "https://wa.me/SEUNUMERO") 
                                  (target "_blank"))
                               "Fale comigo pelo WhatsApp"))))

         ;; SEÇÃO O PROBLEMA / REORGANIZAÇÃO
         (section (@ (class "py-16 px-6 max-w-4xl mx-auto"))
                  (div (@ (class "bg-slate-800/50 border border-slate-700/60 rounded-2xl p-8 sm:p-10 space-y-6 text-slate-300 leading-relaxed"))
                       (h2 (@ (class "text-2xl sm:text-3xl font-bold text-white mb-4"))
                           "Não é falta de informação. É falta de organização e planejamento!")
                       
                       (p "Você já tentou de tudo e não conseguiu fazer as pazes com a sua alimentação? Precisa de estratégias específicas e não tem um passo a passo para colocar em prática?")
                       
                       (p "Muita gente se sente perdida na tentativa de ter uma alimentação saudável. Isso é muito comum, pois, afinal, nunca fomos ensinados o que realmente significa comer bem.")
                       
                       (p "Por isso, eu estou aqui para te dar a mão e te guiar nesse reencontro. "
                          (strong (@ (class "text-emerald-400")) "Esse serviço não é dieta — é um guia, é reorganização.")
                          " Para você entender os fundamentos básicos, compreender o que acontece no seu corpo e na sua rotina e, a partir disso, construir uma forma de comer que caiba na sua vida real."))
                  
                  ;; FRASE DE IMPACTO
                  (div (@ (class "mt-12 text-center p-6 bg-emerald-500/5 border border-emerald-500/20 rounded-xl"))
                       (p (@ (class "text-xl font-medium text-emerald-300 italic"))
                          "\"Saudável, saboroso e prático — sempre os três juntos. Se faltar um, não funciona na vida real.\"")))

         ;; SEÇÃO COMO FUNCIONA
         (section (@ (class "py-16 px-6 max-w-5xl mx-auto"))
                  (h2 (@ (class "text-3xl font-bold text-white text-center mb-12"))
                      "Como funciona o acompanhamento")
                  
                  (div (@ (class "grid grid-cols-1 md:grid-cols-2 gap-6"))
                       
                       ;; Passo 1
                       (div (@ (class "bg-slate-800/40 border border-slate-700/50 p-6 rounded-xl hover:border-emerald-500/40 transition-colors"))
                            (div (@ (class "text-emerald-400 font-bold text-lg mb-2")) "01. Escuta e Mapeamento")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "A gente conversa para eu entender sua rotina, seus sintomas, sua relação com a comida, o que já tentou, o que funcionou e o que não funcionou. Aqui não tem julgamento — só escuta de verdade."))
                       
                       ;; Passo 2
                       (div (@ (class "bg-slate-800/40 border border-slate-700/50 p-6 rounded-xl hover:border-emerald-500/40 transition-colors"))
                            (div (@ (class "text-emerald-400 font-bold text-lg mb-2")) "02. O Porquê Por Trás do que Você Sente")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Te explico, de forma simples, o que está acontecendo — saúde intestinal, energia, hábitos, contexto — para você entender a lógica por trás de cada orientação."))
                       
                       ;; Passo 3
                       (div (@ (class "bg-slate-800/40 border border-slate-700/50 p-6 rounded-xl hover:border-emerald-500/40 transition-colors"))
                            (div (@ (class "text-emerald-400 font-bold text-lg mb-2")) "03. Plano de Organização Personalizado")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Construímos juntas um planejamento prático e personalizado para suas necessidades — sempre com ingredientes acessíveis e saudáveis."))
                       
                       ;; Passo 4
                       (div (@ (class "bg-slate-800/40 border border-slate-700/50 p-6 rounded-xl hover:border-emerald-500/40 transition-colors"))
                            (div (@ (class "text-emerald-400 font-bold text-lg mb-2")) "04. Acompanhamento e Ajustes")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Você não fica sozinha. A gente ajusta o que for preciso, no seu ritmo, até a alimentação virar uma parte natural (e super saborosa!) da sua rotina."))))

         ;; SEÇÃO PRA QUEM É
         (section (@ (class "py-16 px-6 bg-slate-800/30 border-y border-slate-800"))
                  (div (@ (class "max-w-4xl mx-auto"))
                       (h2 (@ (class "text-3xl font-bold text-white text-center mb-10"))
                           "Para quem é este acompanhamento")
                       
                       (ul (@ (class "space-y-4"))
                           (li (@ (class "flex items-start gap-4 bg-slate-900/60 p-4 rounded-lg border border-slate-800"))
                               (span (@ (class "text-emerald-400 font-bold text-xl")) "✓")
                               (span (@ (class "text-slate-200")) "Mulheres que já sentem que algo não está bem — na energia, no corpo ou na relação com a comida."))
                           
                           (li (@ (class "flex items-start gap-4 bg-slate-900/60 p-4 rounded-lg border border-slate-800"))
                               (span (@ (class "text-emerald-400 font-bold text-xl")) "✓")
                               (span (@ (class "text-slate-200")) "Quem já entende que saúde é prioridade e busca um caminho prático para colocar isso em prática."))
                           
                           (li (@ (class "flex items-start gap-4 bg-slate-900/60 p-4 rounded-lg border border-slate-800"))
                               (span (@ (class "text-emerald-400 font-bold text-xl")) "✓")
                               (span (@ (class "text-slate-200")) "Quem quer entender o porquê das próprias escolhas alimentares, não só seguir uma lista pronta."))
                           
                           (li (@ (class "flex items-start gap-4 bg-slate-900/60 p-4 rounded-lg border border-slate-800"))
                               (span (@ (class "text-emerald-400 font-bold text-xl")) "✓")
                               (span (@ (class "text-slate-200")) "Quem valoriza o sabor tanto quanto a saúde — aqui, uma coisa não existe sem a outra!")))))

         ;; DEPOIMENTOS
         (section (@ (class "py-16 px-6 max-w-4xl mx-auto text-center"))
                  (h2 (@ (class "text-3xl font-bold text-white mb-8")) "Depoimentos")
                  (div (@ (class "bg-slate-800/20 border border-dashed border-slate-700 p-12 rounded-2xl text-slate-400"))
                       (p "[Espaço reservado para os depoimentos dos seus clientes]")))

         ;; SEÇÃO INVESTIMENTO
         (section (@ (class "py-16 px-6 max-w-5xl mx-auto"))
                  (h2 (@ (class "text-3xl font-bold text-white text-center mb-4")) "Opções de Investimento")
                  (p (@ (class "text-slate-400 text-center mb-12 max-w-xl mx-auto"))
                     "Escolha o formato que melhor atende ao momento atual da sua rotina.")
                  
                  (div (@ (class "grid grid-cols-1 md:grid-cols-2 gap-8"))
                       
                       ;; Opção 1: Encontro Único
                       (div (@ (class "bg-slate-800/60 border border-slate-700 rounded-2xl p-8 flex flex-col justify-between"))
                            (div
                             (h3 (@ (class "text-2xl font-bold text-white mb-2")) "Encontro Único")
                             (p (@ (class "text-slate-400 text-sm mb-6")) "Para organizar e estruturar seu planejamento alimentar.")
                             (ul (@ (class "text-slate-300 text-sm space-y-3 mb-8"))
                                 (li "• 1 encontro focado na sua rotina")
                                 (li "• Entrega do relatório de organização e planejamento")
                                 (li "• Suporte disponível via WhatsApp para tirar dúvidas pontuais")))
                            
                            (div (@ (class "border-t border-slate-700 pt-6"))
                                 (div (@ (class "text-3xl font-extrabold text-white mb-1")) "R$ 200,00")
                                 (p (@ (class "text-xs text-slate-400 mb-6")) "no Pix ou 10x de R$ 23,55 no cartão")
                                 (a (@ (href "https://wa.me/SEUNUMERO?text=Quero%20o%20Encontro%20Unico") 
                                       (target "_blank")
                                       (class "block text-center py-3 px-6 rounded-lg bg-slate-700 hover:bg-slate-600 text-white font-semibold text-sm transition-colors"))
                                    "Escolher Encontro Único")))

                       ;; Opção 2: Ciclo de 30 dias
                       (div (@ (class "bg-slate-800/90 border-2 border-emerald-500/80 rounded-2xl p-8 flex flex-col justify-between relative shadow-xl shadow-emerald-500/10"))
                            (span (@ (class "absolute -top-3 right-6 bg-emerald-500 text-slate-950 font-bold text-xs uppercase px-3 py-1 rounded-full"))
                                  "Recomendado")
                            
                            (div
                             (h3 (@ (class "text-2xl font-bold text-white mb-2")) "Acompanhamento 30 Dias")
                             (p (@ (class "text-slate-400 text-sm mb-6")) "Transformação contínua com 3 encontros estruturados.")
                             (ul (@ (class "text-slate-300 text-sm space-y-3 mb-8"))
                                 (li "• " (strong "1º Encontro:") " Escuta e mapeamento (approx. 60 min)")
                                 (li "• " (strong "2º Encontro (1 sem. depois):") " Ajustes de demandas (45–60 min)")
                                 (li "• " (strong "3º Encontro (2 sem. depois):") " Acompanhamento e dúvidas (30 min)")
                                 (li "• " (strong "Suporte contínuo via WhatsApp") " durante os 30 dias")))
                            
                            (div (@ (class "border-t border-slate-700 pt-6"))
                                 (div (@ (class "text-3xl font-extrabold text-emerald-400 mb-1")) "R$ 500,00")
                                 (p (@ (class "text-xs text-slate-400 mb-6")) "no Pix ou 10x de R$ 58,86 no cartão")
                                 (a (@ (href "https://wa.me/SEUNUMERO?text=Quero%20o%20Acompanhamento%20de%2030%20dias") 
                                       (target "_blank")
                                       (class "block text-center py-3 px-6 rounded-lg bg-emerald-500 hover:bg-emerald-400 text-slate-950 font-bold text-sm transition-colors"))
                                    "Quero o Ciclo de 30 Dias"))))
                  
                  (p (@ (class "text-center text-xs text-slate-400 mt-8"))
                     "* Pra quem precisa de mais tempo de ajuste: podemos personalizar individualmente sua necessidade e valores."))

         ;; FAQ SECTION
         (section (@ (class "py-16 px-6 max-w-4xl mx-auto border-t border-slate-800"))
                  (h2 (@ (class "text-3xl font-bold text-white text-center mb-10")) "Perguntas Frequentes")
                  
                  (div (@ (class "space-y-6"))
                       
                       (div (@ (class "bg-slate-800/30 border border-slate-700/50 p-6 rounded-xl"))
                            (h3 (@ (class "font-bold text-white text-lg mb-2")) "Isso é consulta nutricional?")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Não. Este é um acompanhamento de organização e educação alimentar, baseado em 13 anos de prática e em conhecimento técnico atualizado."))
                       
                       (div (@ (class "bg-slate-800/30 border border-slate-700/50 p-6 rounded-xl"))
                            (h3 (@ (class "font-bold text-white text-lg mb-2")) "Precisa mudar tudo de uma vez?")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Não. O processo é totalmente gradual e respeita o seu ritmo."))
                       
                       (div (@ (class "bg-slate-800/30 border border-slate-700/50 p-6 rounded-xl"))
                            (h3 (@ (class "font-bold text-white text-lg mb-2")) "Preciso de utensílios ou ingredientes específicos?")
                            (p (@ (class "text-slate-300 text-sm leading-relaxed"))
                               "Não, tudo é adaptado para sua realidade. Minha função aqui é facilitar sua vida ao máximo!"))))

         ;; FOOTER / CALL TO ACTION FINAL
         (footer (@ (class "py-16 px-6 text-center border-t border-slate-800 bg-slate-950"))
                 (div (@ (class "max-w-2xl mx-auto space-y-6"))
                      (h2 (@ (class "text-3xl font-bold text-white")) "Vamos começar?")
                      (p (@ (class "text-slate-300 text-base leading-relaxed"))
                         "Se você já sente que precisa mudar sua relação com a comida e quer um caminho de verdade, não mais uma tentativa isolada: eu posso te ajudar a organizar isso.")
                      (div (@ (class "pt-4 inline-flex items-center justify-center px-8 py-4 rounded-xl bg-emerald-500 text-slate-950 font-bold text-lg hover:bg-emerald-400 transition-all shadow-lg shadow-emerald-500/20"))
                           (span (@)
                                 (i (@ (class "fab fa-whatsapp text-xl mr-3")))
                           (a (@ (href "https://wa.me/5585997491882") 
                                 (target "_blank")
                                 ;; (class "inline-flex items-center justify-center px-8 py-4 rounded-xl bg-emerald-500 text-slate-950 font-bold text-lg hover:bg-emerald-400 transition-all shadow-lg shadow-emerald-500/20")
                                 )
                              "Fale comigo pelo WhatsApp")
                                 )
)
                      (p (@ (class "text-xs text-slate-500 pt-8")) "© Gaia Vivá: Consultoria Alimentar Individual"))))))

(define-public (consulting-page site posts)
   (serialized-artifact
    "consultoria/index.html"
    (consulting-layout site posts)
    sxml->html))
