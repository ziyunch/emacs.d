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


;;; ob-smiles.el --- Org-mode Babel support for SMILES.
;; -*- coding: utf-8 -*-

;; Keywords: org babel SMILES
;; Version: 0.0.1
;; Package-Requires: ((smiles-mode "0.0.1") (org "8"))
;; Author: John Kitchin [jkitchin@andrew.cmu.edu]

;;; Commentary:

;; I copy code from:
;; http://kitchingroup.cheme.cmu.edu/blog/2016/03/26/A-molecule-link-for-org-mode

;;; Code:
;; Org-mode Babel
(defun org-babel-execute:smiles (body params)
  "Execute SMILES babel `BODY' with `PARAMS'."
  (shell-command-to-string
   (format "obabel -:\"%s\" -osvg 2> /dev/null" body)))

;; Org-mode link
(defun molecule-jump (name)
  "Jump to molecule `NAME' definition."
  (org-mark-ring-push)
  (org-open-link-from-string (format "[[%s]]" path)))

(defun molecule-export (path desc backend)
  "Export molecule to HTML format on `PATH' with `DESC' and `BACKEND'."
  (let ((name (save-window-excursion
                (molecule-jump path)
                (org-element-property :name (org-element-context)))))
    (cond
     ((eq 'html backend)
      (format "<a href=\"#%s\">%s</a>" name name)))))

(org-add-link-type
 "molecule"
 'molecule-jump
 'molecule-export)

;; org-mode element
(org-element-map (org-element-parse-buffer)
    'src-block
  (lambda (src)
    (when (string= "smiles" (org-element-property :language src))
      (org-element-property :name src))))

(provide 'ob-smiles)

;;; ob-smiles.el ends here


(provide 'init-local)
