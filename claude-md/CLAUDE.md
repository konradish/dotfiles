# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Development Commands

### Testing the Shell Configuration
```bash
# Test the shell setup in a Docker container
./scripts/run_test.sh debian
# Or use any other distro name instead of debian
```

### Setup and Installation
```bash
# Full setup from the scripts directory
cd scripts && ./setup_env.sh

# Individual setup components
./setup_env.sh install_software  # Install basic packages (zsh, git, curl, stow, rclone, neovim, tmux, fzf)
./setup_env.sh install_omz       # Install Oh My Zsh
./setup_env.sh install_plugins   # Install zsh plugins
./setup_env.sh dotfiles          # Clone dotfiles repo
./setup_env.sh unstow            # Stow dotfiles and secrets
./setup_env.sh install_gh        # Install GitHub CLI
```

### Shell Configuration
```bash
# Customize Powerlevel10k prompt
p10k configure
```

## Architecture Overview

This is a personal dotfiles and shell configuration repository with the following structure:

### Core Components
- **scripts/**: Setup automation and utilities
  - `setup_env.sh`: Main setup script with modular functions
  - `run_test.sh`: Docker-based testing environment
  - `pacapt`: Universal package manager wrapper
  - Various utility scripts for specific installations

- **dotfiles/**: Configuration files managed by GNU Stow
  - `zsh/`: Zsh configuration with Oh My Zsh integration
  - `nvim/`: Neovim configuration 
  - `tmux/`: Tmux configuration
  - `gitconfig/`: Git configuration
  - `p10k/`: Powerlevel10k theme configuration
  - `bin/`: Custom scripts and binaries

- **zsh-snap/**: Fast Zsh plugin manager for performance optimization

### Shell Environment
- Uses Oh My Zsh as the base framework with Powerlevel10k theme
- Integrates zsh-snap for faster plugin loading and management
- Includes zsh-autosuggestions and zsh-syntax-highlighting plugins
- Supports both local and containerized testing environments
- Manages secrets separately from public dotfiles

### Package Management
- Uses `pacapt` as a universal package manager wrapper
- Supports multiple Linux distributions through Docker testing
- Automatically installs core development tools (git, curl, neovim, tmux, fzf)

### Configuration Management
- Uses GNU Stow for symlink management of dotfiles
- Separates public dotfiles from private secrets
- Supports backup and restoration of existing configurations
- Integrates with external secrets management via mounted directories

## Environment Details

### System Information
- **Host**: koni9 (Debian 13 bookworm/trixie, bare-metal Linux — migrated off WSL2 September 2026)
- **Kernel**: Linux 6.12.107+deb13-amd64
- **Working Directory**: repos live under `~/src/<name>` (ext4). No `/mnt/c` on this box.

### Available Tools
- **Authentication**: gh (GitHub CLI), wrangler (Cloudflare) - both authenticated
- **Python**: uv/uvx for package management
- **AI Tools**: aider, sgpt, repomix
- **Containers**: docker, `docker compose` (plugin, not standalone `docker-compose`)
- **Utilities**: jq, npx

### Critical Caveats
- **No WSL boundary anymore**: browser control, port access, clipboard, etc. all work directly — no more "can't click links from the terminal" workaround.

## Security Guidelines

### Git Security Checks
Before any git commit or git push command, you MUST perform the following checks:
- Run `git diff --cached` to review the staged changes
- Search the diff for any hardcoded secrets, API keys, client IDs, or private URLs
- Ensure any sensitive data is loaded from gitignored .env files or platform secrets, with only placeholder values in committed .env.example files
- If any secrets are found, you MUST refuse to commit and instead fix the code to load them securely