# Story 3.1: Find older material through lightweight discovery paths

**Priority**: Should Have  
**Dependencies**: Story 2.2 and Story 2.3  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** returning reader  
**I want to** find older notes and photos by lightweight paths like year or topic  
**So that** I can revisit past material without deep searching

## Acceptance Criteria

### Scenario 1: Reader finds a note from a specific year
**Given** Notes includes items from 2024, 2025, and 2026  
**When** I choose discovery path `2025`  
**Then** I can see note entries from 2025  
**And** I can open a specific note in one click

### Scenario 2: Reader follows a topic path across time
**Given** several notes include topic `family-history`  
**When** I open that topic path  
**Then** I see related entries across multiple dates  
**And** the listing remains concise and readable

### Scenario 3: Discovery does not become cluttered
**Given** the archive grows past 100 entries  
**When** I open discovery controls  
**Then** I still see a small, understandable set of discovery options  
**And** I am not forced into complex multi-filter interfaces

## Technical Notes

- Keep discovery lightweight by design.
- Avoid introducing high-maintenance taxonomy complexity.
- Ensure discovery controls remain touch-friendly.

## Validation

- [ ] Reader can retrieve older material by year or topic.
- [ ] Discovery remains understandable as content grows.
- [ ] No faceted-search complexity is required for basic retrieval.
- [ ] Interface remains calm on mobile and desktop.
