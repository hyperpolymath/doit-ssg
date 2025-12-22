;;; NEUROSYM.scm — doit-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Neurosymbolic reasoning configuration for doit-ssg
;; Defines hybrid neural-symbolic reasoning patterns and knowledge representation

(define-module (doit-ssg neurosym)
  #:export (knowledge-graph reasoning-patterns symbolic-rules neural-hints))

;; ============================================================================
;; KNOWLEDGE GRAPH
;; Structured knowledge representation for the project domain
;; ============================================================================

(define knowledge-graph
  '((entities
      ;; Core project entities
      ((doit-ssg
         (type . project)
         (role . satellite-ssg)
         (ecosystem . hyperpolymath)
         (version . "0.1.0"))

       (poly-ssg-mcp
         (type . project)
         (role . hub)
         (relationship . (provides-adapters-to doit-ssg)))

       (adapters
         (type . component)
         (count . 28)
         (runtime . deno)
         (sync-source . poly-ssg-mcp))

       (rsr
         (type . standard)
         (name . "Rhodium Standard Repositories")
         (compliance . gold))))

    (relationships
      ;; Entity relationships
      ((doit-ssg consumes-from poly-ssg-mcp)
       (doit-ssg implements rsr)
       (adapters belong-to doit-ssg)
       (adapters interface-with ssg-binaries)))

    (adapter-taxonomy
      ;; SSG adapters organized by language
      ((rust . (zola cobalt mdbook))
       (haskell . (hakyll ema))
       (elixir . (serum nimble-publisher tableau))
       (julia . (franklin documenter staticwebpages))
       (clojure . (cryogen perun babashka))
       (racket . (frog pollen))
       (scala . (laika scalatex))
       (kotlin . (orchid))
       (fsharp . (fornax))
       (ocaml . (yocaml))
       (nim . (nimrod))
       (crystal . (marmot))
       (swift . (publish))
       (d . (reggae))
       (tcl . (wub))
       (erlang . (zotonic))
       (common-lisp . (coleslaw))))))

;; ============================================================================
;; REASONING PATTERNS
;; Hybrid reasoning patterns combining neural and symbolic approaches
;; ============================================================================

