# SSH Configuration

## Setup

1. **Generate SSH key** (if you don't have one):
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

2. **Copy the config template**:
   ```bash
   cp ~/dotfiles/ssh/config.template ~/.ssh/config
   chmod 600 ~/.ssh/config
   ```

3. **Add your public key to GitHub**:
   ```bash
   # Copy public key to clipboard
   pbcopy < ~/.ssh/id_ed25519.pub

   # Then add it at: https://github.com/settings/ssh/new
   ```

4. **Test the connection**:
   ```bash
   ssh -T git@github.com
   ```

## Multiple GitHub Accounts

If you have multiple GitHub accounts (work/personal), update `~/.ssh/config`:

```ssh
Host github.com-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_work

Host github.com-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal
```

Then clone repos using the host alias:
```bash
git clone git@github.com-work:company/repo.git
git clone git@github.com-personal:username/repo.git
```

## Security Notes

- **NEVER** commit private keys (`id_ed25519`, `id_rsa`, etc.)
- Only commit the config template
- Keep your `~/.ssh/` directory permissions at `700`
- Keep individual key files at `600`
