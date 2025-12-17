;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — doit-ssg

(ecosystem
  (version "1.0.0")
  (name "doit-ssg")
  (type "satellite-ssg")
  (purpose "Satellite SSG implementation integrating with poly-ssg-mcp hub for unified static site generation")

  (position-in-ecosystem
    "Satellite SSG in hyperpolymath ecosystem. Receives adapter updates from poly-ssg-mcp hub.
     Provides project-specific SSG implementations using 28 language-diverse generators.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP protocol
         doit-ssg = Satellite implementation consuming hub adapters"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR compliance guidelines for all ecosystem projects")))

  (what-this-is
    "A satellite SSG project that:
     - Integrates with poly-ssg-mcp hub for adapter synchronization
     - Supports 28 static site generators across 14+ languages
     - Uses Deno runtime for secure JavaScript/TypeScript execution
     - Follows RSR Gold compliance standards")

  (what-this-is-not
    "- NOT a standalone SSG (depends on external binaries)
     - NOT the canonical adapter source (sync from poly-ssg-mcp)
     - NOT exempt from RSR compliance"))
