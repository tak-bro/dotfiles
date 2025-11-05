# Mac Development Environment Setup

> 🚀 새 맥북을 30분 안에 완벽한 개발 환경으로 변신시키세요!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS-Monterey%2B-blue)](https://www.apple.com/macos/)

**완벽한 개발 환경 자동 설치** - 한 줄의 명령어로 90+ 개발 도구, 최신 쉘 설정, 에디터, macOS 최적화까지!

---

## 📖 문서

- **[🚀 상세 설치 가이드](SETUP_GUIDE.md)** ← 처음 설치하시나요? 여기서 시작하세요!
- **[📁 README (현재 문서)](#)** - 빠른 개요 및 레퍼런스
- **[🔧 SSH 설정 가이드](ssh/README.md)** - GitHub 멀티 계정 설정
- **[💻 VS Code 설정](vscode/README.md)** - 에디터 설정

---

## ✨ 주요 기능

| 기능 | 설명 |
|------|------|
| 🤖 **완전 자동화** | `./install.sh` 한 줄로 모든 설치 완료 |
| 📦 **90+ 도구** | Homebrew로 관리되는 개발 도구 일괄 설치 |
| 🎨 **아름다운 터미널** | Powerlevel10k 테마와 플러그인으로 생산성 향상 |
| ⚡ **최신 CLI 도구** | fzf, ripgrep, bat, eza 등 모던 툴체인 |
| 🔧 **에디터 설정** | Neovim (LazyVim) 완벽 설정 |
| ⚙️ **macOS 최적화** | 개발자를 위한 시스템 환경설정 자동화 |
| 🔄 **멀티 버전 관리** | NVM (Node), pyenv (Python), jenv (Java) |
| 🔒 **안전한 관리** | 민감 정보 보호, 기존 설정 자동 백업 |
| 🔁 **Idempotent** | 여러 번 실행해도 안전 |

---

## ⚡ 빠른 시작 (5분)

### 필수 요구사항

✅ macOS Monterey (12.0) 이상
✅ Apple ID 로그인
✅ 관리자 권한
✅ 안정적인 인터넷 연결

### 설치 방법

```bash
# 1. 저장소 클론
git clone https://github.com/tak-bro/resources.git ~/dotfiles
cd ~/dotfiles

# 2. 설치 스크립트 실행 (30-60분 소요)
./install.sh

# 3. 터미널 재시작
source ~/.zshrc

# 4. Powerlevel10k 테마 설정
p10k configure

# 5. Node.js 설치
nvm install --lts
```

**완료!** 🎉 이제 개발 환경이 준비되었습니다.

> 💡 **처음 설치하시나요?** 단계별 상세 가이드는 **[SETUP_GUIDE.md](SETUP_GUIDE.md)**를 참고하세요!

---

## 📸 스크린샷

**터미널 (Powerlevel10k + fzf)**
```
┌─[tak@MacBook] - [~/workspace/project] - [main ✓]
└─➤ git status
# 아름다운 git 상태 표시, 자동완성, syntax highlighting
```

**주요 도구들**
- 🔍 **fzf**: `Ctrl+R`로 명령어 히스토리 fuzzy search
- 🎨 **bat**: Syntax highlighting된 `cat` 대체
- 📁 **eza**: 아이콘과 git 상태가 표시되는 `ls` 대체
- 🚀 **ripgrep**: 초고속 코드 검색

---

## 📦 설치되는 도구들

<details>
<summary><b>🔧 개발 도구 전체 목록 (클릭하여 펼치기)</b></summary>

### 버전 관리
- git, git-lfs, git-flow-avh, gh (GitHub CLI)

### 쉘 & 터미널
- zsh, oh-my-zsh, powerlevel10k
- tmux, tmuxinator
- iTerm2, Warp

### 에디터 & IDE
- Neovim (LazyVim)
- Visual Studio Code

### 모던 CLI 도구
- **검색**: fzf, ripgrep, fd
- **뷰어**: bat (cat 대체), eza (ls 대체)
- **문서**: tldr (man 대체)
- **유틸**: jq (JSON), tree, tig (git TUI)

### 언어 & 런타임
- Node.js (via NVM)
- Python (via pyenv)
- Java (via jenv) - OpenJDK 11, 17, 21
- Ruby (via chruby)

### 모바일 개발
- fastlane, cocoapods, ios-deploy
- Android platform tools

### 네트워크 & 도커
- docker, docker-desktop
- httpie, wget, awscurl, ngrok

### 생산성 도구
- Alfred (런처)
- Spectacle (윈도우 관리)
- Karabiner-Elements (키보드 커스터마이징)
- Maccy (클립보드 매니저)
- Hidden Bar (메뉴바 정리)
- Cornercal (캘린더)
- Slack (협업)
- Postman (API 테스트)

### 폰트
- Hack Nerd Font
- Meslo LG Nerd Font

</details>

**총 90+ 패키지 자동 설치!**

---

## 🎯 설치 후 할 일

### 필수 단계

- [ ] **SSH 키 생성 및 GitHub 연동** - [가이드 보기](ssh/README.md)
  ```bash
  ssh-keygen -t ed25519 -C "your_email@example.com"
  pbcopy < ~/.ssh/id_ed25519.pub  # GitHub에 추가
  ```

- [ ] **수동 설치 앱** - Brewfile로 설치 안 되는 앱들
  - Whale, Arc (브라우저)
  - Cursor, IntelliJ IDEA, Android Studio (개발 도구)
  - Figma, Zeplin (디자인)
  - Claude, ChatGPT, Ollama (AI 도구)
  - Notion, KakaoTalk (생산성)

- [ ] **애플리케이션 로그인**
  - Slack, Notion, GitHub, VS Code (Settings Sync)

- [ ] **브라우저 확장 프로그램**
  - Octotree, Video Speed Controller, Pushbullet

### 선택 단계

- [ ] **Karabiner 키보드 설정** - 이미 `karabiner.json` 연결됨
- [ ] **Spectacle 단축키** - 윈도우 관리 (추천: Fullscreen = Cmd+Opt+Enter)
- [ ] **Finder 사이드바** - `workspace` 폴더 추가
- [ ] **Dock 정리** - 자주 쓰는 앱만 남기기

> 📖 **상세 가이드**: [SETUP_GUIDE.md](SETUP_GUIDE.md)의 "3단계: 수동 설정" 참조

---

## 📁 디렉토리 구조

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
├── tmux/
│   ├── .tmux.conf         # Tmux configuration
│   └── .tmux.conf.local   # Tmux local customization
│
├── ssh/
│   ├── config.template    # SSH config template
│   └── README.md          # SSH setup guide
│
├── karabiner/
│   └── karabiner.json     # Keyboard customization
│
├── vscode/
│   └── README.md          # VS Code setup guide
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

### 1. SSH Configuration

See detailed guide in `ssh/README.md`

**Quick setup:**
```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "env.tak@gmail.com"

# Add key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key to clipboard
pbcopy < ~/.ssh/id_ed25519.pub

# Add to GitHub: https://github.com/settings/ssh/new
```

**Multiple GitHub accounts:**
The `~/.ssh/config` template is already created. Update it with your actual key paths.
See `ssh/README.md` for detailed multi-account setup.

### 2. Applications to Install Manually

Some applications cannot be installed via Homebrew and must be installed manually:

**Browsers:**
- [Whale](https://whale.naver.com/) - Naver Whale browser
- [Arc](https://arc.net/) - Modern browser (optional)
- Chrome/Safari - Built-in or from website

**Development Tools:**
- [Cursor](https://cursor.sh/) - AI-powered code editor
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) - Java/Kotlin IDE (or use JetBrains Toolbox)
- [Android Studio](https://developer.android.com/studio) - Android development

**Design & Collaboration:**
- [Figma](https://www.figma.com/) - Design tool
- [Zeplin](https://zeplin.io/) - Design handoff tool

**AI Tools:**
- [Claude](https://claude.ai/) - Anthropic's AI assistant
- [ChatGPT](https://chat.openai.com/) - OpenAI's AI assistant
- [Ollama](https://ollama.ai/) - Run LLMs locally

**Communication & Productivity:**
- [Notion](https://www.notion.so/) - Note-taking (or install from App Store)
- [KakaoTalk](https://www.kakaocorp.com/service/KakaoTalk) - Korean messenger (App Store)

**From Mac App Store:**
- Xcode
- Pages, Numbers, Keynote (if needed)

### 3. Application Sign-ins

After installation, sign in to:
- Warp / iTerm2
- Browsers (Whale, Chrome, Arc)
- Notion
- Slack
- GitHub Desktop (if using)
- VS Code / Cursor (for Settings Sync)

### 4. Browser Extensions

**Chrome/Whale/Arc:**
- [Octotree](https://www.octotree.io/) - GitHub code tree
- [Pushbullet](https://www.pushbullet.com/) - Cross-device notifications
- [Video Speed Controller](https://github.com/igrigorik/videospeed) - Control video playback
- [30 Seconds of Knowledge](https://30secondsofknowledge.com/) - Developer tips on new tab

### 5. Application-Specific Settings

**Spectacle:**
- Configure hotkeys in Preferences
- Recommended: Fullscreen = `Cmd + Option + Enter`

**Cornercal:**
- Add to Login Items (System Preferences → Users & Groups → Login Items)

**Karabiner-Elements:**
- Configuration file is already linked from `karabiner/karabiner.json`
- Open Karabiner-Elements to verify settings
- Customize keyboard mappings as needed

**Finder:**
- Add `workspace` folder to sidebar (drag folder to sidebar)
- Preferences → Sidebar → Select desired locations

**VS Code/Cursor:**
- See `vscode/README.md` for extension setup
- Enable Settings Sync for automatic sync across machines
- Or manually install extensions listed in Brewfile

**tmux:**
- Configuration is already linked
- Customize `~/.tmux.conf.local` for personal preferences
- Based on [gpakosz/.tmux](https://github.com/gpakosz/.tmux)

---

## 🔄 업데이트 & 유지보수

### Dotfiles 업데이트

```bash
cd ~/dotfiles
git pull
./install.sh  # 새로운 패키지/설정 적용
```

### Homebrew 패키지 업데이트

```bash
# 패키지 업데이트
brew update && brew upgrade

# 안 쓰는 패키지 정리
brew cleanup
brew autoremove
```

### Brewfile 동기화

새로 설치한 패키지를 Brewfile에 추가:

```bash
cd ~/dotfiles
brew bundle dump --force  # 현재 시스템 상태로 Brewfile 재생성
git diff Brewfile          # 변경사항 확인
git add Brewfile
git commit -m "chore: update Brewfile"
git push
```

---

## 💡 빠른 참조

### 자주 쓰는 명령어

```bash
# fzf 단축키
Ctrl + R    # 명령어 히스토리 fuzzy search
Ctrl + T    # 파일 fuzzy search
Alt + C     # 디렉토리 fuzzy search

# tmux 단축키
Ctrl + B, % # 수직 분할
Ctrl + B, " # 수평 분할
Ctrl + B, d # 세션 나가기 (detach)
tmux attach # 세션 복귀

# Git aliases (from .gitconfig)
git st      # git status
git co      # git checkout
git br      # git branch
git lg      # git log (pretty format)

# Modern CLI tools
bat <file>      # cat with syntax highlighting
eza -la         # ls with icons and git status
rg <pattern>    # ripgrep - fast search
fd <pattern>    # find alternative
tldr <command>  # simplified man pages
```

### 유용한 팁

**1. 프로젝트별 Node 버전 자동 전환**

프로젝트 루트에 `.nvmrc` 파일 생성:
```bash
echo "20" > .nvmrc
# 디렉토리 이동 시 자동으로 Node 버전 전환
```

**2. tmux 세션 관리**

```bash
# 세션 목록
tmux ls

# 이름을 지정해서 세션 생성
tmux new -s project-name

# 특정 세션에 연결
tmux attach -t project-name

# 세션 종료
tmux kill-session -t project-name
```

**3. fzf로 git branch 전환**

```bash
# .zshrc에 이미 포함된 기능
git checkout $(git branch | fzf)
```

**4. Neovim 플러그인 관리**

```bash
nvim
:Lazy          # 플러그인 매니저 열기
:Lazy update   # 모든 플러그인 업데이트
:checkhealth   # 설정 진단
```

---

## 🎨 커스터마이징

### 로컬 설정 파일

기기별로 다른 설정이 필요한 경우:

**Zsh** (`~/.zshrc.local`)
```bash
# 회사 맥에서만 적용할 설정
export COMPANY_ENV=true
alias work-vpn="sudo openvpn /path/to/config.ovpn"
```

**Git** (`~/.gitconfig.local`)
```bash
[user]
    email = work@company.com
```

이 파일들은 `.gitignore`에 포함되어 커밋되지 않습니다.

### Brewfile 커스터마이징

필요한 패키지만 설치:

```bash
# Brewfile 편집
vim ~/dotfiles/Brewfile

# 특정 카테고리만 설치
brew bundle install --file=~/dotfiles/Brewfile

# 또는 주석 처리된 앱 설치
# Brewfile에서 주석(#) 제거 후
brew bundle install
```

### macOS 기본 설정 변경

`macos-defaults.sh` 편집 후:

```bash
cd ~/dotfiles
./macos-defaults.sh
```

---

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

## 🐛 트러블슈팅

<details>
<summary><b>자주 발생하는 문제 해결 방법</b></summary>

### ❌ Homebrew 설치 실패

```bash
# DNS 변경 후 재시도
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

# Xcode Command Line Tools 확인
xcode-select --install
```

### ❌ Powerlevel10k 아이콘 깨짐

터미널 폰트를 Nerd Font로 변경:
- iTerm2: Preferences → Profiles → Text → Font → "MesloLGS Nerd Font"
- Warp: Settings → Appearance → Font

### ❌ NVM 명령어를 찾을 수 없음

```bash
# NVM 설정 추가
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
source ~/.zshrc
```

### ❌ SSH 키 권한 오류

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 600 ~/.ssh/config
```

### ❌ Karabiner 작동 안 함

1. System Preferences → Privacy & Security
2. Input Monitoring & Accessibility에서 Karabiner 허용
3. Mac 재시작

**더 많은 트러블슈팅**: [SETUP_GUIDE.md - 트러블슈팅 섹션](SETUP_GUIDE.md#트러블슈팅)

</details>

---

---

## ❓ FAQ

<details>
<summary><b>자주 묻는 질문들</b></summary>

**Q: 기존 맥에서도 실행해도 되나요?**
A: 네! 기존 설정은 자동 백업되며, 여러 번 실행해도 안전합니다.

**Q: 일부만 설치하고 싶어요**
A: Brewfile을 편집하거나 `brew install <package>` 명령어로 개별 설치하세요.

**Q: 설정을 되돌리고 싶어요**
A: `~/.dotfiles.backup.YYYYMMDD_HHMMSS/` 백업 폴더에서 복원 가능합니다.

**Q: 회사/개인 맥 설정을 다르게 하려면?**
A: `.zshrc.local`, `.gitconfig.local` 파일 사용 (gitignore됨)

**Q: Apple Silicon (M1/M2/M3) Mac도 지원하나요?**
A: 네! Homebrew가 자동으로 `/opt/homebrew`에 설치되며 PATH도 자동 설정됩니다.

**더 많은 FAQ**: [SETUP_GUIDE.md - FAQ 섹션](SETUP_GUIDE.md#faq)

</details>

---

## 📚 참고 자료

**공식 문서**
- [Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [LazyVim](https://www.lazyvim.org/)

**영감을 받은 Dotfiles**
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) - macOS defaults의 바이블
- [thoughtbot/laptop](https://github.com/thoughtbot/laptop) - 설치 스크립트 베스트 프랙티스

**한국어 가이드**
- [본격 macOS에 개발 환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)

---

## 🤝 기여하기

개인용 dotfiles 저장소이지만, Fork해서 자신만의 dotfiles를 만드세요!

**개선 제안**: [GitHub Issues](https://github.com/tak-bro/resources/issues)

---

## 📄 라이센스

MIT License - 자유롭게 사용, 수정, 배포 가능합니다.

---

## 👨‍💻 만든 사람

**tak-bro**
- GitHub: [@tak-bro](https://github.com/tak-bro)
- Email: env.tak@gmail.com

---

<p align="center">
  Made with ❤️ and ☕
  <br>
  <sub>새 맥북을 받으면 이 README를 열어보세요!</sub>
</p>
