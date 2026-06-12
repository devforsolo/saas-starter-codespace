# 브라우저로 개발 환경 만들기 (Codespaces)

회사 노트북의 보안 정책 등으로 **내 컴퓨터에 설치가 불가능한 분들을 위한 비상 경로**입니다. 설치가 가능하다면 강의의 한 줄 설치 명령(macOS/Windows)을 쓰는 것이 기본입니다 — 그쪽이 내 컴퓨터에 모든 것이 남아 다루기 쉽습니다.

## 시작하기

1. GitHub에 로그인한 상태에서, 이 페이지 위쪽의 **Code → Codespaces → Create codespace on main**을 누릅니다.
2. 몇 분 기다리면 브라우저에 VS Code 화면이 뜨고, 자동으로 도구 설치와 `my-service` 워크스페이스 생성이 진행됩니다(아래 터미널 창에 진행 상황이 보입니다).
3. 끝나면 터미널에 이렇게 입력합니다:
   ```
   cd my-service
   claude
   ```
4. Claude Code에 구독 계정으로 로그인한 뒤, "START-HERE.md 읽고 시작하자"라고 말하면 됩니다.
5. 환경 상태가 궁금하면 `pnpm doctor` — 로그인이 덜 된 도구(vercel, supabase)를 짚어 줍니다.

## 알아둘 것

- 프로젝트 폴더 이름은 `my-service`로 만들어집니다. 바꾸고 싶으면 에이전트에게 부탁하세요.
- GitHub 무료 계정은 Codespaces를 월 120 코어시간(2코어 머신 기준 60시간)까지 무료로 쓸 수 있습니다. 쓰지 않을 때는 Codespace를 Stop 해 두세요.
- 이 레포 자체에는 코드가 거의 없습니다 — Codespace를 만들 때 환경을 꾸며 주는 설정(`.devcontainer/`)만 있습니다.
