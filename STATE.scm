;;; STATE.scm — doit-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (doit-ssg state)
  #:export (metadata current-position roadmap blockers session-history))

;; ============================================================================
;; PROJECT METADATA
;; ============================================================================

(define metadata
  '((version . "0.2.0")
    (updated . "2025-12-22")
    (project . "doit-ssg")
    (status . "active")))

;; ============================================================================
;; CURRENT POSITION
;; ============================================================================

(define current-position
  '((phase . "v0.2 - Build System & Automation")
    (overall-completion . 50)

    (components
      ;; Build System (4/4 Complete)
      ((build-system
        ((status . "complete")
         (completion . 100)
         (items
           (("justfile" . complete)
            ("Mustfile" . complete)
            ("cookbook.adoc" . complete)
            ("CI/CD pipeline" . complete)))))

       ;; Adapters (3/3 Complete)
       (adapters
        ((status . "complete")
         (completion . 100)
         (count . 28)
         (items
           (("SSG adapters" . complete)
            ("Interface contract" . complete)
            ("Sync mechanism" . complete)))))

       ;; SCM Files (6/6 Complete)
       (scm-files
        ((status . "complete")
         (completion . 100)
         (items
           (("META.scm" . complete)
            ("ECOSYSTEM.scm" . complete)
            ("STATE.scm" . complete)
            ("PLAYBOOK.scm" . complete)
            ("AGENTIC.scm" . complete)
            ("NEUROSYM.scm" . complete)))))

       ;; Documentation (5/8 Complete)
       (documentation
        ((status . "in-progress")
         (completion . 63)
         (items
           (("README.adoc" . pending)
            ("CONTRIBUTING.md" . complete)
            ("SECURITY.md" . complete)
            ("CODE_OF_CONDUCT.md" . complete)
            ("cookbook.adoc" . complete)
            ("copilot-instructions.md" . complete)
            ("API docs" . pending)
            ("User guide" . pending)))))

       ;; Configuration (3/3 Complete)
       (configuration
        ((status . "complete")
         (completion . 100)
         (items
           (("justfile" . complete)
            ("Mustfile" . complete)
            (".gitignore" . complete)))))

       ;; Testing (1/4 Complete)
       (testing
        ((status . "in-progress")
         (completion . 25)
         (items
           (("Syntax checking" . complete)
            ("Adapter verification" . in-progress)
            ("Unit tests" . pending)
            ("E2E tests" . pending)))))

       ;; Security (3/4 Complete)
       (security
        ((status . "in-progress")
         (completion . 75)
         (items
           (("CodeQL SAST" . complete)
            ("Secret detection" . complete)
            ("SHA-pinned actions" . complete)
            ("Dependency audit" . pending)))))

       ;; Tooling (2/6 Complete)
       (tooling
        ((status . "in-progress")
         (completion . 33)
         (items
           (("Linter" . complete)
            ("Formatter" . complete)
            ("LSP integration" . pending)
            ("Compile command" . pending)
            ("Hooks" . pending)
            ("Watch mode" . pending)))))

       ;; Examples (0/3 Complete)
       (examples
        ((status . "pending")
         (completion . 0)
         (items
           (("Example config" . pending)
            ("Example templates" . pending)
            ("Example content" . pending)))))

       ;; Nix (0/3 Complete)
       (nix
        ((status . "pending")
         (completion . 0)
         (items
           (("flake.nix" . pending)
            ("devShell" . pending)
            ("packages" . pending)))))))))

;; ============================================================================
;; BLOCKERS AND ISSUES
;; ============================================================================

(define blockers-and-issues
  '((critical ())

    (high-priority ())

    (medium-priority
      (("Missing test suite" . "Unit tests needed for 70% coverage target")
       ("Missing flake.nix" . "Required by RSR for reproducible builds")
       ("README incomplete" . "Main README.adoc needs content")))

    (low-priority
      (("Example content" . "Add example SSG configurations")
       ("LSP integration" . "Language server protocol support")
       ("Watch mode" . "File watching for development")))))

