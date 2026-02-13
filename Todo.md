# Todo.md

## Meta
- Repo: /home/rtiodev/.openclaw/workspace
- Primary goal: Build Linktree clone with analytics, A/B testing, scheduling, and SEO features
- DEPLOY_APPROVED: no
- Target environment: workspace

---

## Phase 1: Git & Infrastructure

### T-100 — Commit and push all changes to the configuration repository
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] All uncommitted changes are staged
- [ ] Commit message is descriptive
- [ ] Changes pushed to remote repository
- [ ] Remote branch is up to date
Notes / Constraints:
- Ensure no sensitive data is committed

---

## Phase 2: Linktree Clone - Project Setup

### T-200 — Setup project structure for Linktree clone
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] Project structure is defined
- [ ] Dependencies are installed
- [ ] Configuration files are in place
Notes / Constraints:
- Use existing codebase as base if available

---

## Phase 3: Feature Implementation

### T-300 — Implement Analytics Dashboard
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Dashboard UI is rendered
- [ ] Analytics data is displayed correctly
- [ ] All charts and metrics are functional
Notes / Constraints:
- Should include visitor stats, click counts, time series

### T-301 — Implement Click Tracking API
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] API endpoint receives click events
- [ ] Click data is stored in database
- [ ] Data is retrievable for analytics
Notes / Constraints:
- RESTful API design required

### T-302 — Implement Link Scheduling
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Links can be scheduled for future dates
- [ ] Scheduled links appear/disappear at correct time
- [ ] Admin can set start/end dates for any link
Notes / Constraints:
- Timezone awareness required

### T-303 — Implement A/B Testing
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Multiple link variants can be created
- [ ] Traffic is split between variants
- [ ] Analytics show variant performance
Notes / Constraints:
- Configurable traffic split percentage

### T-304 — Implement Analytics API
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] API endpoints for retrieving analytics data
- [ ] Data filtering by date range
- [ ] Response format is consistent and documented
Notes / Constraints:
- RESTful API with pagination

### T-305 — Implement SEO/OpenGraph Support
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Meta tags are generated dynamically
- [ ] OpenGraph tags work for social sharing
- [ ] Custom title/description per profile
Notes / Constraints:
- Must work with link previews on Discord, WhatsApp, etc.

### T-306 — Implement Profile Pages
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Profile pages render correctly
- [ ] Links are displayed in correct order
- [ ] Profile customization options work
Notes / Constraints:
- Responsive design required

---

## Phase 4: Testing Infrastructure

### T-400 — Run all tests (unit + e2e)
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] All unit tests are executed
- [ ] All e2e tests are executed
- [ ] Test results are logged
Notes / Constraints:
- Include both backend and frontend tests

### T-401 — List all failing tests
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] Failing tests are identified
- [ ] Failure reasons are documented
- [ ] Tests are prioritized by severity
Notes / Constraints:
- Group by feature/module

### T-402 — Fix failing tests one by one
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] Each failing test is analyzed
- [ ] Root cause is identified and documented
- [ ] Test passes after fix
Notes / Constraints:
- Fix implementation, not test assertions (unless test is wrong)

---

## Phase 5: Unit Test Coverage

### T-500 — Create unit tests for all features
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] Unit tests exist for Analytics Dashboard
- [ ] Unit tests exist for Click Tracking API
- [ ] Unit tests exist for Link Scheduling
- [ ] Unit tests exist for A/B Testing
- [ ] Unit tests exist for Analytics API
- [ ] Unit tests exist for Profile pages
Notes / Constraints:
- Aim for 80%+ coverage on business logic

---

## Phase 6: E2E Test Coverage

### T-600 — Create e2e tests for happy paths
Status: TODO
Priority: P1
Acceptance Criteria:
- [ ] E2E test: User visits profile page
- [ ] E2E test: User clicks a link (tracking verified)
- [ ] E2E test: Admin creates scheduled link
- [ ] E2E test: Admin creates A/B test variant
- [ ] E2E test: Analytics data is displayed
Notes / Constraints:
- Use Playwright or Cypress

---

## Phase 7: Test & Fix Loop

### T-700 — Run test suite and generate report
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] Full test suite runs successfully
- [ ] Report is generated and saved
- [ ] Pass/fail summary is clear
Notes / Constraints:
- Include coverage report

### T-701 — Analyze report and fix errors
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] All errors are identified
- [ ] Errors are prioritized
- [ ] Each error is fixed
- [ ] Tests are re-run to verify fixes
Notes / Constraints:
- Iterate until all tests pass

### T-702 — Verify all features are implemented and tested
Status: TODO
Priority: P0
Acceptance Criteria:
- [ ] All features have passing tests
- [ ] All acceptance criteria are met
- [ ] No known bugs or missing features
Notes / Constraints:
- Final validation before deployment

---

## Backlog (older tasks)

### T-001 — Bootstrap OpenClaw Operating System
Status: DONE
Priority: P0
Acceptance Criteria:
- [x] Soul.md merged with engineering workflow
- [x] Todo.md created with structure
- [x] Progress-log.md created
- [x] Boot entry logged

---

## Rules
- Every task must have acceptance criteria
- Tasks larger than ~1-2 hours must be split
- Status must be: TODO, IN_PROGRESS, DONE, BLOCKED
- After completing Phase 1, move sequentially through phases
- The test/fix loop (Phase 7) runs after Phases 3, 5, and 6
