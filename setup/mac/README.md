TODO: 개발환경 셋팅 방법 정리

# etc

- 한글에서 ₩ 대신 ` 사용
  - 아래 명령어 입력 후 재부팅

```bash
$ if ! [ -f ~/Library/KeyBindings/DefaultkeyBinding.dict ]; then mkdir -p ~/Library/KeyBindings && echo '{"₩" = ("insertText:", "\`");}' > ~/Library/KeyBindings/DefaultkeyBinding.dict; fi
```

- 로그인시 Other… 삭제
```
$ sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE
```

- cmd+ctrl+d Dictionary 실행 제거
```
$ defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
```

- 참고: https://lazyren.github.io/devlog/mac-clean-installation.html

---

# mac 프로그램
- [Pock](https://pock.dev): Display macOS Dock in Touch Bar 
- [Notion](https://www.notion.so)
- [Whale](https://whale.naver.com/): 웨일 브라우저
- [리디북스](https://ridibooks.com/?genre=general)
- [Spectacle](https://www.spectacleapp.com)
- [Alfred](https://www.alfredapp.com)
- [Typora](https://typora.io/): 마크다운 에디터

# command-line
- [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
- [exa](https://github.com/ogham/exa): A modern version of ‘ls’
- [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings
- [up](https://github.com/apex/up): Deploy infinitely scalable serverless apps, APIs, and sites in seconds to AWS
- [jq](https://stedolan.github.io/jq/): JSON processor
- [httpie](https://github.com/jakubroztocil/httpie): HTTP client
- [asciinema](https://asciinema.org): terminal session recorder
- [tldr](https://github.com/tldr-pages/tldr): Simplified and community-driven man pages
- [scc](https://github.com/boyter/scc): Sloc, Cloc and Code: scc is a very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go
- [wifi-password](https://github.com/rauchg/wifi-password): Get the password of the wifi you're on (bash)
- [fkill](https://github.com/sindresorhus/fkill-cli): Fabulously kill processes. Cross-platform.

# chrome extension
- [Octotree](https://github.com/ovity/octotree)
- [Pushbullet](https://www.pushbullet.com)
- [video speed controller](https://github.com/igrigorik/videospeed)
- [30 seconds of Knowledge](https://30secondsofknowledge.com)


# 개발환경 설정
- install [spectacle](https://www.spectacleapp.com), [alfred](http://alfredapp.com)
- [본격 macOS에 개발 환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)
- 기존 설정에서 아래 프로그램 or 플러그인 설치
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - neovim
  - SpaceVim 
  - fzf
  - fasd
  - tmux
  - tmuxinator
  	- https://gist.github.com/colmarius/f8c0c824b87db9279222
  - tig
  - thefuck
  - [jq](https://blog.outsider.ne.kr/1202)
  
- 3분의1 개발환경 설정
	- install yarn
	```
  $ brew install yarn
  ```
  - tslint 설정
  ```
  # Install the global CLI and its peer dependency
  $ yarn global add tslint typescript
  # Navigate to to yoursls dynamodb installrces folder
  $ cd path/to/project
  # Lint TypeScript source globs
  $ tslint -c tslint.json 'src/**/*.ts'
  ```
  - serverless 설치
  ```
  # Installing the serverless cli
  $ npm install -g serverless
  $ sls dynamodb install
  ```
  - awscli 설지
  ```
  $ brew install awscli
  ```
  - angular cli 설치
  ```
  $ npm install -g @angular/cli
  ```
  - start serverless
  ```
  $ serverless offline start --migrate
  ```
  - insert dynamodb

```
// insert metadata 
var params = {
    TableName: 'products',
    Item: {
        productId: '1',
        item: 0
    }
};

ppJson(params);
docClient.put(params, function(err, data) {
    if (err) ppJson(err); // an error occurred
    else console.log("PutItem returned successfully");
});
```


### tmux: 여러개의 터미널을 실행할 수 있는 TTY 멀티플렉서 
- [tmux 입문자 시리즈 요약](http://www.haruair.com/blog/2124)
- [Tmux and Vim - even better together](https://blog.bugsnag.com/tmux-and-vim/?utm_source=hackernewsletter&utm_medium=email&utm_term=fav)
- [dotfiles](https://github.com/keeganlow/dotfiles)
