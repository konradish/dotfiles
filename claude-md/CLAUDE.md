# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Environment Details

### System Information
- **Host**: koni9 (Debian 13 trixie, bare-metal Linux, not WSL)
- **Working Directory**: repos live under `~/src/<name>` (ext4). No `/mnt/c` on this box.

### Available Tools
- **Containers**: `docker compose` (plugin, not standalone `docker-compose`)

## Security Guidelines

### Git Security Checks
Before committing or pushing, review `git diff --cached` for hardcoded secrets, API keys, client IDs, or private URLs. Sensitive values load from gitignored `.env` files or platform secrets; committed `.env.example` files hold placeholders only. If a secret is staged, don't commit — fix the code to load it securely first.
