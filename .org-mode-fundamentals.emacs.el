;; -*- lexical-binding: t -*-

;; [[file:Org-Mode_Fundamentals.org::78D777D3-FA69-4361-874C-7262DE96F753][78D777D3-FA69-4361-874C-7262DE96F753]]
(load-file "~/src/help/.org-mode-ecm.emacs.el")
;; 78D777D3-FA69-4361-874C-7262DE96F753 ends here

;; [[file:Org-Mode_Fundamentals.org::BB2E97AF-6364-401F-8063-8B5A0BE481E6][BB2E97AF-6364-401F-8063-8B5A0BE481E6]]
(defun help/set-org-babel-default-header-args (property value)
  "Easily set system header arguments in org mode.

PROPERTY is the system-wide value that you would like to modify.

VALUE is the new value you wish to store.

Attribution: URL `http://orgmode.org/manual/System_002dwide-header-arguments.html#System_002dwide-header-arguments'"
  (setq org-babel-default-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args))))

(defun help/set-org-babel-default-inline-header-args (property value)
  "See `help/set-org-babel-default-header-args'; same but for inline header args."
  (setq org-babel-default-inline-header-args
        (cons (cons property value)
              (assq-delete-all property org-babel-default-inline-header-args))))

(defun help/set-org-babel-default-header-args:R (property value)
  "See `help/set-org-babel-default-header-args'; same but for R.

This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:R
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:R))))

(defun help/set-org-babel-default-header-args:ditaa (property value)
  "See `help/set-org-babel-default-header-args'; same but for ditaa.

This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:ditaa
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:ditaa))))

(defun help/set-org-babel-default-header-args:dot (property value)
  "See `help/set-org-babel-default-header-args'; same but for dot.

This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:dot
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:dot))))

(defun help/set-org-babel-default-header-args:plantuml (property value)
  "See `help/set-org-babel-default-header-args'; same but for plantuml.

This is a copy and paste. Additional languages would warrant a refactor."
  (setq org-babel-default-header-args:plantuml
        (cons (cons property value)
              (assq-delete-all property org-babel-default-header-args:plantuml))))

(defun help/org-toggle-macro-markers ()
  (interactive)
  (setq org-hide-macro-markers (not org-hide-macro-markers)))

(defun help/org-prp-hdln ()
  "Visit every Headline. If it doesn't have an ID property then add one and
  assign it a UUID. Attribution: URL `http://article.gmane.org/gmane.emacs.orgmode/99738'"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (dolist (p (nreverse
                (org-element-map (org-element-parse-buffer 'headline) 'headline
                  (lambda (headline) (org-element-property :begin headline)))))
      (goto-char p)
      (org-id-get-create))
    (save-buffer)))

(defun help/org-prp-src-blk ()
  "If it doesn't have a NAME property then add one and
   assign it a UUID. Attribution: URL `http://article.gmane.org/gmane.emacs.orgmode/99740'"
  (interactive)
  (help/org-2every-src-block
   #'(lambda (element)
       (if (not (org-element-property :name element))
           (let ((i (org-get-indentation)))
             (beginning-of-line)
             (save-excursion (insert "#+NAME: " (org-id-new) "\n"))
             (indent-to i)
             (forward-line 2))))))

(defconst help/org-special-pre "^\s*#[+]")

(defun help/org-2every-src-block (fn)
  "Visit every Source-Block and evaluate `FN'."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (while (re-search-forward (concat help/org-special-pre "BEGIN_SRC") nil t)
        (let ((element (org-element-at-point)))
          (when (eq (org-element-type element) 'src-block)
            (funcall fn element)))))
    (save-buffer)))

(defun help/org-babel-demarcate-block ()
  "Add a NAME property then assign it a UUID."
  (interactive)
  (org-babel-demarcate-block)
  (insert "#+NAME: " (org-id-new))
  (beginning-of-line)
  (insert "\n"))
;; BB2E97AF-6364-401F-8063-8B5A0BE481E6 ends here

