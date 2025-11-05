#!/usr/bin/env bash

# ============================================
# Mac Development Environment Setup Script
# ============================================
# This script sets up a fresh macOS installation with all necessary development tools.
# It's idempotent and safe to run multiple times.

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/dotfiles"

# ============================================
# Helper Functions
# ============================================

print_header() {
    echo ""
    echo -e "${BLUE}============================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}============================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}→ $1${NC}"
}

# ============================================
# Installation Steps
# ============================================

install_xcode_tools() {
    print_header "1. Installing Xcode Command Line Tools"

    if xcode-select -p &>/dev/null; then
        print_success "Xcode Command Line Tools already installed"
    else
        print_info "Installing Xcode Command Line Tools..."
        xcode-select --install
        print_info "Please complete the installation and re-run this script"
        exit 0
    fi
}

install_homebrew() {
    print_header "2. Installing Homebrew"

    if command -v brew &>/dev/null; then
        print_success "Homebrew already installed"
        print_info "Updating Homebrew..."
        brew update
    else
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ $(uname -m) == 'arm64' ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        print_success "Homebrew installed"
    fi
}

install_packages() {
    print_header "3. Installing Packages from Brewfile"

    if [ -f "$DOTFILES_DIR/Brewfile" ]; then
        print_info "Installing packages..."
        brew bundle install --file="$DOTFILES_DIR/Brewfile"
        print_success "All packages installed"
    else
        print_error "Brewfile not found at $DOTFILES_DIR/Brewfile"
        exit 1
    fi
}

install_oh_my_zsh() {
    print_header "4. Installing Oh My Zsh"

    if [ -d "$HOME/.oh-my-zsh" ]; then
        print_success "Oh My Zsh already installed"
    else
        print_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed"
    fi
}

install_zsh_plugins() {
    print_header "5. Installing Zsh Plugins"

    # zsh-syntax-highlighting
    if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        print_success "zsh-syntax-highlighting already installed"
    else
        print_info "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        print_success "zsh-syntax-highlighting installed"
    fi

    # zsh-autosuggestions
    if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        print_success "zsh-autosuggestions already installed"
    else
        print_info "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        print_success "zsh-autosuggestions installed"
    fi
}

install_powerlevel10k() {
    print_header "6. Installing Powerlevel10k Theme"

    if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
        print_success "Powerlevel10k already installed"
    else
        print_info "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
        print_success "Powerlevel10k installed"
    fi
}

install_nvm() {
    print_header "7. Installing NVM (Node Version Manager)"

    if [ -d "$HOME/.nvm" ]; then
        print_success "NVM already installed"
    else
        print_info "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
        print_success "NVM installed"
    fi
}

setup_dotfiles() {
    print_header "8. Setting Up Dotfiles"

    # Backup existing dotfiles
    print_info "Backing up existing dotfiles..."
    BACKUP_DIR="$HOME/.dotfiles.backup.$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"

    for file in .zshrc .p10k.zsh .gitconfig; do
        if [ -f "$HOME/$file" ]; then
            mv "$HOME/$file" "$BACKUP_DIR/"
            print_info "Backed up $file"
        fi
    done

    # Create symlinks
    print_info "Creating symlinks..."
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    ln -sf "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

    # Neovim config
    if [ -d "$HOME/.config/nvim" ]; then
        mv "$HOME/.config/nvim" "$BACKUP_DIR/nvim"
        print_info "Backed up nvim config"
    fi

    mkdir -p "$HOME/.config"
    ln -sf "$DOTFILES_DIR/nvim/config" "$HOME/.config/nvim"

    print_success "Dotfiles symlinked"
    print_info "Backup saved to: $BACKUP_DIR"
}

setup_fzf() {
    print_header "9. Setting Up fzf"

    if [ -f ~/.fzf.zsh ]; then
        print_success "fzf already configured"
    else
        print_info "Installing fzf key bindings and fuzzy completion..."
        $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
        print_success "fzf configured"
    fi
}

apply_macos_defaults() {
    print_header "10. Applying macOS Defaults"

    if [ -f "$DOTFILES_DIR/macos-defaults.sh" ]; then
        print_info "Applying macOS system preferences..."
        bash "$DOTFILES_DIR/macos-defaults.sh"
        print_success "macOS defaults applied"
    else
        print_info "macos-defaults.sh not found, skipping..."
    fi
}

# ============================================
# Main Execution
# ============================================

main() {
    echo ""
    echo -e "${GREEN}🚀 Mac Development Environment Setup${NC}"
    echo -e "${GREEN}======================================${NC}"
    echo ""

    # Check if we're in the dotfiles directory
    if [ ! -f "./install.sh" ]; then
        print_error "Please run this script from the dotfiles directory"
        exit 1
    fi

    # Set DOTFILES_DIR to current directory
    DOTFILES_DIR="$(pwd)"

    install_xcode_tools
    install_homebrew
    install_packages
    install_oh_my_zsh
    install_zsh_plugins
    install_powerlevel10k
    install_nvm
    setup_dotfiles
    setup_fzf
    apply_macos_defaults

    print_header "Installation Complete!"
    echo ""
    print_success "Your Mac development environment is ready!"
    echo ""
    print_info "Next steps:"
    echo "  1. Restart your terminal or run: source ~/.zshrc"
    echo "  2. Configure Powerlevel10k: p10k configure"
    echo "  3. Install Node.js: nvm install --lts"
    echo "  4. Review manual setup steps in README.md"
    echo ""
    print_info "Manual configurations needed:"
    echo "  - Sign in to applications (Warp, Notion, etc.)"
    echo "  - Configure SSH keys for GitHub"
    echo "  - Set up browser extensions"
    echo "  - Configure app-specific settings"
    echo ""
}

main "$@"
