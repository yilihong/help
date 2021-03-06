;; -*- lexical-binding: t -*-

;; [[file:Org2Blog.org::E32697AE-784E-458F-A042-D9B559908721][E32697AE-784E-458F-A042-D9B559908721]]
(load-file "~/src/help/.org-mode-fundamentals.emacs.el")
;; E32697AE-784E-458F-A042-D9B559908721 ends here

;; [[file:Org2Blog.org::804FD197-8B2A-49F5-A4CB-48F6036FBCEC][804FD197-8B2A-49F5-A4CB-48F6036FBCEC]]
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
;; 804FD197-8B2A-49F5-A4CB-48F6036FBCEC ends here

;; [[file:Org2Blog.org::FAB22F99-AB0C-4A75-AFEF-9E680A5EE95D][FAB22F99-AB0C-4A75-AFEF-9E680A5EE95D]]
(add-to-list 'load-path"~/src/use-package")
;; FAB22F99-AB0C-4A75-AFEF-9E680A5EE95D ends here

;; [[file:Org2Blog.org::54841CA9-6491-46E8-8F40-4DCF7182CCD7][54841CA9-6491-46E8-8F40-4DCF7182CCD7]]
(eval-when-compile
  (require 'use-package))
(use-package diminish)
;; 54841CA9-6491-46E8-8F40-4DCF7182CCD7 ends here

;; [[file:Org2Blog.org::E99598C8-D394-484B-A7FB-333FA2544CB0][E99598C8-D394-484B-A7FB-333FA2544CB0]]
(use-package xml-rpc
  :ensure t)
;; E99598C8-D394-484B-A7FB-333FA2544CB0 ends here

;; [[file:Org2Blog.org::79F63BAD-0CD7-4A97-8A7D-CBAA51BB48E1][79F63BAD-0CD7-4A97-8A7D-CBAA51BB48E1]]
(use-package metaweblog
  :ensure t)
;; 79F63BAD-0CD7-4A97-8A7D-CBAA51BB48E1 ends here

;; [[file:Org2Blog.org::DF522DDF-4A71-4D8B-B6F9-9BD6F11EB832][DF522DDF-4A71-4D8B-B6F9-9BD6F11EB832]]
(add-to-list 'load-path "~/src/org2blog")
(require 'org2blog-autoloads)
;; DF522DDF-4A71-4D8B-B6F9-9BD6F11EB832 ends here

;; [[file:Org2Blog.org::9C1EAE6B-9D05-43FB-AC35-7FBFE6CB4F7E][9C1EAE6B-9D05-43FB-AC35-7FBFE6CB4F7E]]
(setq org2blog/wp-track-posts nil)
;; 9C1EAE6B-9D05-43FB-AC35-7FBFE6CB4F7E ends here

;; [[file:Org2Blog.org::BCA2FE29-930C-4E66-A662-17FF451D1591][BCA2FE29-930C-4E66-A662-17FF451D1591]]
(setq org2blog/wp-blog-alist
      '(("wisdomandwonder"
         :url "https://www.wisdomandwonder.com/xmlrpc.php"
         :username "admin"
         :default-categories ("Article" "Link")
         :confirm t
         :show 'show)))
;; BCA2FE29-930C-4E66-A662-17FF451D1591 ends here
