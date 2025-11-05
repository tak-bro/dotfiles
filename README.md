# Mac Development Environment Setup

> Personal development environment configuration for macOS - Automated setup for a fresh Mac

## ✨ Features

- **Automated Installation**: One-command setup with `install.sh`
- **Comprehensive Package Management**: 80+ development tools via Homebrew
- **Modern Shell Configuration**: Zsh with Oh My Zsh, Powerlevel10k, and custom plugins
- **Editor Setup**: Neovim with LazyVim configuration
- **macOS Defaults**: Sensible system preferences for developers
- **Version Managers**: NVM (Node), pyenv (Python), jenv (Java)
- **Modern CLI Tools**: fzf, ripgrep, bat, eza, and more
- **Idempotent**: Safe to run multiple times

## 🚀 Quick Start

### Prerequisites

- macOS Monterey (12.0) or later
- Apple ID signed in (for Mac App Store apps)
- Admin access

### Installation

1. **Clone this repository**

```bash
git clone https://github.com/tak-bro/resources.git ~/dotfiles
cd ~/dotfiles
```

2. **Run the installation script**

```bash
./install.sh
```

3. **Restart your terminal**

```bash
source ~/.zshrc
```

4. **Configure Powerlevel10k theme**

```bash
p10k configure
```

5. **Install Node.js LTS**

```bash
nvm install --lts
nvm use --lts
```

That's it! Your Mac is now set up with a complete development environment.

## 📁 Structure

```
dotfiles/
├── install.sh              # Main installation script
├── macos-defaults.sh       # macOS system preferences
├── Brewfile                # Homebrew packages (90+ tools)
│
├── zsh/
│   ├── .zshrc             # Zsh configuration
│   └── .p10k.zsh          # Powerlevel10k theme config
│
├── git/
│   └── .gitconfig         # Git configuration
│
├── nvim/
│   └── config/            # Neovim (LazyVim) configuration
│
├── bin/                   # Custom scripts (optional)
│
└── archive/               # Old reference materials
```

## 🛠️ What Gets Installed

### Development Tools

**Version Control**
- git, git-lfs, git-flow-avh, gh (GitHub CLI)

**Shell & Terminal**
- zsh, oh-my-zsh, powerlevel10k
- tmux, tmuxinator

**Editors**
- Neovim (LazyVim configuration)

**Modern CLI Tools**
- fzf (fuzzy finder)
- ripgrep (fast grep)
- fd (fast find)
- bat (cat with syntax highlighting)
- eza (modern ls)
- tldr (simplified man pages)
- jq (JSON processor)
- tig (git text interface)

**Languages & Version Managers**
- Node.js (via NVM)
- Python (via pyenv)
- Java (via jenv)
- Ruby (via chruby)

**Mobile Development**
- fastlane, cocoapods, ios-deploy
- Android platform tools

**Other Tools**
- docker, docker-desktop
- watchman, pre-commit
- httpie, wget, awscurl

### GUI Applications

- **Terminal**: Warp
- **Window Management**: Spectacle
- **Clipboard Manager**: Maccy
- **Database**: DBeaver Community
- **Utilities**: Cornercal, OpenInTerminal Lite, Ngrok

### Fonts

- Hack Nerd Font
- Meslo LG Nerd Font

## 🎨 Customization

### Local Configuration

Create machine-specific configurations without modifying the repository:

**Zsh**
```bash
# ~/.zshrc.local
export CUSTOM_VAR="value"
alias myalias="command"
```

**Git**
```bash
# ~/.gitconfig.local
[user]
    email = work@example.com
```

The main config files will automatically load these `.local` files if they exist.

### Adding More Packages

Edit `Brewfile` and run:

```bash
brew bundle install --file=~/dotfiles/Brewfile
```

To update Brewfile from current system:

```bash
cd ~/dotfiles
brew bundle dump --force
```

## 🔧 Manual Setup Steps

Some things can't be automated and require manual configuration:

### 1. SSH Keys for GitHub

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "env.tak@gmail.com"

# Start ssh-agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

# Add to GitHub: https://github.com/settings/ssh/new
```

### 2. Application Sign-ins

- Warp / iTerm2
- Browser (Whale, Chrome)
- Notion
- macOS App Store apps

### 3. Browser Extensions

**Chrome/Whale**
- Octotree (GitHub code tree)
- Pushbullet
- Video Speed Controller
- 30 Seconds of Knowledge

### 4. Application-Specific Settings

- **Spectacle**: Configure hotkeys
  - Fullscreen: `Cmd + Option + Enter`
- **Cornercal**: Add to Login Items
- **Finder**: Add `workspace` folder to sidebar
- **VS Code**: Install extensions, sync settings

## 🔄 Updating

To pull the latest changes and re-apply:

```bash
cd ~/dotfiles
git pull
./install.sh
```

## 📝 macOS System Preferences

The `macos-defaults.sh` script configures:

### Dock
- Auto-hide enabled
- No recent applications
- Icon size: 36px

### Finder
- Show path bar and status bar
- Show hidden files and extensions
- List view by default
- No .DS_Store on network/USB

### Keyboard & Input
- Fast key repeat
- ₩ (Won sign) → ` (backtick) mapping
- Disable Cmd+Ctrl+D dictionary popup
- Disable auto-correct and smart quotes

### Screenshots
- Location: `~/Pictures/Screenshots`
- Format: PNG
- No shadows

### Other
- Hide "Other" user on login screen
- Battery percentage in menu bar
- Tap to click on trackpad

Run manually: `./macos-defaults.sh`

## 🧪 Testing

To test the setup on a fresh Mac:

1. Create a new macOS VM (Parallels, UTM, etc.)
2. Clone this repository
3. Run `./install.sh`
4. Verify all tools are installed correctly

## 🐛 Troubleshooting

### Homebrew Installation Fails

```bash
# Check if Xcode Command Line Tools are installed
xcode-select -p

# If not, install manually
xcode-select --install
```

### Symlinks Not Working

```bash
# Check if dotfiles exist
ls -la ~/

# Re-run install script
cd ~/dotfiles && ./install.sh
```

### Powerlevel10k Not Loading

```bash
# Re-configure
p10k configure

# Or reinstall
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Neovim Issues

```bash
# Check Neovim config
nvim --version
nvim +checkhealth

# Reinstall LazyVim
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

## 📚 References

- [Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [LazyVim](https://www.lazyvim.org/)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [본격 macOS에 개발 환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)

## 🤝 Contributing

This is a personal dotfiles repository, but feel free to fork and adapt for your own use!

## 📄 License

MIT

---

**Author**: tak-bro
**Email**: env.tak@gmail.com
**GitHub**: [@tak-bro](https://github.com/tak-bro)