(define reasoning-patterns
  '((adapter-selection
      ;; Pattern for selecting appropriate adapter based on context
      (input . (user-requirements project-type language-preference))
      (symbolic-rules
        ((if (eq? language-preference 'rust)
             (recommend '(zola cobalt mdbook)))
         (if (eq? project-type 'documentation)
             (recommend '(mdbook documenter hakyll)))
         (if (eq? project-type 'blog)
             (recommend '(zola cryogen serum)))))
      (neural-hints
        ("Consider project size and complexity"
         "Evaluate ecosystem maturity"
         "Check for existing familiarity")))

    (error-diagnosis
      ;; Pattern for diagnosing adapter errors
      (input . (error-message stack-trace adapter-name))
      (symbolic-rules
        ((if (contains? error-message "command not found")
             (diagnose 'missing-binary))
         (if (contains? error-message "permission denied")
             (diagnose 'permission-issue))
         (if (contains? error-message "ENOENT")
             (diagnose 'file-not-found))))
      (neural-hints
        ("Look for typos in configuration"
         "Check if binary is in PATH"
         "Verify file permissions"
         "Review recent changes")))

    (code-improvement
      ;; Pattern for suggesting code improvements
      (input . (code-snippet file-context))
      (symbolic-rules
        ((if (missing? 'error-handling)
             (suggest 'add-try-catch))
         (if (uses? 'var)
             (suggest 'prefer-const-let))
         (if (missing? 'input-validation)
             (suggest 'add-validation))))
      (neural-hints
        ("Consider edge cases"
         "Check for consistent error handling"
         "Verify type safety"
         "Look for potential security issues")))))

;; ============================================================================
;; SYMBOLIC RULES
;; Formal logical rules for project operations
;; ============================================================================

(define symbolic-rules
  '((adapter-interface
      ;; Rules defining valid adapter interface
      (rule adapter-valid
        (forall adapter
          (=> (is-adapter? adapter)
              (and (has-export? adapter 'name)
                   (has-export? adapter 'language)
                   (has-export? adapter 'description)
                   (has-export? adapter 'connect)
                   (has-export? adapter 'disconnect)
                   (has-export? adapter 'isConnected)
                   (has-export? adapter 'tools))))))

    (file-security
      ;; Rules for file security
      (rule no-secrets
        (forall file
          (=> (is-source? file)
              (not (contains-secret? file)))))

      (rule spdx-required
        (forall file
          (=> (is-source? file)
              (has-spdx-header? file)))))

    (commit-validity
      ;; Rules for valid commits
      (rule conventional-commit
        (forall commit
          (=> (is-commit? commit)
              (matches-pattern? commit "^(feat|fix|docs|style|refactor|test|chore|security)(\\(.+\\))?: .+")))))

    (test-coverage
      ;; Rules for test coverage
      (rule minimum-coverage
        (forall module
          (=> (is-source-module? module)
              (>= (coverage module) 70)))))))

;; ============================================================================
;; NEURAL HINTS
;; Guidance for neural reasoning components
;; ============================================================================

(define neural-hints
  '((code-understanding
      ;; Hints for understanding code patterns
      (("Adapter pattern" . "Each adapter wraps an external SSG binary")
       ("Tool interface" . "Tools expose SSG functionality via MCP protocol")
       ("Async pattern" . "All adapter operations are async/await")))

    (error-recovery
      ;; Hints for error recovery strategies
      (("Binary not found" . "Check if SSG is installed and in PATH")
       ("Timeout" . "Increase timeout or check if SSG is responsive")
       ("Parse error" . "Validate input matches expected schema")))

    (optimization
      ;; Hints for code optimization
      (("Reduce async overhead" . "Batch operations where possible")
       ("Cache results" . "Store expensive computations")
       ("Lazy loading" . "Load adapters on demand")))

    (security
      ;; Hints for security considerations
      (("Input validation" . "Always validate user-provided paths")
       ("Command injection" . "Never interpolate user input into commands")
       ("Secret handling" . "Use environment variables, never hardcode")))))

;; ============================================================================
;; INFERENCE ENGINE CONFIGURATION
;; Settings for the hybrid reasoning engine
;; ============================================================================

(define inference-config
  '((symbolic-engine
      (type . "first-order-logic")
      (mode . "forward-chaining")
      (confidence-threshold . 0.8))

    (neural-engine
      (type . "transformer-based")
      (fallback-to-symbolic . #t)
      (context-window . 4096))

    (hybrid-strategy
      (prefer . "symbolic-when-rules-match")
      (fallback . "neural-with-hints")
      (combine . "weighted-average"))

    (caching
      (enabled . #t)
      (ttl . 3600)
      (invalidate-on . ("file-change" "adapter-sync")))))

;; ============================================================================
;; DOMAIN-SPECIFIC LANGUAGE
;; DSL for expressing adapter-related concepts
;; ============================================================================

(define dsl-definitions
  '((adapter-dsl
      ;; DSL for defining adapter behavior
      (syntax
        ((define-adapter name language binary
           (tool tool-name description schema body))
         (on-connect body)
         (on-disconnect body)
         (run-command args options)))

      (example
        "(define-adapter zola 'rust 'zola
           (on-connect
             (run-command '(\"--version\") '()))
           (tool 'build \"Build the site\"
             '((path . string) (drafts . boolean))
             (run-command (list \"build\" path) options)))"))

    (query-dsl
      ;; DSL for querying adapter state
      (syntax
        ((is-connected? adapter)
         (list-tools adapter)
         (get-capability adapter tool)
         (find-adapter-by language)))

      (example
        "(and (is-connected? 'zola)
              (get-capability 'zola 'build))"))))
