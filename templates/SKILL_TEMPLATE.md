---
name: skill-name
description: >
  One or two sentences describing what this skill does and when Claude should use it.
  Be specific about trigger phrases and use cases. This text is what Claude reads to
  decide whether to invoke this skill, so make it precise.
---

# Skill Name

Brief one-paragraph description of what this skill does and the problem it solves.

## Overview

Explain the skill's approach at a high level. What data does it gather? What frameworks
does it apply? What does the output look like?

## Core Workflow

### Step 1: [First step name]

Describe what Claude should do in this step. Be explicit:
- What to search for (if using WebSearch)
- What to read (if loading reference files from assets/)
- What to calculate or analyze
- What decision to make

### Step 2: [Second step name]

...

### Step N: Generate Output

Describe the final output format. Save as a file or present inline?

**Output format:**

```
EXAMPLE OUTPUT
Key metric: value
Recommendation: ...
```

## Guidelines

### What this skill does
- ✓ List what it handles well

### What this skill does NOT do
- ✗ Be explicit about limitations

## Resources

- **assets/filename.md** — description of what this reference file contains
