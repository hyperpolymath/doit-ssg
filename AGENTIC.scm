;;; AGENTIC.scm — doit-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Agentic AI configuration for doit-ssg
;; Defines AI agent behaviors, capabilities, and guardrails

(define-module (doit-ssg agentic)
  #:export (agent-config capabilities guardrails tool-policies))

;; ============================================================================
;; AGENT CONFIGURATION
;; Core settings for AI agent interaction with this project
;; ============================================================================

(define agent-config
  '((identity
      (name . "doit-ssg-agent")
      (role . "Satellite SSG Development Assistant")
      (purpose . "Assist with adapter development, testing, and maintenance"))

    (context
      (project-type . "satellite-ssg")
      (ecosystem . "hyperpolymath")
      (primary-language . "JavaScript")
      (runtime . "Deno")
      (adapter-count . 28))

    (behavior
      (communication-style . "technical-concise")
      (proactivity . "suggest-improvements")
      (error-handling . "explain-and-fix")
      (documentation . "update-when-modifying"))))

;; ============================================================================
;; CAPABILITIES
;; What the agent is allowed and expected to do
;; ============================================================================

(define capabilities
  '((file-operations
      ((read
         (allowed . ("adapters/*.js" "*.scm" "*.md" "*.adoc" ".github/**"))
         (purpose . "Understanding code and configuration"))
       (write
         (allowed . ("adapters/*.js" "tests/**" "docs/**"))
         (requires-review . ("*.scm" ".github/**" "justfile" "Mustfile"))
         (forbidden . (".env*" "secrets/**" "*.pem" "*.key")))
       (create
         (allowed . ("adapters/*.js" "tests/**" "docs/**"))
         (requires-approval . ("*.scm" "new-directories")))))

    (command-execution
      ((allowed
         ("just *" . "All just commands are safe")
         ("deno *" . "Deno operations for testing")
         ("git status" . "Check repository state")
         ("git diff" . "Review changes")
         ("git log" . "View history"))
       (requires-approval
         ("git push" . "Pushing to remote")
         ("git commit" . "Creating commits")
         ("npm *" . "Package management"))
       (forbidden
         ("rm -rf /" . "Destructive operations")
         ("curl | bash" . "Arbitrary code execution")
         ("eval" . "Dynamic code evaluation"))))

    (code-generation
      ((adapter-interface
         (template . "adapters/_template.js")
         (required-exports . ("name" "language" "description" "connect" "disconnect" "isConnected" "tools")))
       (test-generation
         (framework . "deno test")
         (coverage-target . 70))
       (documentation
         (format . "asciidoc")
         (style . "technical-reference"))))))

;; ============================================================================
;; GUARDRAILS
;; Safety constraints and validation rules
;; ============================================================================

(define guardrails
  '((security
      ((secret-detection
         (enabled . #t)
         (patterns . ("password" "api_key" "secret" "token" "credential"))
         (action . "block-and-warn"))
       (input-validation
         (enabled . #t)
         (sanitize-before-exec . #t))
       (output-filtering
         (enabled . #t)
         (filter-sensitive . #t))))

    (code-quality
      ((lint-before-commit
         (enabled . #t)
         (command . "just lint"))
       (test-before-push
         (enabled . #t)
         (command . "just test"))
       (format-on-save
         (enabled . #t)
         (command . "deno fmt"))))

    (resource-limits
      ((max-file-size . "1MB")
       (max-files-per-operation . 20)
       (max-command-timeout . "5m")
       (max-concurrent-operations . 5)))

    (content-policies
      ((no-generated-urls . #t)
       (no-external-requests . "without-approval")
       (no-binary-files . "without-approval")
       (spdx-headers-required . #t)))))

;; ============================================================================
;; TOOL POLICIES
;; Specific policies for tool usage
;; ============================================================================

(define tool-policies
  '((Read
      (purpose . "Examine code, configuration, and documentation")
      (pre-check . none)
      (post-check . none)
      (rate-limit . "100/minute"))

    (Write
      (purpose . "Create new files when necessary")
      (pre-check . ("verify-directory-exists" "check-not-overwriting-critical"))
      (post-check . ("run-lint" "check-syntax"))
      (requires-spdx . #t)
      (rate-limit . "20/minute"))

    (Edit
      (purpose . "Modify existing files")
      (pre-check . ("read-file-first" "verify-context"))
      (post-check . ("run-lint" "check-syntax" "run-affected-tests"))
      (preserve-spdx . #t)
      (rate-limit . "30/minute"))

    (Bash
      (purpose . "Execute shell commands for build/test operations")
      (pre-check . ("validate-command" "check-not-destructive"))
      (post-check . ("verify-success"))
      (allowed-patterns . ("just *" "deno *" "git status" "git diff" "git log" "ls" "cat"))
      (blocked-patterns . ("rm -rf" "curl.*|.*bash" "wget.*|.*sh" "eval"))
      (rate-limit . "50/minute"))

    (Task
      (purpose . "Delegate complex research and exploration")
      (subtypes
        ((Explore . "Codebase exploration and understanding")
         (Plan . "Implementation planning")
         (claude-code-guide . "Documentation lookup")))
      (rate-limit . "10/minute"))

    (TodoWrite
      (purpose . "Track task progress")
      (auto-update . #t)
      (mark-complete-immediately . #t))))

;; ============================================================================
;; ADAPTER-SPECIFIC BEHAVIORS
;; Agent behaviors specific to SSG adapter development
;; ============================================================================

(define adapter-behaviors
  '((when-creating-adapter
      (("Check adapter doesn't exist" . "Glob for adapters/*.js")
       ("Use template structure" . "Follow interface contract")
       ("Add SPDX header" . "Required for RSR compliance")
       ("Implement all exports" . "name, language, description, connect, disconnect, isConnected, tools")
       ("Create tests" . "tests/adapters/{name}.test.js")
       ("Update adapter count" . "Verify with just adapter-count")))

    (when-modifying-adapter
      (("Read existing code first" . "Understand current implementation")
       ("Preserve interface" . "Don't break existing tools")
       ("Update tests" . "Modify tests to match changes")
       ("Run verification" . "just adapter-verify")))

    (when-debugging
      (("Check syntax first" . "just check-syntax")
       ("Run specific tests" . "deno test adapters/{name}.js")
       ("Check logs" . "Review error output")
       ("Verify interface" . "Ensure all exports present")))))

;; ============================================================================
;; HOOKS INTEGRATION
;; Configuration for Claude Code hooks
;; ============================================================================

(define hooks-config
  '((session-start
      (commands . ("just status" "just adapter-count"))
      (display . "Show project state on start"))

    (pre-tool-call
      ((Write
         (check . "just check-secrets")
         (on-fail . "block"))
       (Edit
         (check . "verify-file-read")
         (on-fail . "warn"))))

    (post-tool-call
      ((Write
         (check . "just check-syntax")
         (on-fail . "warn")
         (glob . "adapters/*.js"))
       (Edit
         (check . "just check-syntax")
         (on-fail . "warn")
         (glob . "adapters/*.js"))
       (Bash
         (log . #t)
         (check-exit-code . #t))))))
