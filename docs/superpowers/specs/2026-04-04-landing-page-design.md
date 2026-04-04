# Landing Page Design Specification
**Date:** 2026-04-04  
**Project:** Instant Reporting  
**Purpose:** Simple, practical landing page for civil engineers to understand the app and sign up

---

## Overview

A single-page landing experience that serves both new visitors (to understand and sign up) and existing users (quick access). The page follows a problem-to-solution flow with a practical, no-nonsense tone. No corporate fluff—just clear value propositions and social proof.

---

## Audience & Goals

**Primary Audience:** New potential customers (civil engineering firms and individual engineers)  
**Secondary Audience:** Existing logged-in users  
**Primary Goal:** Get new users to understand the app's value and sign up  
**Tone:** Practical & straightforward (efficient, task-focused, trustworthy)

---

## Page Structure

### 1. Hero Section
- **Headline:** "Stop Wasting Time on Report Templates"
- **Subheading:** "Generate professional civil engineering reports in minutes, not hours. From template to PDF—streamlined."
- **CTA Button:** "Get Started Free"
- **Visual:** Solid background (dark, professional)
- **Purpose:** Immediate value proposition that resonates with the pain point

### 2. Problem Section
Three visual cards showing the core problems civil engineers face:
- **Repetitive Work** — "Same structure, different data. Hours lost on formatting."
- **Inconsistency** — "Different formats across projects. Quality varies."
- **Time Pressure** — "Client deadlines loom. Less time for actual analysis."
- **Visual Approach:** Icons + text cards in a 3-column grid
- **Purpose:** Validate that we understand their pain

### 3. How It Works
Three-step numbered process:
1. **Choose Template** — "Select from pre-built report templates for your project type."
2. **Fill in Data** — "Enter measurements, observations, and findings in simple forms."
3. **Generate & Share** — "Get a polished PDF ready for clients. Done in minutes."
- **Visual Approach:** Numbered circles + text in a 3-column grid
- **Purpose:** Show simplicity and speed of the workflow

### 4. Key Benefits
Four benefit statements with checkmarks:
- **Consistent Quality** — "Every report follows your standards. No surprises."
- **Save 5+ Hours Per Report** — "Focus on engineering, not formatting."
- **Client-Ready in Minutes** — "Professional formatting built in. Export as PDF."
- **Customizable Templates** — "Adapt templates to your firm's branding and requirements."
- **Visual Approach:** Vertical list with checkmark icons and short descriptions
- **Purpose:** Reinforce value and build confidence

### 5. Testimonials Section
Two customer testimonials with quotes, names, and titles:
- Quote 1: Focus on time savings and team capacity
- Quote 2: Focus on client perception and professionalism
- **Visual Approach:** 2-column card layout with white cards on light background
- **Purpose:** Third-party credibility and proof of results

### 6. Final CTA Section
- **Headline:** "Ready to Save Hours on Reports?"
- **Subheading:** "Start free. No credit card required."
- **Primary CTA:** "Create Free Account"
- **Secondary Link:** "Or watch a 2-minute demo"
- **Visual:** Blue background (contrasting), white text and button
- **Purpose:** Final conversion opportunity with low-friction messaging

---

## Design Principles

- **Practical tone:** Direct language, no marketing jargon
- **Efficient layout:** Information hierarchy is clear; no wasted space
- **Visual hierarchy:** Use color, size, and spacing to guide attention
- **Mobile-responsive:** All sections should work on small screens
- **Accessible:** High contrast, readable fonts, semantic HTML
- **Consistent branding:** Start with neutral palette; apply branding colors later

---

## Content Assets Needed

1. **Hero section:** High-quality background image or illustration (optional but recommended)
2. **Icons:** For problem section (repetitive work, inconsistency, time pressure)
3. **Icons:** For benefits (consistency, time, professionalism, customization)
4. **Real testimonials:** Gather 2+ actual user quotes from early users (names, roles, companies)
5. **Demo video:** 2-minute walkthrough (if promoting the secondary link)

---

## Technical Implementation

- **Framework:** Rails views with HTML/ERB
- **File:** `app/views/pages/home.html.erb`
- **Styling:** Use existing CSS framework (Tailwind/Bootstrap assumed) or custom CSS
- **Responsive:** Mobile-first approach; ensure readability on 375px+ screens
- **CTAs:** "Get Started Free" → Sign up page; "Create Free Account" → Sign up page; Demo link → (TBD)
- **Logged-in users:** Show personalized version (e.g., "Welcome back, [Name]. Start a new report" button)

---

## Success Metrics (For Future)

- **Conversion rate:** % of visitors who sign up
- **Time on page:** How long users engage before deciding
- **CTA click-through:** Which buttons drive most sign-ups
- **Bounce rate:** % who leave without engaging

---

## Out of Scope

- Pricing page (not included)
- Detailed feature breakdown (high-level benefits only)
- Customer case studies (beyond short testimonials)
- Comparison with competitors
- Blog or resources section

---

## Approvals

- **Design:** Approved ✓
- **Structure:** Approved ✓
- **Ready for implementation:** Pending user final review
