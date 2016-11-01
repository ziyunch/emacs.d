;;; Org-ref Configuration (Need to install at first)
;; basic configuration
(setq reftex-default-bibliography '("~/Dropbox/Org-mode/references.bib"))
;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Dropbox/Org-mode/research.org"
      org-ref-default-bibliography '("~/Dropbox/Org-mode/references.bib")
      org-ref-pdf-directory "~/Dropbox/Org-mode/Journals/")

;;; DELETE BELOW THIS POINT AFTER CITEPROC LIBRARY INSTALLED
;; variables that control bibtex key format for auto-generation by jkitchin
;; I want firstauthor-year-title-words
;; this usually makes a legitimate filename to store pdfs under.
(setq bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-year-title-separator "-"
      bibtex-autokey-titleword-separator "-"
      bibtex-autokey-titlewords 2
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length 5)
;;; DELETE BEYOND THIS POINT AFTER CITEPROC LIBRARY INSTALLED

;; latex export
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))


;; Download bibtex entries and PDFs from doi and crossref queries.
(require 'doi-utils)
;; Add drag-n-drop PDF to create bibtex entries
(require 'org-ref-pdf)
;; Add drag-n-drop urls to create bibtex entries
(require 'org-ref-url-utils)
;; pubmed links, add bibtex entries from PMID.
(require 'org-ref-pubmed)
;; WebOfKnowledge links and queries
(require 'org-ref-wos)
;; Scopus links and queries
(require 'org-ref-scopus)

(require 'org-ref)

(provide 'init-local)
