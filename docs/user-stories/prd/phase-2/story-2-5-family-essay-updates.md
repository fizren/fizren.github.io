# Story 2.5: Update family essays with visible research progress

**Priority**: Must Have  
**Dependencies**: Story 1.2 (Family section exists)  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** family-history reader  
**I want to** read evolving family essays with visible updates  
**So that** I can follow progress without losing narrative continuity

## Acceptance Criteria

### Scenario 1: Reader sees narrative essay, not fragmented micro-posts
**Given** I open a Family entry titled "The Vilnius branch, 1890-1939"  
**When** I read the page  
**Then** I see one coherent essay structure  
**And** I do not need to open many tiny posts to understand the topic

### Scenario 2: Reader can identify what changed recently
**Given** the essay was updated on 2026-03-15 with two new source findings  
**When** I open the page  
**Then** I can find a visible but calm update marker (for example, updated date or short update note)  
**And** I can distinguish new material from older text

### Scenario 3: Long essays remain readable
**Given** an essay exceeds 2500 words  
**When** I read on mobile  
**Then** headings and spacing help me keep orientation  
**And** the page does not feel like an unstructured text wall

## Technical Notes

- Favor a small number of living essays.
- Keep update signals visible but not noisy.
- Maintain narrative-first presentation over database-like structures.

## Validation

- [ ] Family content appears as living essays, not fragmented notes.
- [ ] Readers can identify recent updates without confusion.
- [ ] Long-form readability holds on desktop and mobile.
- [ ] Structure stays aligned with PRD family-section intent.

## Assumptions and Open Questions

- Open PRD question: whether update markers should be always expanded or visually quiet.
- Open PRD question: final public label for this section (`Family` vs `Family History`).
