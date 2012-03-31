;;; This file is part of LISA, the Lisp-based Intelligent Software
;;; Agents platform.

;;; Copyright (C) 2000 David E. Young (de.young@computer.org)

;;; This library is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU Lesser General Public License
;;; as published by the Free Software Foundation; either version 2.1
;;; of the License, or (at your option) any later version.

;;; This library is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.

;;; You should have received a copy of the GNU Lesser General Public License
;;; along with this library; if not, write to the Free Software
;;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

;;; File: pkgdecl.lisp
;;; Description: Package declarations for LISA.

;;; $Id: pkgdecl.lisp,v 1.81 2007/09/08 14:48:59 youngde Exp $

(in-package :cl-user)

;;; accommodate implementations whose CLOS is really PCL, like CMUCL...

(eval-when (:compile-toplevel :load-toplevel :execute)
  (when (and (not (find-package 'clos))
             (find-package 'pcl))
    (rename-package (find-package 'pcl) 'pcl
                    `(clos ,@(package-nicknames 'pcl)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defpackage :lisa
    (:use :common-lisp)
    (:export
      :assert
      :default
      .
      #1=(
          :*show-lisa-warnings*
          :=>
          :activation
          :active-rule
          :agenda
          :allow-duplicate-facts
          :assert-instance
          :auto-focus-p
          :bindings
          :breakpoints
          :clear
          :clear-break
          :clear-breaks
          :consider-taxonomy
          :context
          :context-name
          :contexts
          :current-engine
          :defcontext
          :deffacts
          :defimport
          :defrule
          :deftemplate
          :dependencies
          :duplicate-fact
          :engine
          :exists
          :fact
          :fact-id
          :fact-name
          :facts
          :find-context
          :find-fact-by-id
          :find-fact-by-name
          :find-rule
          :focus
          :focus-stack
          :halt
          :in-rule-firing-p
          :inference-engine
          :initial-fact
          :instance
          :logical
          :make-inference-engine
          :mark-instance-as-changed
          :modify
          :next
          :refocus
          :reset
          :resume
          :rete
          :rete-network
          :retract
          :retract-instance
          :retrieve
          :rule
          :rule-comment
          :rule-context
          :rule-default-name
          :rule-name
          :rule-salience
          :rule-short-name
          :rules
          :run
          :set-break
          :show-network
          :slot
          :slot-value-of-instance
          :standard-kb-class
          :test
          :token
          :tokens
          :undefcontext
          :undefrule
          :unwatch
          :use-default-engine
          :use-fancy-assert
          :use-lisa
          :walk
          :watch
          :watching
          :with-inference-engine
          :with-simple-query))
    (:shadow :assert))

  (defpackage :lisa-user
    (:use :common-lisp)
    (:shadowing-import-from :lisa :assert :default)
    (:import-from :lisa . #1#)))

(defpackage :lisa.reflect
  (:use :common-lisp)
  (:nicknames :reflect)
  #+(or Allegro LispWorks)
  (:import-from :clos
                :ensure-class
                :class-direct-superclasses
                :class-finalized-p
                :finalize-inheritance)

  #+CMU
  (:import-from :clos
                :class-finalized-p
                :finalize-inheritance)
  #+:sbcl
  (:import-from :sb-mop
                :class-finalized-p
                :finalize-inheritance)
  (:export
   :class-all-superclasses
   :class-finalized-p
   :class-slot-list
   :ensure-class
   :finalize-inheritance
   :find-direct-superclasses))

(defpackage :lisa.belief
  (:use :common-lisp)
  (:nicknames :belief)
  (:export
   :adjust-belief
   :belief->english
   :belief-factor
   :false-p
   :true-p
   :unknown-p))

(defpackage :lisa.heap
  (:use :common-lisp)
  (:nicknames :heap)
  (:export
   :create-heap
   :heap-clear
   :heap-count
   :heap-collect
   :heap-empty-p
   :heap-find
   :heap-insert
   :heap-peek
   :heap-remove))
   
(defpackage :lisa.utils
  (:use :common-lisp)
  (:nicknames :utils)
  (:export
   :collect
   :compose
   :compose-all
   :compose-f
   :find-after
   :find-before
   :find-if-after
   :flatten
   :lsthash
   :map-in
   :string-tokens))
