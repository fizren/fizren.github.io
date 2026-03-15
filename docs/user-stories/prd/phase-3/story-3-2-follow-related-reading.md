# Story 3.2: Move between related items without getting lost

**Priority**: Could Have  
**Dependencies**: Story 3.1  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** curious reader  
**I want to** move from one relevant item to another through lightweight related links  
**So that** I can explore context without returning to the homepage every time

## Acceptance Criteria

### Scenario 1: Reader follows related note from a Family essay
**Given** a Family essay references a Note titled "Archive visit log, May 2026"  
**When** I click the related link  
**Then** I land on that specific Note page  
**And** I can continue reading without losing context

### Scenario 2: Reader follows related source context from Małolat page
**Given** the Małolat page references a related Family essay  
**When** I select that related item  
**Then** I arrive at the related essay  
**And** the relation is clear from the link label

### Scenario 3: Related links remain selective
**Given** an entry has many possible relationships  
**When** I view related links  
**Then** I see only a small, curated set  
**And** the page does not become a noisy link farm

## Technical Notes

- Keep related reading explicit and curated.
- Favor quality of links over quantity.
- Maintain predictable link placement for scanning.

## Validation

- [ ] Readers can navigate between related pieces without dead ends.
- [ ] Link labels explain why items are related.
- [ ] Related blocks remain compact and non-intrusive.
- [ ] Mobile tap targets remain usable.
