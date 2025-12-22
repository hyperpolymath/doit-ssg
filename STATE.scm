;;; STATE.scm — doit-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (doit-ssg state)
  #:export (metadata current-position roadmap blockers session-history))

;; ============================================================================
;; PROJECT METADATA
;; ============================================================================

(define metadata
  '((version . "0.1.0") (updated . "2025-12-17") (project . "doit-ssg")))

(define current-position
  '((phase . "v0.1 - Initial Setup")
    (overall-completion . 35)
    (components
      ((rsr-compliance ((status . "complete") (completion . 100)))
       (scm-files ((status . "complete") (completion . 100)))
       (adapters ((status . "synced") (completion . 100) (count . 28)))
       (security-docs ((status . "in-progress") (completion . 80)))
       (build-system ((status . "pending") (completion . 0)))
       (test-suite ((status . "pending") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())
    (medium-priority
      (("Missing justfile" . "Required by RSR for task automation")
       ("Missing flake.nix" . "Required by RSR for reproducible builds")
       ("Missing test suite" . "70% coverage target not yet achievable")))))

(define critical-next-actions
  '((immediate
      (("Verify CI/CD works on main" . high)
       ("Create justfile with common tasks" . high)))
    (this-week
      (("Add flake.nix for Nix development" . medium)
       ("Create adapter test suite" . medium)
       ("Add example SSG configurations" . low)))))

(define roadmap
  '((v0.1.0
      (name . "Initial Setup")
      (status . "in-progress")
      (completion . 35)
      (tasks
        (("RSR compliance" . complete)
         ("SCM files (META, ECOSYSTEM, STATE)" . complete)
         ("Security documentation" . complete)
         ("Adapter synchronization from hub" . complete)
         ("CI/CD with CodeQL" . complete)
         ("justfile task runner" . pending)
         ("flake.nix Nix environment" . pending))))
    (v0.2.0
      (name . "Build System & Testing")
      (status . "planned")
      (completion . 0)
      (tasks
        (("Adapter test framework" . pending)
         ("CI test pipeline" . pending)
         ("70% code coverage" . pending)
         ("Deno configuration" . pending)
         ("Error handling standardization" . pending))))
    (v0.3.0
      (name . "MCP Integration")
      (status . "planned")
      (completion . 0)
      (tasks
        (("MCP server implementation" . pending)
         ("Tool registration" . pending)
         ("Resource providers" . pending)
         ("Protocol compliance tests" . pending))))
    (v0.4.0
      (name . "Documentation & Examples")
      (status . "planned")
      (completion . 0)
      (tasks
        (("API documentation" . pending)
         ("Usage examples per SSG" . pending)
         ("Integration guides" . pending)
         ("README completion" . pending))))
    (v1.0.0
      (name . "Production Ready")
      (status . "planned")
      (completion . 0)
      (tasks
        (("Full test coverage" . pending)
         ("Performance benchmarks" . pending)
         ("Security audit" . pending)
         ("Release automation" . pending)
         ("Stable API" . pending))))))

(define session-history
  '((snapshots
      ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
      ((date . "2025-12-17") (session . "security-review") (notes . "SCM updates, security fixes, roadmap added")))))

(define state-summary
  '((project . "doit-ssg")
    (completion . 35)
    (blockers . 0)
    (updated . "2025-12-17")
    (next-milestone . "v0.2.0 - Build System & Testing")))
