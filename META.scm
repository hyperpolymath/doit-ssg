;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — doit-ssg

(define-module (doit-ssg meta)
  #:export (architecture-decisions development-practices design-rationale component-status))

;; ============================================================================
;; ARCHITECTURE DECISION RECORDS
;; ============================================================================

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite SSG in the hyperpolymath ecosystem integrating with poly-ssg-mcp hub")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))

    (adr-002
     (title . "Hub-Satellite Architecture")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need unified interface for 28 SSGs without code duplication")
     (decision . "Use poly-ssg-mcp as hub, this project as satellite implementation")
     (consequences . ("Adapter synchronization" "Deno runtime" "MCP protocol compliance")))

    (adr-003
     (title . "Just + Mustfile Task System")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Need standardized task automation with mandatory quality gates")
     (decision . "Use justfile for tasks, Mustfile for mandatory gates")
     (consequences . ("Consistent developer experience" "Enforced quality standards" "CI/CD integration")))

    (adr-004
     (title . "Neurosymbolic Configuration")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "AI agents need structured guidance for project interaction")
     (decision . "Implement AGENTIC.scm and NEUROSYM.scm for AI behavior configuration")
     (consequences . ("Safer AI operations" "Consistent agent behavior" "Knowledge-guided reasoning")))))

;; ============================================================================
;; DEVELOPMENT PRACTICES
;; ============================================================================

(define development-practices
  '((code-style
     (languages . ("javascript" "typescript"))
     (formatter . "deno fmt")
     (linter . "deno lint"))

    (security
     (sast . "CodeQL")
     (credentials . "env vars only")
     (input-validation . "required")
     (sha-pinned-actions . #t))

    (testing
     (coverage-minimum . 70)
     (framework . "deno test")
     (e2e . "adapter integration tests"))

    (versioning
     (scheme . "SemVer 2.0.0")
     (changelog . "required"))

    (documentation
     (format . "asciidoc")
     (api-docs . "jsdoc")
     (cookbook . "cookbook.adoc"))))

;; ============================================================================
;; DESIGN RATIONALE
;; ============================================================================

(define design-rationale
  '((why-rsr
     "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")

    (why-deno
     "Deno provides secure-by-default runtime with built-in TypeScript support and no node_modules.")

    (why-hub-satellite
     "Centralizes adapter maintenance while enabling project-specific customization.")

    (why-justfile
     "Just provides cross-platform task automation with better ergonomics than Make.")

    (why-neurosym
     "Hybrid neural-symbolic approach provides both flexibility and safety guarantees.")

    (why-scm-files
     "Scheme provides homoiconic representation for project metadata, enabling programmatic access.")))

;; ============================================================================
;; COMPONENT STATUS (44/44 Target)
;; ============================================================================

(define component-status
  '((summary
     (total-components . 44)
     (completed . 22)
     (in-progress . 8)
     (pending . 14)
     (completion-percentage . 50))

    (categories
     ((build-system . ((total . 4) (complete . 4) (items . ("justfile" "Mustfile" "cookbook" "CI"))))
      (adapters . ((total . 3) (complete . 3) (items . ("28 SSG adapters" "interface" "sync"))))
      (scm-files . ((total . 6) (complete . 6) (items . ("META" "ECOSYSTEM" "STATE" "PLAYBOOK" "AGENTIC" "NEUROSYM"))))
      (documentation . ((total . 8) (complete . 5) (items . ("README" "CONTRIBUTING" "SECURITY" "CODE_OF_CONDUCT" "cookbook"))))
      (configuration . ((total . 3) (complete . 2) (items . ("justfile" "Mustfile" ".gitignore"))))
      (testing . ((total . 4) (complete . 1) (items . ("syntax-check" "adapter-verify" "unit-tests" "e2e"))))
      (security . ((total . 4) (complete . 3) (items . ("CodeQL" "secret-detection" "SHA-pinned" "audit"))))
      (tooling . ((total . 6) (complete . 1) (items . ("linter" "formatter" "LSP" "compile" "hooks" "CI"))))
      (examples . ((total . 3) (complete . 0) (items . ("config" "templates" "content"))))
      (nix . ((total . 3) (complete . 0) (items . ("flake" "devShell" "packages"))))))))
