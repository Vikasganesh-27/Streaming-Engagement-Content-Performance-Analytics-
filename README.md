## Project Overview

Music streaming platforms generate massive volumes of data, but raw stream counts alone are a weak signal. They don’t explain why content performs, how users engage, or which promotional channels actually work.
This project builds an end-to-end analytics framework using Spotify-style data to transform fragmented listening, user, content, and exposure data into decision-ready business intelligence.
The focus is not reporting.
The focus is measuring engagement quality, content efficiency, and platform effectiveness.

## Business Problem

Streaming data is typically fragmented across:
1. Listening events
2. User demographics
3. Track and artist metadata
4. Platform exposure sources (playlists, charts, third-party platforms)

Without a structured data model and defensible KPIs, stakeholders cannot answer:

1. Which tracks drive sustained engagement — not just clicks?
2. Do playlists and charts translate into real listening value?
3. How does user behavior differ by country, device, or subscription type?
4. Which audio characteristics correlate with better performance?

### The problem isn’t lack of data.
### The problem is lack of structure, clarity, and decision-ready metrics.
This project fixes that.

## Objectives

The project was designed to answer three core questions:
### 1. Which tracks and artists perform best when engagement quality is considered, not just streams?
### 2. How do users interact with the platform across sessions, devices, and subscription types?
### 3. Which exposure channels deliver the highest return relative to streams generated?

## Success Criteria

The project is successful if it delivers:

### ✅ Analytics-ready data model (fact & dimension tables)
### ✅ Clear, explainable KPIs aligned to business decisions
### ✅ Actionable insights, not descriptive statistics
### ✅ Stakeholder-friendly Power BI dashboard
### ✅ End-to-end ownership (Python → SQL → BI)

## Data & Scope
## Dataset

- Synthetic but realistic Spotify-style data
- Designed for relational analysis, not flat-file reporting

## Data Model (Star Schema)
### Dimension Tables
1. DimArtist: artist metadata
2. DimTrack: release data + detailed audio features
3. DimUser: demographics, subscription attributes

### Fact Tables
1. FactListeningEvents: timestamp-level user listening behavior
2. FactStreams: aggregated streams and exposure across platforms

## Scope of Analysis

Included:
1. Track & artist performance
2. User engagement & session behavior
3. Playlist and chart exposure
4. Cross-platform performance
5. Audio feature correlations

Explicitly excluded:
1. Revenue and licensing
2. Churn or pricing models
3. Real-time recommendation systems
4. Marketing spend attribution

These exclusions are intentional boundaries — not weaknesses.

## Tools & Architecture

This project follows a clear, production-style analytics flow.
1. Python (Pandas) was used to clean and normalize raw streaming data, handle duplicates and missing values, and model the data into fact and dimension tables.
2. SQL Server was used to join datasets, define KPIs, and compute aggregations in a transparent and auditable way.
3. Power BI was used as the stakeholder layer, where KPIs and trends are visualized and explored interactively to support content, marketing, and product decisions.
Each tool serves a single purpose: Python ensures data integrity, SQL defines business logic, and Power BI enables decision-making.

### Separation of concerns was enforced:
1. Python = data integrity
2. SQL = business logic
3. Power BI = decision interface

Anything else creates technical debt.

## Key Metrics
### Content Performance
1. Total Streams (baseline popularity)
2. Streams by Release Year (longevity vs recency)

### Engagement & Quality
1. Engagement Score (listening depth, completion, session behavior)
2. Stream Efficiency Score (streams ÷ exposure)

### Exposure & Platform ROI
1. Playlist Exposure
2. Chart Exposure
3. Platform ROI by track

### User Behavior
1. Active users
2. Session length
3. Completion rate
4. Listening time per user
5. Device usage

Metrics were intentionally layered:
Popularity → Engagement → Efficiency

## Key Insights

### Content Performance
1. High-stream tracks don’t always mean high engagement.
2. Playlist exposure correlates more strongly with streams than chart exposure.
3. Some tracks convert low exposure into high engagement — strong organic performance.
4. Audio features (energy, valence, danceability) align with higher engagement.

### User Behavior
1. Engagement is concentrated: ~10% of users drive meaningful activity.
2. Average session length is short (~5 minutes).
3. Completion rate is low (~21%), signaling optimization opportunities.
4. Mobile dominates listening behavior.

### Platform ROI
1. Playlists outperform charts as a promotional lever.
2. Certain tracks generate strong returns relative to exposure.

### Actionable Recommendations
1. Prioritize playlists over charts for promotion.
2. Target Free-tier and moderately active users for retention.
3. Leverage audio features in recommendation and content strategy.
4. Improve completion rates via sequencing and personalization.
5. Design mobile-first engagement strategies.

## Dashboard Structure
### Overview
- Platform scale and audience distribution

### Content Performance
Engagement quality and promotional efficiency

### User Behavior
Session dynamics and retention signals

Each section supports specific business decisions, not passive reporting.

## Limitations

1. Snapshot data (not real-time)
2. Exposure ≠ guaranteed listens
3. Binary completion simplifies behavior
4. Correlation only — no causal claims

These are acknowledged explicitly to prevent misinterpretation.

## Why This Project Matters
This project demonstrates the ability to:
1. Design scalable analytics models
2. Define defensible KPIs
3. Translate raw data into business decisions
4. Own the full analytics lifecycle

It’s not about dashboards.
It’s about decision intelligence.
