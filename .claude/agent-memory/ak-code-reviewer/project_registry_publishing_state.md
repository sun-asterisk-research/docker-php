---
name: project-registry-publishing-state
description: Docker Hub push was dormant since 2023 (secret-name mismatch); GHCR has stale bare alias tags pointing at PHP 7.4
metadata:
  type: project
---

As of 2026-10-26: repo secrets are DOCKERHUB_USERNAME / DOCKERHUB_TOKEN (created 2022-02-23), but workflows up to commit 0491d9e referenced DOCKER_HUB_*, so Docker Hub `sunasteriskrnd/php` was last updated 2023-01-11. The php2shell CI rewrite renames the secrets, re-activating a long-unused token.

GHCR `cli-alpine3.16` was retagged to PHP 7.4.33 by the April 2026 7.4 run (versions_7.4.yml had default_php_version: 7.4); no current target overwrites it.

**Why:** both are invisible from the code and affect whether security rebuilds actually reach users.
**How to apply:** when reviewing CI/publishing changes, check registry-side state (Hub API, GHCR anonymous token tags/list) not just workflow logic.
