;;; Org-ref Configuration
(setq reftex-default-bibliography '("~/Dropbox/Notes/references.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/Dropbox/Notes/notes.org"
      org-ref-default-bibliography '("~/Dropbox/Notes/references.bib")
      org-ref-pdf-directory "~/Dropbox/Notes/Journals/")
(require 'org-ref)

(provide 'init-local)
