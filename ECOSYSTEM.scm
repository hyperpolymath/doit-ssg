;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — doit-ssg

(define-module (doit-ssg ecosystem)
  #:export (ecosystem-info related-projects integration-points))

;; ============================================================================
;; ECOSYSTEM INFORMATION
;; ============================================================================

(ecosystem
  (version "1.0.0")
  (name "doit-ssg")
  (type "satellite-ssg")
  (status "active")
  (purpose "Satellite SSG implementation integrating with poly-ssg-mcp hub for unified static site generation")

  (position-in-ecosystem
    "Satellite SSG in hyperpolymath ecosystem. Receives adapter updates from poly-ssg-mcp hub.
     Provides project-specific SSG implementations using 28 language-diverse generators.
     Follows RSR Gold compliance standards with SHA-pinned dependencies.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (sync-direction "hub -> satellite")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP protocol
         doit-ssg = Satellite implementation consuming hub adapters"))

    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (compliance-level "gold")
      (description "RSR compliance guidelines for all ecosystem projects"))

    (project
      (name "hyperpolymath-org")
      (url "https://github.com/hyperpolymath")
      (relationship "organization")
      (description "Parent organization for all hyperpolymath projects")))

  (what-this-is
    "A satellite SSG project that:
     - Integrates with poly-ssg-mcp hub for adapter synchronization
     - Supports 28 static site generators across 14+ languages
     - Uses Deno runtime for secure JavaScript/TypeScript execution
     - Follows RSR Gold compliance standards
     - Provides comprehensive task automation via justfile
     - Includes neurosymbolic configuration for AI agents")

  (what-this-is-not
    "- NOT a standalone SSG (depends on external binaries)
     - NOT the canonical adapter source (sync from poly-ssg-mcp)
     - NOT exempt from RSR compliance
     - NOT a monolithic application (modular adapter architecture)"))

;; ============================================================================
;; INTEGRATION POINTS
;; ============================================================================

(define integration-points
  '((upstream
     ((poly-ssg-mcp
       (type . "adapter-source")
       (sync-command . "just adapter-sync")
       (frequency . "weekly"))))

    (downstream
     ((user-projects
       (type . "consumer")
       (interface . "MCP protocol")
       (documentation . "cookbook.adoc"))))

    (lateral
     ((rsr-compliance
       (type . "standard")
       (validation . "CI/CD checks")
       (documentation . "CONTRIBUTING.md"))))))

;; ============================================================================
;; SUPPORTED SSG LANGUAGES
;; ============================================================================

(define supported-languages
  '((tier-1 . ("Rust" "Haskell" "Elixir"))
    (tier-2 . ("Julia" "Clojure" "Racket" "Scala"))
    (tier-3 . ("Kotlin" "F#" "OCaml" "Nim" "Crystal" "Swift" "D" "Tcl" "Erlang" "Common Lisp"))))
