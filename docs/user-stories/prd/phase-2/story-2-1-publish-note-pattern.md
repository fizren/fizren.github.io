# Story 2.1: Publish a note using one repeatable pattern

**Priority**: Must Have  
**Dependencies**: Story 1.3 (Notes exists with representative content)  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** Piotr (author/maintainer)  
**I want to** publish a new note by following one clear content pattern  
**So that** I can write and publish without reinventing structure every time

## Acceptance Criteria

### Scenario 1: Author publishes a short note quickly
**Given** I have a new text called "Three things I learned in March"  
**When** I create a new note with title, date, and body  
**Then** it appears in Notes in chronological order  
**And** the published page uses the same structure as existing notes

### Scenario 2: Author publishes a longer reflective note
**Given** I write a 1200-word note called "On slow projects"  
**When** I publish it  
**Then** it renders with readable typography and spacing  
**And** it does not require custom layout work for this single note

### Scenario 3: Missing required metadata is recoverable
**Given** I create a note without a title  
**When** I preview or build the site  
**Then** I can detect the issue quickly through deterministic validation output  
**And** I can fix metadata and republish without manual debugging

## Technical Notes

- Keep author workflow repository-based and low-friction.
- Use one default content shape for notes.
- Prioritize deterministic validation over ad hoc checks.

## Validation

- [ ] New note can be published with one standard pattern.
- [ ] Note appears in Notes listing with expected date ordering.
- [ ] Author can detect and correct metadata mistakes quickly.
- [ ] No custom one-off template is required.
