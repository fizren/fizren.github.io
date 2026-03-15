# Story 1.2: Navigate directly to five sections

**Priority**: Must Have  
**Dependencies**: Story 1.1 (homepage context exists)  
**Estimated Complexity**: Low  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** visitor with a specific intent  
**I want to** jump directly to Notes, Photos, Work, Family, or Małolat from main navigation  
**So that** I can reach the right section in one click

## Acceptance Criteria

### Scenario 1: Reader looking for notes reaches Notes immediately
**Given** I open the homepage menu  
**When** I click `Notes`  
**Then** I land on the Notes section page  
**And** I see Notes content, not generic blog labels like "Posts"

### Scenario 2: Family member looking for family writing finds Family section
**Given** I open the main navigation on mobile  
**When** I tap `Family`  
**Then** I land on the Family section page  
**And** I can start reading family essay content without extra filtering

### Scenario 3: Missing or broken navigation is visible as failure
**Given** I am on any section page (for example, `Work`)  
**When** I look at the header navigation  
**Then** I still see all five primary section links  
**And** if one is missing, that state fails validation for this story

## Technical Notes

- Keep top-level navigation limited to five links.
- Preserve PaperMod header behavior and keyboard focus order.
- Navigation labels should match section names used in PRD.

## Validation

- [ ] All five section links are visible and functional on desktop.
- [ ] All five section links are reachable on mobile without layout breakage.
- [ ] Section labels match PRD naming.
- [ ] User reaches target section in one interaction.

## Assumptions and Open Questions

- Assumes final label is `Family`; PRD asks whether `Family History` may be better.
