# Story 1.1: Understand the project quickly

**Priority**: Must Have  
**Dependencies**: None  
**Estimated Complexity**: Low  
**INVEST Check**: ✓ Independent, ✓ Negotiable, ✓ Valuable, ✓ Estimable, ✓ Small, ✓ Testable

**As a** first-time visitor  
**I want to** understand what this website is within one short read on the homepage  
**So that** I can decide quickly where to go next without guessing

## Acceptance Criteria

### Scenario 1: Visitor gets project intent in under one minute
**Given** I open `https://piotrstatkiewicz.pl/` for the first time  
**When** I read the first screen of homepage text  
**Then** I can identify that the site is a personal publishing/archive project  
**And** I can see that it includes notes, photos, family writing, work information, and a Małolat reference page

### Scenario 2: Visitor avoids promotional confusion
**Given** I am expecting a typical portfolio site  
**When** I read the homepage introduction  
**Then** I understand this is not a self-promotion portfolio  
**And** I understand the site is designed for long-term readable publishing

### Scenario 3: Homepage text is not overly long
**Given** I am scanning quickly on a mobile phone  
**When** I view the homepage intro block  
**Then** the explanation remains concise enough to read without endless scrolling  
**And** I still get enough context to choose a section confidently

## Technical Notes

- Keep intro readable at 320px width and desktop widths.
- Prefer plain language over niche terms.
- Ensure heading hierarchy is screen-reader friendly.
- Avoid adding custom components for this behavior.

## Validation

- [ ] A first-time reader can restate the site purpose after reading the homepage.
- [ ] The homepage does not present as an unfinished placeholder.
- [ ] The introductory text remains clear on mobile and desktop.
- [ ] The behavior works with default PaperMod rendering.

## Assumptions and Open Questions

- Assumes homepage should stay timeless rather than show recent updates.
- Open question from PRD: whether homepage should eventually include recent updates.
