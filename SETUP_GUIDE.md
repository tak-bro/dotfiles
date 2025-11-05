# 🚀 Mac 개발환경 완벽 설치 가이드

> 새로운 맥북을 개발 환경으로 세팅하는 완벽한 단계별 가이드입니다.

**예상 소요 시간**: 30-60분 (네트워크 속도에 따라 다름)

---

## 📋 목차

1. [시작하기 전에](#시작하기-전에)
2. [1단계: 기본 시스템 설정](#1단계-기본-시스템-설정)
3. [2단계: Dotfiles 설치](#2단계-dotfiles-설치)
4. [3단계: 수동 설정](#3단계-수동-설정)
5. [4단계: 검증 및 테스트](#4단계-검증-및-테스트)
6. [트러블슈팅](#트러블슈팅)
7. [FAQ](#faq)

---

## 시작하기 전에

### ✅ 체크리스트

시작하기 전에 다음 사항을 확인하세요:

- [ ] macOS Monterey (12.0) 이상
- [ ] Apple ID 로그인 완료
- [ ] 관리자 권한 (sudo 가능)
- [ ] 안정적인 인터넷 연결 (최소 1시간 이상 안정적)
- [ ] 최소 10GB 이상의 여유 저장 공간

### 💡 준비물

1. **GitHub 계정** - dotfiles를 clone하기 위해 필요
2. **GitHub Personal Access Token** (선택) - private repo인 경우
3. **백업** - 기존 설정 파일이 있다면 백업 권장

### ⚠️ 주의사항

- **기존 설정 백업**: 이미 사용 중인 맥이라면 기존 `.zshrc`, `.gitconfig` 등이 백업됩니다
- **네트워크**: Homebrew는 수십 GB를 다운로드할 수 있습니다
- **시간**: 첫 설치는 30-60분 정도 소요됩니다
- **재시작**: 일부 설정은 재시작이 필요할 수 있습니다

---

## 1단계: 기본 시스템 설정

### 1.1 macOS 시스템 업데이트

```bash
# 시스템 환경설정에서 소프트웨어 업데이트 확인
# System Preferences → Software Update
```

**중요**: 최신 버전으로 업데이트 후 진행하세요.

### 1.2 Xcode Command Line Tools 설치

터미널을 열고 다음 명령어를 실행:

```bash
xcode-select --install
```

**예상 결과**:
- 팝업 창이 나타나며 설치 확인을 요청합니다
- "Install" 버튼 클릭
- 약 5-10분 소요

**확인 방법**:
```bash
xcode-select -p
# 출력: /Library/Developer/CommandLineTools
```

### 1.3 기본 디렉토리 구조 확인

```bash
# 홈 디렉토리 확인
cd ~
pwd
# 출력: /Users/your-username

# workspace 폴더 생성 (선택)
mkdir -p ~/workspace
```

---

## 2단계: Dotfiles 설치

### 2.1 저장소 클론

```bash
# dotfiles 저장소 클론
git clone https://github.com/tak-bro/resources.git ~/dotfiles

# 디렉토리 이동
cd ~/dotfiles

# 내용 확인
ls -la
```

**예상 출력**:
```
drwxr-xr-x  git/
drwxr-xr-x  nvim/
drwxr-xr-x  zsh/
-rwxr-xr-x  install.sh
-rwxr-xr-x  macos-defaults.sh
-rw-r--r--  Brewfile
-rw-r--r--  README.md
...
```

### 2.2 설치 스크립트 실행

```bash
./install.sh
```

**예상 진행 과정** (30-60분):

```
🚀 Mac Development Environment Setup
======================================

============================================
1. Installing Xcode Command Line Tools
============================================
✓ Xcode Command Line Tools already installed

============================================
2. Installing Homebrew
============================================
→ Installing Homebrew...
✓ Homebrew installed

============================================
3. Installing Packages from Brewfile
============================================
→ Installing packages...
==> Downloading git...
==> Installing git...
[... 수십 개의 패키지 설치 ...]
✓ All packages installed

============================================
4. Installing Oh My Zsh
============================================
→ Installing Oh My Zsh...
✓ Oh My Zsh installed

============================================
5. Installing Zsh Plugins
============================================
→ Installing zsh-syntax-highlighting...
✓ zsh-syntax-highlighting installed
→ Installing zsh-autosuggestions...
✓ zsh-autosuggestions installed

============================================
6. Installing Powerlevel10k Theme
============================================
→ Installing Powerlevel10k...
✓ Powerlevel10k installed

============================================
7. Installing NVM (Node Version Manager)
============================================
→ Installing NVM...
✓ NVM installed

============================================
8. Setting Up Dotfiles
============================================
→ Backing up existing dotfiles...
→ Backed up .zshrc
→ Backed up .gitconfig
→ Creating symlinks...
→ Linked Karabiner config
→ Created SSH config from template
⚠️  Remember to update ~/.ssh/config with your actual SSH keys
✓ Dotfiles symlinked
→ Backup saved to: /Users/tak/.dotfiles.backup.20251105_143000

============================================
9. Setting Up fzf
============================================
→ Installing fzf key bindings and fuzzy completion...
✓ fzf configured

============================================
10. Applying macOS Defaults
============================================
🔧 Configuring macOS System Preferences
========================================
→ Closing System Preferences...
→ Requesting sudo access...
→ Configuring General UI/UX...
✓ General UI/UX configured
→ Configuring Dock...
✓ Dock configured
→ Configuring Finder...
✓ Finder configured
[... 더 많은 설정 ...]
✓ macOS defaults applied

============================================
Installation Complete!
============================================

✅ Your Mac development environment is ready!

→ Next steps:
  1. Restart your terminal or run: source ~/.zshrc
  2. Configure Powerlevel10k: p10k configure
  3. Install Node.js: nvm install --lts
  4. Review manual setup steps in README.md

→ Manual configurations needed:
  - Update ~/.ssh/config with your actual SSH key paths
  - Sign in to applications (Warp, Notion, Slack, etc.)
  - Configure SSH keys for GitHub (see ssh/README.md)
  - Install manual apps: Whale, Arc, Cursor, IntelliJ, Figma, etc.
  - Set up browser extensions
  - Configure Karabiner-Elements keyboard mappings
  - Configure app-specific settings
```

### 2.3 터미널 재시작

**방법 1: 새 터미널 탭 열기**
```bash
# Cmd + T로 새 탭 열기
```

**방법 2: 설정 다시 로드**
```bash
source ~/.zshrc
```

### 2.4 Powerlevel10k 설정

새 터미널을 열면 자동으로 Powerlevel10k 설정 마법사가 실행됩니다:

```bash
p10k configure
```

**설정 질문**:
1. 다이아몬드 보이나요? → `y` (보이면)
2. 잠금 아이콘 보이나요? → `y`
3. Debian 로고 보이나요? → `y`
4. 스타일 선택: `3` (Rainbow)
5. 캐릭터 셋: `1` (Unicode)
6. Prompt 높이: `1` (One line)
7. Prompt 간격: `1` (Compact)
8. 아이콘: `2` (Many icons)
9. Prompt 흐름: `1` (Concise)
10. Transient Prompt: `y` (Yes)
11. Instant Prompt: `1` (Verbose)

**결과**: 화려한 터미널 프롬프트가 나타납니다!

### 2.5 Node.js 설치

```bash
# LTS 버전 설치
nvm install --lts

# 설치된 버전 확인
node --version
# 출력: v22.x.x

npm --version
# 출력: 10.x.x
```

---

## 3단계: 수동 설정

자동으로 설치되지 않는 것들을 수동으로 설정합니다.

### 3.1 SSH 키 생성 및 GitHub 연동

**3.1.1 SSH 키 생성**

```bash
# ED25519 키 생성 (권장)
ssh-keygen -t ed25519 -C "your_email@example.com"

# 프롬프트:
# Enter file in which to save the key: [Enter]
# Enter passphrase: [원하는 비밀번호 입력 또는 Enter로 건너뛰기]
```

**3.1.2 SSH Agent에 키 추가**

```bash
# SSH agent 시작
eval "$(ssh-agent -s)"

# 키 추가
ssh-add ~/.ssh/id_ed25519
```

**3.1.3 공개 키를 GitHub에 추가**

```bash
# 공개 키를 클립보드에 복사
pbcopy < ~/.ssh/id_ed25519.pub

# 또는 직접 확인
cat ~/.ssh/id_ed25519.pub
```

1. https://github.com/settings/ssh/new 접속
2. Title: "MacBook Pro" (또는 식별 가능한 이름)
3. Key: 복사한 공개 키 붙여넣기
4. "Add SSH key" 클릭

**3.1.4 연결 테스트**

```bash
ssh -T git@github.com

# 예상 출력:
# Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

**3.1.5 멀티 GitHub 계정 설정 (선택)**

회사용/개인용 GitHub 계정이 여러 개라면:

```bash
# 회사용 키 생성
ssh-keygen -t ed25519 -C "work@company.com" -f ~/.ssh/id_ed25519_work

# ~/.ssh/config 편집
vim ~/.ssh/config
```

`~/.ssh/config` 내용:
```ssh
# 개인 계정 (기본)
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519

# 회사 계정
Host github.com-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_work
```

**사용 예시**:
```bash
# 개인 저장소 클론
git clone git@github.com:username/repo.git

# 회사 저장소 클론
git clone git@github.com-work:company/repo.git
```

### 3.2 수동 설치 애플리케이션

다음 앱들은 웹사이트에서 직접 다운로드해야 합니다:

#### 브라우저
- **Whale**: https://whale.naver.com/
- **Arc**: https://arc.net/

#### 개발 도구
- **Cursor**: https://cursor.sh/
- **IntelliJ IDEA**: https://www.jetbrains.com/idea/
- **Android Studio**: https://developer.android.com/studio

#### 디자인 & 협업
- **Figma**: https://www.figma.com/downloads/
- **Zeplin**: https://zeplin.io/

#### AI 도구
- **Claude**: https://claude.ai/
- **ChatGPT**: https://chat.openai.com/
- **Ollama**: https://ollama.ai/

#### 커뮤니케이션
- **Notion**: App Store 또는 https://www.notion.so/
- **KakaoTalk**: Mac App Store

### 3.3 애플리케이션 로그인

설치된 앱에 로그인:

- [ ] Slack
- [ ] Notion
- [ ] GitHub (브라우저)
- [ ] VS Code (Settings Sync)
- [ ] Warp / iTerm2 (클라우드 설정이 있다면)

### 3.4 브라우저 확장 프로그램

**Chrome/Whale/Arc에 설치**:

1. **Octotree** - GitHub 코드 트리 뷰
   - https://chrome.google.com/webstore → "Octotree" 검색

2. **Video Speed Controller**
   - 동영상 속도 조절
   - https://github.com/igrigorik/videospeed

3. **Pushbullet** (선택)
   - 기기 간 알림/파일 공유

### 3.5 Karabiner-Elements 설정

키보드 커스터마이징 도구:

```bash
# Karabiner-Elements 실행
open /Applications/Karabiner-Elements.app
```

1. **보안 설정 허용**:
   - System Preferences → Privacy & Security
   - Input Monitoring → Karabiner 허용

2. **설정 확인**:
   - 이미 `karabiner.json`이 연결되어 있습니다
   - Karabiner-Elements에서 "Complex Modifications" 탭 확인

### 3.6 Finder 설정

```bash
# Finder 열기
open ~
```

**사이드바에 추가**:
- `workspace` 폴더를 사이드바로 드래그

**Finder 환경설정** (Cmd + ,):
- General → New Finder windows show: [Home 폴더]
- Sidebar → 원하는 항목 체크
- Advanced → Show all filename extensions 체크

### 3.7 Dock 정리

불필요한 앱 제거 및 자주 쓰는 앱 추가:

```bash
# 자주 쓰는 앱들
- Warp / iTerm2
- VS Code / Cursor
- Whale / Chrome
- Slack
- Notion
- Figma
```

### 3.8 Spectacle 단축키 설정

```bash
# Spectacle 실행
open /Applications/Spectacle.app
```

**권장 단축키**:
- Fullscreen: `Cmd + Option + Enter`
- Left Half: `Cmd + Option + ←`
- Right Half: `Cmd + Option + →`
- Top Half: `Cmd + Option + ↑`
- Bottom Half: `Cmd + Option + ↓`

---

## 4단계: 검증 및 테스트

### 4.1 필수 도구 확인

모든 도구가 제대로 설치되었는지 확인:

```bash
# 버전 확인 스크립트
echo "=== 개발 환경 검증 ==="

echo -n "Git: "
git --version

echo -n "Node: "
node --version

echo -n "npm: "
npm --version

echo -n "Python: "
python3 --version

echo -n "Java: "
java -version 2>&1 | head -1

echo -n "Docker: "
docker --version

echo -n "Neovim: "
nvim --version | head -1

echo -n "tmux: "
tmux -V

echo -n "fzf: "
fzf --version
```

**예상 출력**:
```
=== 개발 환경 검증 ===
Git: git version 2.x.x
Node: v22.x.x
npm: 10.x.x
Python: Python 3.x.x
Java: openjdk version "21.x.x"
Docker: Docker version 25.x.x
Neovim: NVIM v0.10.x
tmux: tmux 3.x
fzf: 0.x.x
```

### 4.2 Zsh 플러그인 테스트

```bash
# 새 터미널 탭에서 테스트

# 1. Syntax highlighting 확인
ls /usr/bin
# 실행 파일이 초록색으로 표시되어야 함

# 2. Auto-suggestions 확인
git s
# 'git status'가 회색으로 자동 완성 제안

# 3. fzf 테스트
Ctrl + R
# 명령어 히스토리 fuzzy search
```

### 4.3 Git 설정 확인

```bash
# Git 사용자 정보 확인
git config --global user.name
git config --global user.email

# 출력:
# tak
# env.tak@gmail.com
```

### 4.4 tmux 테스트

```bash
# tmux 세션 시작
tmux new -s test

# 단축키 테스트:
# Ctrl + B, % : 수직 분할
# Ctrl + B, " : 수평 분할
# Ctrl + B, d : 세션 나가기

# 세션 복귀
tmux attach -t test

# 세션 종료
exit
```

### 4.5 Neovim 테스트

```bash
# Neovim 실행
nvim

# LazyVim 플러그인 확인
# :Lazy 명령어 입력

# 정상 종료
:q
```

---

## 트러블슈팅

### 문제 1: Homebrew 설치 실패

**증상**:
```
curl: (7) Failed to connect to raw.githubusercontent.com
```

**해결책**:
```bash
# DNS 변경 (Google DNS)
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4

# 재시도
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 문제 2: Powerlevel10k 아이콘 깨짐

**증상**: 프롬프트에 �, □ 같은 깨진 문자 표시

**해결책**:
```bash
# Nerd Font 설치 확인
brew list --cask | grep nerd-font

# 터미널 설정에서 폰트 변경
# iTerm2: Preferences → Profiles → Text → Font
# Warp: Settings → Appearance → Font
# 폰트 선택: "MesloLGS Nerd Font" 또는 "Hack Nerd Font"
```

### 문제 3: NVM 명령어를 찾을 수 없음

**증상**:
```bash
nvm: command not found
```

**해결책**:
```bash
# .zshrc에 NVM 설정이 있는지 확인
grep NVM ~/.zshrc

# 없다면 수동 추가
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc

# 설정 다시 로드
source ~/.zshrc
```

### 문제 4: SSH 키 권한 오류

**증상**:
```
Permissions 0644 for '/Users/username/.ssh/id_ed25519' are too open.
```

**해결책**:
```bash
# SSH 디렉토리 및 키 파일 권한 수정
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/config
```

### 문제 5: Karabiner-Elements 작동 안 함

**해결책**:
1. System Preferences → Privacy & Security
2. Input Monitoring → Karabiner 체크
3. Accessibility → Karabiner 체크
4. Mac 재시작

### 문제 6: Brewfile 패키지 설치 실패

**증상**:
```
Error: Cask 'some-app' is unavailable
```

**해결책**:
```bash
# Homebrew 업데이트
brew update

# 특정 패키지만 건너뛰고 나머지 설치
brew bundle install --no-upgrade

# 실패한 패키지 수동 설치
brew install --cask some-app
```

---

## FAQ

### Q1: 기존 맥에서도 실행해도 되나요?

**A**: 네! 스크립트는 idempotent하게 설계되어 여러 번 실행해도 안전합니다. 기존 설정은 자동으로 백업됩니다.

백업 위치: `~/.dotfiles.backup.YYYYMMDD_HHMMSS/`

### Q2: 일부만 설치하고 싶어요

**A**: Brewfile을 수정하거나 수동으로 설치할 수 있습니다:

```bash
# 특정 패키지만 설치
brew install neovim fzf ripgrep

# GUI 앱만 설치
brew install --cask $(grep 'cask "' Brewfile | awk '{print $2}' | tr -d '"')
```

### Q3: 설정을 되돌리고 싶어요

**A**: 백업에서 복원:

```bash
# 백업 디렉토리 찾기
ls -la ~/.dotfiles.backup.*

# 복원
cp ~/.dotfiles.backup.20251105_143000/.zshrc ~/.zshrc
source ~/.zshrc
```

### Q4: 회사 맥과 개인 맥 설정을 다르게 하려면?

**A**: `.local` 파일을 사용:

```bash
# 회사 맥에서만
echo 'export WORK_ENV=true' >> ~/.zshrc.local
echo '[user]
    email = work@company.com' >> ~/.gitconfig.local

# .local 파일은 gitignore되어 커밋되지 않습니다
```

### Q5: Apple Silicon (M1/M2/M3) Mac도 지원하나요?

**A**: 네! Homebrew는 자동으로 `/opt/homebrew`에 설치되며, install.sh가 PATH를 자동 설정합니다.

### Q6: 얼마나 자주 업데이트해야 하나요?

**A**: 권장 주기:

```bash
# 주간 (Homebrew 패키지 업데이트)
brew update && brew upgrade

# 월간 (Brewfile 재생성하여 새 패키지 추가)
cd ~/dotfiles
brew bundle dump --force
git diff Brewfile  # 변경사항 확인
git add Brewfile
git commit -m "chore: update Brewfile"
git push
```

### Q7: 새 도구를 추가하려면?

**A**:

```bash
# 1. 설치
brew install new-tool

# 2. Brewfile에 추가
cd ~/dotfiles
brew bundle dump --force

# 3. 커밋
git add Brewfile
git commit -m "feat: add new-tool"
git push
```

### Q8: 다른 사람과 공유해도 되나요?

**A**: 네! 하지만 먼저:

1. `.gitconfig`의 이메일 변경
2. SSH 키는 각자 생성
3. 개인 정보가 포함된 설정 확인

Fork해서 자신만의 dotfiles를 만드는 것을 추천합니다.

---

## 📞 도움이 필요하신가요?

- **이슈 제보**: [GitHub Issues](https://github.com/tak-bro/resources/issues)
- **문의**: env.tak@gmail.com

---

**마지막 업데이트**: 2025-11-05
**작성자**: tak-bro