;; ============================================================================
;; CRITICAL NEXT ACTIONS
;; ============================================================================

(define critical-next-actions
  '((immediate
      (("Add unit tests" . high)
       ("Complete README" . high)
       ("Verify CI/CD works" . high)))

    (this-week
      (("Add flake.nix" . medium)
       ("Create example configs" . medium)
       ("Add E2E tests" . medium)))

    (this-month
      (("LSP integration" . low)
       ("Watch mode" . low)
       ("Performance benchmarks" . low)))))

;; ============================================================================
;; ROADMAP
;; ============================================================================

(define roadmap
  '((v0.1.0
     (name . "Initial Setup")
     (status . "complete")
     (completion . 100)
     (released . "2025-12-15")
     (tasks
       (("RSR compliance" . complete)
        ("Initial SCM files" . complete)
        ("Adapter synchronization" . complete)
        ("Basic CI/CD" . complete))))

    (v0.2.0
     (name . "Build System & Automation")
     (status . "in-progress")
     (completion . 85)
     (target . "2025-12-24")
     (tasks
       (("justfile task runner" . complete)
        ("Mustfile mandatory gates" . complete)
        ("cookbook.adoc" . complete)
        ("Enhanced SCM files" . complete)
        ("PLAYBOOK.scm" . complete)
        ("AGENTIC.scm" . complete)
        ("NEUROSYM.scm" . complete)
        ("CI/CD enhancement" . in-progress))))

    (v0.3.0
     (name . "Testing & Quality")
     (status . "planned")
     (completion . 0)
     (target . "2025-12-31")
     (tasks
       (("Unit test framework" . pending)
        ("E2E test suite" . pending)
        ("70% code coverage" . pending)
        ("Deno configuration" . pending)
        ("Error handling" . pending))))

    (v0.4.0
     (name . "MCP Integration")
     (status . "planned")
     (completion . 0)
     (target . "2026-01-15")
     (tasks
       (("MCP server implementation" . pending)
        ("Tool registration" . pending)
        ("Resource providers" . pending)
        ("Protocol compliance" . pending))))

    (v0.5.0
     (name . "Nix & Reproducibility")
     (status . "planned")
     (completion . 0)
     (target . "2026-01-31")
     (tasks
       (("flake.nix" . pending)
        ("devShell configuration" . pending)
        ("Package definitions" . pending)
        ("CI Nix integration" . pending))))

    (v0.6.0
     (name . "Documentation & Examples")
     (status . "planned")
     (completion . 0)
     (target . "2026-02-15")
     (tasks
       (("Complete README" . pending)
        ("API documentation" . pending)
        ("Usage examples" . pending)
        ("Integration guides" . pending))))

    (v1.0.0
     (name . "Production Ready")
     (status . "planned")
     (completion . 0)
     (target . "2026-03-01")
     (tasks
       (("Full test coverage" . pending)
        ("Performance benchmarks" . pending)
        ("Security audit" . pending)
        ("Release automation" . pending)
        ("Stable API" . pending))))))

;; ============================================================================
;; SESSION HISTORY
;; ============================================================================

(define session-history
  '((snapshots
     ((date . "2025-12-15")
      (session . "initial")
      (notes . "Initial commit, SCM files added"))

     ((date . "2025-12-17")
      (session . "security-review")
      (notes . "Security docs fixed, placeholders replaced"))

     ((date . "2025-12-22")
      (session . "build-system")
      (notes . "justfile, Mustfile, cookbook.adoc, PLAYBOOK/AGENTIC/NEUROSYM.scm added")))))

;; ============================================================================
;; STATE SUMMARY
;; ============================================================================

(define state-summary
  '((project . "doit-ssg")
    (version . "0.2.0")
    (completion . 50)
    (blockers . 0)
    (updated . "2025-12-22")
    (current-phase . "v0.2 - Build System & Automation")
    (next-milestone . "v0.3.0 - Testing & Quality")))
