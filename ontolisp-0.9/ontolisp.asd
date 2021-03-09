;;; -*- Mode: LISP; Syntax: Common-Lisp; Package: asdf -*-

(in-package :asdf)
   
;;;
;;;;  ontolisp.asd
;;;
;;;
;;; --------------------------------------------------------------------------------------
;;;
;;;   The Original Software is 
;;;   OntoLisp (NOSA): A Semantic Web Framework for OWL 2 and OWLlink in Common Lisp
;;;
;;;   Copyright (c) 2007-2010 Michael Wessel and Racer Systems GmbH & Co. KG 
;;;   All Rights Reserved.
;;;
;;;   Contributor(s): Michael Wessel  (mailto:michael_wessel@gmx.de
;;;                                    mailto:wessel@racer-systems.com) 
;;;
;;;   This program is licensed under the terms of the GNU Lesser General Public License
;;;   as published by the Free Software Foundation, version 2.1 of the License. Note
;;;   however that a preamble attached below also applies to this program.
;;;
;;;
;;; --------------------------------------------------------------------------------------
;;;
;;;   Preamble to the Gnu Lesser General Public License
;;;
;;;   Copyright (c) 2000 Franz Incorporated, Berkeley, CA 94704
;;;
;;;   The concept of the GNU Lesser General Public License version 2.1 ("LGPL") has been
;;;   adopted to govern the use and distribution of above-mentioned application. However,
;;;   the LGPL uses terminology that is more appropriate for a program written in C than
;;;   one written in Lisp. Nevertheless, the LGPL can still be applied to a Lisp program
;;;   if certain clarifications are made. This document details those clarifications.
;;;   Accordingly, the license for the open-source Lisp applications consists of this
;;;   document plus the LGPL. Wherever there is a conflict between this document and the
;;;   LGPL, this document takes precedence over the LGPL.
;;;
;;;   A "Library" in Lisp is a collection of Lisp functions, data and foreign modules.
;;;   The form of the Library can be Lisp source code (for processing by an interpreter)
;;;   or object code (usually the result of compilation of source code or built with some
;;;   other mechanisms). Foreign modules are object code in a form that can be linked
;;;   into a Lisp executable. When we speak of functions we do so in the most general way
;;;   to include, in addition, methods and unnamed functions. Lisp "data" is also a
;;;   general term that includes the data structures resulting from defining Lisp classes.
;;;   A Lisp application may include the same set of Lisp objects as does a Library, but
;;;   this does not mean that the application is necessarily a "work based on the Library"
;;;   it contains.
;;;
;;;   The Library consists of everything in the distribution file set before any
;;;   modifications are made to the files. If any of the functions or classes in the
;;;   Library are redefined in other files, then those redefinitions ARE considered a
;;;   work based on the Library. If additional methods are added to generic functions in
;;;   the Library, those additional methods are NOT considered a work based on the
;;;   Library. If Library classes are subclassed, these subclasses are NOT considered a
;;;   work based on the Library. If the Library is modified to explicitly call other
;;;   functions that are neither part of Lisp itself nor an available add-on module to
;;;   Lisp, then the functions called by the modified Library ARE considered a work based
;;;   on the Library. The goal is to ensure that the Library will compile and run without
;;;   getting undefined function errors.
;;;
;;;   It is permitted to add proprietary source code to the Library, but it must be done
;;;   in a way such that the Library will still run without that proprietary code present.
;;;   Section 5 of the LGPL distinguishes between the case of a library being dynamically
;;;   linked at runtime and one being statically linked at build time. Section 5 of the
;;;   LGPL states that the former results in an executable that is a "work that uses the
;;;   Library." Section 5 of the LGPL states that the latter results in one that is a
;;;   "derivative of the Library", which is therefore covered by the LGPL. Since Lisp only
;;;   offers one choice, which is to link the Library into an executable at build time, we
;;;   declare that, for the purpose applying the LGPL to the Library, an executable that
;;;   results from linking a "work that uses the Library" with the Library is considered a
;;;   "work that uses the Library" and is therefore NOT covered by the LGPL.
;;;
;;;   Because of this declaration, section 6 of LGPL is not applicable to the Library.
;;;   However, in connection with each distribution of this executable, you must also
;;;   deliver, in accordance with the terms and conditions of the LGPL, the source code
;;;   of Library (or your derivative thereof) that is incorporated into this executable. 
;;;
;;; --------------------------------------------------------------------------------------
;;;
;;;
;;;   Purpose: Provides the ASDF system definition of OntoLisp (NOSA) 
;;;

(defsystem :ontolisp
    :name "OntoLisp (NOSA)"
    :author "Michael Wessel"
    :version "0.9"
    :maintainer "Michael Wessel <michael_wessel@gmx.de>"
    :licence "Lisp Lesser GNU Public License (LLGPL)"
    :description "A Semantic Web Framework for OWL 2 and OWLlink in Common Lisp" 
    :long-description "Offers parsers and renderers for OWL 2 as well as an OWLlink implementation.
                       Contains an ontology management framework inspired by the Java OWLAPI (v2.2). 
                       Tested with: LispWorks 5.2, ACL 8.2, SBCL 1.0.40" 
    :depends-on (:s-http-client :wilbur )
    :pathname "ontolisp:"
    :components
    ((:module
      owlapi
      :serial t
      :pathname ""
      :components ((:file "owlapi-package")
		   (:file "owlapi-tools")
		   (:file "owlapi")
		   (:file "owlapi-synonyms")))
     #+:ignore
     (:module
      reasoner-bridge-for-owlapi
      :serial t
      :pathname ""
      :components ((:file "owlapi-reasoner-bridge"))
      :depends-on (:owlapi))
     (:module
      owl-syntaxes
      :serial t
      :pathname ""
      :components ((:file "owl-syntaxes-package")
		   (:file "http-stream")
		   (:file "owl-import")
		   (:file "owl-functional")
		   (:file "functional-renderer")
		   (:file "owllink-parsers")
		   (:file "owllink-functional")
		   (:file "xml-renderer")
		   (:file "owl-renderer")
		   (:file "owllink-xml")
		   (:file "import-export")
		   (:file "owllink-converter")
		   (:file "owlapi-test"))
      :depends-on (:owlapi))
     #+:ignore
     (:module
      reasoner-bridge-for-owllink
      :serial t
      :pathname ""
      :components ((:file "owllink-reasoner-bridge"))
      :depends-on (:owl-syntaxes))

     (:file "dummy-functions"
	    :depends-on (:owlapi :owl-syntaxes))

     (:module
      tests
      :serial t
      :pathname ""
      :components ((:file "owlapi-test")
		   (:file "owl-syntaxes-test"))
      :depends-on (:owl-syntaxes "dummy-functions"))))
   