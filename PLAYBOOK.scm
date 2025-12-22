;;; PLAYBOOK.scm — doit-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;; Operational playbook for doit-ssg satellite SSG
;; Defines workflows, runbooks, and operational procedures

(define-module (doit-ssg playbook)
  #:export (workflows runbooks incident-response))

;; ============================================================================
;; WORKFLOWS
;; Standard operational workflows for project maintenance
;; ============================================================================

(define workflows
  '((development
      (name . "Development Workflow")
      (description . "Standard development cycle for adapter changes")
      (steps
        (("Setup" . "just clean && just nix-dev")
         ("Develop" . "Edit adapters, run 'just check-syntax' frequently")
         ("Test" . "just test-all")
         ("Lint" . "just lint && just fmt")
         ("Verify" . "just adapter-verify")
         ("Commit" . "git add -A && git commit -m 'feat: description'")))
      (guardrails
        ("Never commit secrets"
         "Run check-secrets before every commit"
         "Maintain 70% test coverage")))

    (release
      (name . "Release Workflow")
      (description . "Preparing and publishing a new release")
      (steps
        (("Validate" . "just ci")
         ("Update VERSION" . "Edit STATE.scm version field")
         ("Update CHANGELOG" . "Add release notes")
         ("Tag" . "git tag v0.x.0")
         ("Push" . "git push origin main --tags")
         ("Verify CI" . "Check GitHub Actions completed")))
      (blockers
        ("All tests must pass"
         "No critical security issues"
         "CHANGELOG must be updated")))

    (adapter-sync
      (name . "Adapter Synchronization")
      (description . "Sync adapters from poly-ssg-mcp hub")
      (steps
        (("Backup" . "cp -r adapters/ adapters.backup/")
         ("Sync" . "just adapter-sync")
         ("Verify" . "just adapter-verify && just adapter-count")
         ("Test" . "just test-adapters")
         ("Cleanup" . "rm -rf adapters.backup/")))
      (frequency . "weekly"))

    (security-audit
      (name . "Security Audit")
      (description . "Regular security review")
      (steps
        (("Secrets" . "just check-secrets")
         ("Dependencies" . "just audit")
         ("CodeQL" . "Check GitHub Security tab")
         ("Review" . "Manual review of recent changes")))
      (frequency . "weekly"))))

;; ============================================================================
;; RUNBOOKS
;; Detailed procedures for specific operational tasks
;; ============================================================================

(define runbooks
  '((adapter-add
      (name . "Add New Adapter")
      (trigger . "New SSG support requested")
      (procedure
        (("Create file" . "adapters/new-ssg.js")
         ("Implement interface"
           ("export const name = 'NewSSG'"
            "export const language = 'Language'"
            "export const description = '...'"
            "export async function connect() {...}"
            "export async function disconnect() {...}"
            "export function isConnected() {...}"
            "export const tools = [...]"))
         ("Add SPDX header" . "Required for RSR compliance")
         ("Verify interface" . "just adapter-verify")
         ("Add tests" . "tests/adapters/new-ssg.test.js")
         ("Update count" . "Verify just adapter-count shows +1")
         ("Submit PR" . "feat(adapters): add NewSSG support"))))

    (adapter-remove
      (name . "Remove Adapter")
      (trigger . "Adapter deprecated or obsolete")
      (procedure
        (("Document reason" . "Update CHANGELOG with rationale")
         ("Remove file" . "rm adapters/old-ssg.js")
         ("Update tests" . "Remove associated tests")
         ("Verify count" . "just adapter-count")
         ("Submit PR" . "chore(adapters): remove OldSSG (deprecated)"))))

    (security-incident
      (name . "Security Incident Response")
      (trigger . "Security vulnerability discovered")
      (procedure
        (("Assess" . "Determine severity (Critical/High/Medium/Low)")
         ("Isolate" . "If critical, consider disabling affected code")
         ("Document" . "Create GitHub Security Advisory (private)")
         ("Fix" . "Develop patch on security/ branch")
         ("Test" . "Verify fix doesn't break functionality")
         ("Release" . "Publish fix and advisory together")
         ("Notify" . "Inform affected users")))
      (sla
        (("Critical" . "24 hours")
         ("High" . "72 hours")
         ("Medium" . "7 days")
         ("Low" . "Next release"))))

    (ci-failure
      (name . "CI Failure Resolution")
      (trigger . "GitHub Actions workflow fails")
      (procedure
        (("Identify" . "Check which job failed")
         ("Logs" . "Review workflow logs")
         ("Reproduce" . "Run 'just ci' locally")
         ("Fix" . "Address root cause")
         ("Verify" . "Push fix and confirm CI passes")))
      (common-causes
        (("Lint failure" . "Run 'just fmt' to fix formatting")
         ("Test failure" . "Check test output for specifics")
         ("Security" . "Remove detected secrets")
         ("Timeout" . "Optimize slow tests"))))))

;; ============================================================================
;; INCIDENT RESPONSE
;; Escalation procedures and contact information
;; ============================================================================

(define incident-response
  '((severity-levels
      ((critical
         (description . "System down, data breach, or active exploit")
         (response-time . "1 hour")
         (escalation . immediate))
       (high
         (description . "Security vulnerability or major functionality broken")
         (response-time . "4 hours")
         (escalation . same-day))
       (medium
         (description . "Feature degradation or non-critical security issue")
         (response-time . "24 hours")
         (escalation . next-business-day))
       (low
         (description . "Minor issues, cosmetic bugs")
         (response-time . "7 days")
         (escalation . as-available))))

    (escalation-path
      (("Level 1" . "Project maintainers")
       ("Level 2" . "hyperpolymath organization")
       ("Level 3" . "External security consultants")))

    (communication
      ((internal . "GitHub Issues (private for security)")
       (external . "GitHub Security Advisories")
       (urgent . "Direct maintainer contact")))

    (post-incident
      (("Root cause analysis" . required)
       ("Documentation update" . required)
       ("Process improvement" . recommended)
       ("Retrospective" . recommended)))))

;; ============================================================================
;; AUTOMATION HOOKS
;; Integration points for automated tooling
;; ============================================================================

(define automation
  '((ci-triggers
      ((push . ("main"))
       (pull-request . ("main"))
       (schedule . "weekly")))

    (required-checks
      (("lint" . blocking)
       ("test" . blocking)
       ("security" . blocking)
       ("adapter-verify" . blocking)))

    (notifications
      ((failure . "maintainers")
       (security . "security-team")
       (release . "all-watchers")))

    (auto-merge
      ((enabled . #f)
       (conditions . ("all-checks-pass" "approved" "no-conflicts"))))))
