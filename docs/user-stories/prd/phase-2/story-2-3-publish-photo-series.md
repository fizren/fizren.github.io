# Story 2.3: Publish photos as connected series

**Priority**: Must Have  
**Dependencies**: Story 1.3 (Photos has representative starter content)  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** visitor interested in photography  
**I want to** view photos as small connected series  
**So that** each set feels intentional instead of a random file dump

## Acceptance Criteria

### Scenario 1: Reader views a coherent photo series
**Given** a series titled "Winter Walk in Gdansk" with 8 photos  
**When** I open that series page  
**Then** I can view the images as one connected set  
**And** I understand the shared context from title and short description

### Scenario 2: Reader distinguishes one series from another
**Given** two series exist: "Winter Walk in Gdansk" and "Berlin Station Morning"  
**When** I browse Photos  
**Then** I can clearly choose one series at a time  
**And** each series has its own page or entry point

### Scenario 3: Presentation remains simple and readable
**Given** I open a photo series on mobile  
**When** images load  
**Then** I can scroll and view them without layout breakage  
**And** I do not need heavy interactive controls to understand the series

## Technical Notes

- Keep initial presentation simple (stacked or similarly lightweight).
- Optimize for readability and stability across device widths.
- Defer advanced gallery behaviors unless clearly needed.

## Validation

- [ ] At least one multi-image series is published and understandable.
- [ ] Distinct series are clearly separated in listing/navigation.
- [ ] Mobile reading/viewing flow stays stable.
- [ ] No high-maintenance gallery dependency is required.

## Assumptions and Open Questions

- Open PRD question: stacked presentation vs light carousel in future iterations.