;; [[file:Org-Mode_Fundamentals.org::orgmode:gcr:vela:659CE55F-3CEA-4940-9D5E-5C66258BFE8F][orgmode:gcr:vela:659CE55F-3CEA-4940-9D5E-5C66258BFE8F]]
(require 'org-id)
;; orgmode:gcr:vela:659CE55F-3CEA-4940-9D5E-5C66258BFE8F ends here

;; [[file:Org-Mode_Fundamentals.org::751D537A-EE89-4B1D-91E5-99D3A4F8B52E][751D537A-EE89-4B1D-91E5-99D3A4F8B52E]]
(setq org-id-link-to-org-use-id 'nil)
;; 751D537A-EE89-4B1D-91E5-99D3A4F8B52E ends here

;; [[file:Org-Mode_Fundamentals.org::885C8386-AC68-4DB7-8D04-537E28ED950B][885C8386-AC68-4DB7-8D04-537E28ED950B]]
(setq org-id-prefix (concat "orgmode:" (user-real-login-name) ":" (system-name)))
(setq org-id-method 'uuid)
;; 885C8386-AC68-4DB7-8D04-537E28ED950B ends here

;; [[file:Org-Mode_Fundamentals.org::859E61A4-D910-4731-8328-A63F6B6ACD3F][859E61A4-D910-4731-8328-A63F6B6ACD3F]]
(add-hook 'org-babel-pre-tangle-hook #'help/org-prp-hdln)
(add-hook 'org-babel-pre-tangle-hook #'help/org-prp-src-blk)
;; 859E61A4-D910-4731-8328-A63F6B6ACD3F ends here

;; [[file:Org-Mode_Fundamentals.org::F19C629B-E784-48CA-BC53-CCFB849CE9EC][F19C629B-E784-48CA-BC53-CCFB849CE9EC]]
(setq org-babel-use-quick-and-dirty-noweb-expansion nil)
;; F19C629B-E784-48CA-BC53-CCFB849CE9EC ends here

;; [[file:Org-Mode_Fundamentals.org::AD42B561-29FA-4652-AD28-692CAD631E62][AD42B561-29FA-4652-AD28-692CAD631E62]]
(help/set-org-babel-default-header-args :comments "noweb")
;; AD42B561-29FA-4652-AD28-692CAD631E62 ends here

;; [[file:Org-Mode_Fundamentals.org::F501D202-9F0B-4343-B257-E0DEB4483A0B][F501D202-9F0B-4343-B257-E0DEB4483A0B]]
(help/set-org-babel-default-header-args :mkdirp "yes")
;; F501D202-9F0B-4343-B257-E0DEB4483A0B ends here

;; [[file:Org-Mode_Fundamentals.org::20BE9B4B-ED66-4935-A351-99D17B3A32D4][20BE9B4B-ED66-4935-A351-99D17B3A32D4]]
(help/set-org-babel-default-header-args :noweb "no-export")
;; 20BE9B4B-ED66-4935-A351-99D17B3A32D4 ends here

;; [[file:Org-Mode_Fundamentals.org::0F3E7114-A63C-44F4-A9FD-577BAEE536ED][0F3E7114-A63C-44F4-A9FD-577BAEE536ED]]
(help/set-org-babel-default-header-args :padline "yes")
;; 0F3E7114-A63C-44F4-A9FD-577BAEE536ED ends here

;; [[file:Org-Mode_Fundamentals.org::5E69E152-9921-4527-A2B2-24467EEF1BE9][5E69E152-9921-4527-A2B2-24467EEF1BE9]]
(help/set-org-babel-default-header-args :tangle "no")
;; 5E69E152-9921-4527-A2B2-24467EEF1BE9 ends here

;; [[file:Org-Mode_Fundamentals.org::6309AF39-FCE4-43DE-BD46-BC7D0BA0971D][6309AF39-FCE4-43DE-BD46-BC7D0BA0971D]]
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (org . t)
   ;;
   (C . t)
   (R . t)
   (python . t)
   (sass . t)
   (scheme . t)
   (sql . t)
   ;;
   (latex . t)
   ;;
   (makefile . t)
   (shell . t)
   ;;
   (ditaa . t)
   (dot . t)
   (plantuml . t)))
;; 6309AF39-FCE4-43DE-BD46-BC7D0BA0971D ends here

;; [[file:Org-Mode_Fundamentals.org::58541CA5-C633-4146-8E5D-15C7A3A2D1D7][58541CA5-C633-4146-8E5D-15C7A3A2D1D7]]
(help/set-org-babel-default-header-args :eval "never-export")
(help/set-org-babel-default-inline-header-args :eval "never-export")
;; 58541CA5-C633-4146-8E5D-15C7A3A2D1D7 ends here

;; [[file:Org-Mode_Fundamentals.org::D9F32A22-B415-48EA-A189-D8EAF7C202D8][D9F32A22-B415-48EA-A189-D8EAF7C202D8]]
(setq org-export-babel-evaluate nil)
;; D9F32A22-B415-48EA-A189-D8EAF7C202D8 ends here

;; [[file:Org-Mode_Fundamentals.org::BC84119C-6085-4B36-A2D9-0918A68D15C5][BC84119C-6085-4B36-A2D9-0918A68D15C5]]
(defconst help/org-sb-results-cfg "value table drawer replace")
(help/set-org-babel-default-header-args :results help/org-sb-results-cfg)
;; BC84119C-6085-4B36-A2D9-0918A68D15C5 ends here

;; [[file:Org-Mode_Fundamentals.org::38A0B76B-EDEB-489C-9229-60E01438CCAD][38A0B76B-EDEB-489C-9229-60E01438CCAD]]
(defconst help/org-isb-results-cfg "replace")
(help/set-org-babel-default-inline-header-args :results help/org-isb-results-cfg)
;; 38A0B76B-EDEB-489C-9229-60E01438CCAD ends here

;; [[file:Org-Mode_Fundamentals.org::71BFB4A2-DABD-4621-A6E0-C3CAECD34BC4][71BFB4A2-DABD-4621-A6E0-C3CAECD34BC4]]
(setq org-export-with-properties t)
;; 71BFB4A2-DABD-4621-A6E0-C3CAECD34BC4 ends here

;; [[file:Org-Mode_Fundamentals.org::49FDDABE-7999-4F51-BD93-969187A220D7][49FDDABE-7999-4F51-BD93-969187A220D7]]
(setq org-export-in-background nil)
;; 49FDDABE-7999-4F51-BD93-969187A220D7 ends here

;; [[file:Org-Mode_Fundamentals.org::07E50259-E68C-465E-9387-9984220CEB69][07E50259-E68C-465E-9387-9984220CEB69]]
(setq org-export-coding-system 'utf-8)
;; 07E50259-E68C-465E-9387-9984220CEB69 ends here

;; [[file:Org-Mode_Fundamentals.org::18CD863D-F01D-44F8-9B4D-A9FC016EDC79][18CD863D-F01D-44F8-9B4D-A9FC016EDC79]]
(setq org-export-preserve-breaks nil)
;; 18CD863D-F01D-44F8-9B4D-A9FC016EDC79 ends here

;; [[file:Org-Mode_Fundamentals.org::F0703ECD-DB1D-47BF-BF1A-52336FE0C5D8][F0703ECD-DB1D-47BF-BF1A-52336FE0C5D8]]
(setq org-export-copy-to-kill-ring nil)
;; F0703ECD-DB1D-47BF-BF1A-52336FE0C5D8 ends here

;; [[file:Org-Mode_Fundamentals.org::5BCA100F-6AC1-454B-9F48-31B5A67CB587][5BCA100F-6AC1-454B-9F48-31B5A67CB587]]
(setq org-export-with-toc nil)
;; 5BCA100F-6AC1-454B-9F48-31B5A67CB587 ends here

;; [[file:Org-Mode_Fundamentals.org::5ACDD0B0-2B6F-4F71-BFDF-2D2D1D91B573][5ACDD0B0-2B6F-4F71-BFDF-2D2D1D91B573]]
(setq org-src-preserve-indentation t)
;; 5ACDD0B0-2B6F-4F71-BFDF-2D2D1D91B573 ends here

;; [[file:Org-Mode_Fundamentals.org::A2FF8367-4A6A-444C-BB2E-F5AA494E33B5][A2FF8367-4A6A-444C-BB2E-F5AA494E33B5]]
(setq org-export-allow-bind-keywords t)
;; A2FF8367-4A6A-444C-BB2E-F5AA494E33B5 ends here

;; [[file:Org-Mode_Fundamentals.org::E44782C1-A02D-4D4A-982C-9F0908773CF9][E44782C1-A02D-4D4A-982C-9F0908773CF9]]
(setq org-element-use-cache nil)
;; E44782C1-A02D-4D4A-982C-9F0908773CF9 ends here

;; [[file:Org-Mode_Fundamentals.org::72A5FF8F-6597-4523-A604-B499B439A103][72A5FF8F-6597-4523-A604-B499B439A103]]
(help/set-org-babel-default-header-args :exports "both")
;; 72A5FF8F-6597-4523-A604-B499B439A103 ends here

;; [[file:Org-Mode_Fundamentals.org::4EA406BB-7D8F-447A-BE18-48FE241A3930][4EA406BB-7D8F-447A-BE18-48FE241A3930]]
(help/set-org-babel-default-inline-header-args :exports "results")
;; 4EA406BB-7D8F-447A-BE18-48FE241A3930 ends here

;; [[file:Org-Mode_Fundamentals.org::7DA47704-25D2-4812-A838-7FE29E9F88FE][7DA47704-25D2-4812-A838-7FE29E9F88FE]]
(help/set-org-babel-default-header-args :wrap "EXAMPLE")
;; 7DA47704-25D2-4812-A838-7FE29E9F88FE ends here

;; [[file:Org-Mode_Fundamentals.org::0F18A334-A192-4DA5-A897-9D7F3E15C64B][0F18A334-A192-4DA5-A897-9D7F3E15C64B]]
(help/set-org-babel-default-header-args:ditaa :wrap "RESULTS")
(help/set-org-babel-default-header-args:dot :wrap "RESULTS")
(help/set-org-babel-default-header-args:plantuml :wrap "RESULTS")
;; 0F18A334-A192-4DA5-A897-9D7F3E15C64B ends here
