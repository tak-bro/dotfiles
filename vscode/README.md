# VS Code / Cursor Configuration

## VS Code Extensions

Install extensions listed in the Brewfile:
```bash
code --list-extensions  # List current extensions
```

To install extensions:
```bash
# From Brewfile
brew bundle install
```

## Manual Setup

### Settings Sync (Recommended)

VS Code has built-in Settings Sync:
1. Open VS Code
2. Press `Cmd+Shift+P`
3. Type "Settings Sync: Turn On"
4. Sign in with GitHub or Microsoft account
5. Select what to sync (settings, keybindings, extensions, etc.)

### Manual Configuration

If you prefer manual configuration:

1. **Export current settings**:
   ```bash
   # Backup your current VS Code settings
   cp ~/Library/Application\ Support/Code/User/settings.json ~/dotfiles/vscode/settings.json
   cp ~/Library/Application\ Support/Code/User/keybindings.json ~/dotfiles/vscode/keybindings.json
   ```

2. **Restore settings**:
   ```bash
   # Copy settings to VS Code
   cp ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
   cp ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
   ```

## Cursor

Cursor uses similar configuration structure. If you use Cursor:

```bash
# Export Cursor settings
cp ~/Library/Application\ Support/Cursor/User/settings.json ~/dotfiles/vscode/cursor-settings.json

# Restore
cp ~/dotfiles/vscode/cursor-settings.json ~/Library/Application\ Support/Cursor/User/settings.json
```

## Recommended Extensions

Already included in Brewfile:
- `vscodevim.vim` - Vim keybindings
- `amazonwebservices.codewhisperer-for-command-line-companion` - AWS CodeWhisperer

Additional recommended extensions (install manually):
- ESLint
- Prettier
- GitLens
- Docker
- Remote - SSH
- Live Share
- GitHub Copilot (if subscribed)

Install all at once:
```bash
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vsliveshare.vsliveshare
```
