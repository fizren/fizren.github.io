# Story 1.4: Use the Małolat page as a reliable reference

**Priority**: Must Have  
**Dependencies**: Story 1.2 (navigation to Małolat section exists)  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** visitor looking specifically for information about Małolat (Zbigniew Czyżewski)  
**I want to** find a concise, trustworthy reference page  
**So that** I can get core facts quickly without searching the whole website

## Acceptance Criteria

### Scenario 1: User with narrow information need finds key facts fast
**Given** I arrive at the site to learn about Małolat (Zbigniew Czyżewski)  
**When** I open the `Małolat` page  
**Then** I see a clear introductory summary at the top  
**And** I can identify key facts in a structured way within one screen

### Scenario 2: User can identify evidence trail
**Given** I am reading a factual claim on the Małolat page  
**When** I look for supporting material  
**Then** I can find at least one listed source or material reference  
**And** source labels are understandable to a general reader

### Scenario 3: User is not forced into unrelated sections
**Given** I only care about Małolat information  
**When** I finish reading the Małolat page  
**Then** I have enough information to leave satisfied  
**And** optional links to other sections do not interrupt the reference flow

## Technical Notes

- Favor stable structure over heavy styling.
- Keep factual statements separated from interpretation where possible.
- Ensure links and references are readable on mobile.

## Validation

- [ ] The Małolat page can be consumed as a standalone reference.
- [ ] At least one source/material reference is visible.
- [ ] First-time users can locate the page in one navigation step.
- [ ] Page remains readable on desktop and mobile.

## Assumptions and Open Questions

- Assumes Phase 1 requires a minimal but credible reference version.
- Phase 2 may expand source structure and materials taxonomy.
