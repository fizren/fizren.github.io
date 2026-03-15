# Story 2.2: Browse notes chronologically with optional topics

**Priority**: Should Have  
**Dependencies**: Story 2.1  
**Estimated Complexity**: Medium  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** returning reader  
**I want to** browse notes by recency and optionally by lightweight topics  
**So that** I can follow current writing and revisit themes I care about

## Acceptance Criteria

### Scenario 1: Reader sees newest note first
**Given** Notes has entries dated 2026-01-10, 2026-02-02, and 2026-03-14  
**When** I open the Notes listing  
**Then** I see the 2026-03-14 note first  
**And** date labels are visible for each listed note

### Scenario 2: Reader uses topic cues without clutter
**Given** two notes include topic label `history` and one includes `workflow`  
**When** I browse the Notes list  
**Then** topic cues are available but visually quiet  
**And** navigation still feels calm rather than filter-heavy

### Scenario 3: Reader can ignore topics and still navigate easily
**Given** I do not care about topic labels  
**When** I scroll through notes in date order  
**Then** I can continue reading normally  
**And** topic controls do not block basic chronological browsing

## Technical Notes

- Keep topic discovery lightweight and optional.
- Avoid adding complex faceted navigation.
- Ensure list usability on small screens.

## Validation

- [ ] Notes order is deterministic and date-based.
- [ ] Topic cues exist without dominating the interface.
- [ ] Notes remain easy to browse when topics are ignored.
- [ ] Behavior aligns with PRD risk about noisy tags.

## Assumptions and Open Questions

- Open PRD question: how visible topics should be in Notes.
