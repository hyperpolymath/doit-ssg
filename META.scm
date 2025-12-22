;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — doit-ssg

(define-module (doit-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

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
     (consequences . ("Adapter synchronization" "Deno runtime" "MCP protocol compliance")))))

(define development-practices
  '((code-style (languages . ("javascript" "typescript")) (formatter . "deno fmt") (linter . "deno lint"))
    (security (sast . "CodeQL") (credentials . "env vars only") (input-validation . "required"))
    (testing (coverage-minimum . 70) (framework . "deno test"))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")
    (why-deno "Deno provides secure-by-default runtime with built-in TypeScript support.")
    (why-hub-satellite "Centralizes adapter maintenance while enabling project-specific customization.")))
