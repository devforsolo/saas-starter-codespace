#!/bin/bash
# Codespace 생성 직후 1회 실행(비대화형). 두 가지만 한다:
#   1) 공통 도구(pnpm·vercel·eas·sentry)를 미리 설치 — 생성 단계의 대기 시간을 활용한다.
#   2) 첫 인터랙티브 터미널에서 강의 설치(intake)가 자동 시작되도록 ~/.bashrc에 1회 훅을 심는다.
#
# 왜 여기서 직접 워크스페이스를 만들지 않나: post-create는 비대화형이라 인증코드·프로젝트명·에이전트
# 선택을 물을 수 없다(TTY 없음). 그 대화형 흐름은 로컬과 똑같은 setup.sh가 터미널에서 진행한다 —
# intake가 한 벌이라 로컬·코드스페이스가 동일한 경험이 된다.
# 실패해도 Codespace 자체는 뜨도록 set -e를 쓰지 않는다.

SETUP_HOST="https://saas-starter-setup.vercel.app"

echo "▸ 공통 도구 미리 설치 (pnpm·vercel·eas·sentry)"
npm install -g pnpm@10 vercel eas-cli @sentry/cli >/dev/null 2>&1 \
  || echo "⚠ 일부 도구 설치가 덜 됐습니다 — 다음 단계의 setup이 다시 시도하니 그대로 진행하세요."

# 첫 인터랙티브 터미널에서 setup.sh를 1회 자동 실행한다. setup.sh가 인증코드·프로젝트명·에이전트를 묻고
# 워크스페이스 생성·서비스 로그인·GitHub 백업·doctor까지 로컬과 동일하게 진행한다.
# 가드: 인터랙티브 셸일 때만([ -t 1 ]) · 아직 시작 안 했을 때만(sentinel). sentinel을 먼저 만들어
# 설치 도중 두 번째 터미널을 열어도 재실행되지 않게 한다.
cat >> "$HOME/.bashrc" <<HOOK

# saas-starter: 첫 터미널에서 강의 설치(intake)를 1회 자동 시작
if [ -t 1 ] && [ ! -e "$HOME/.config/saas-setup-started" ]; then
  mkdir -p "$HOME/.config" && touch "$HOME/.config/saas-setup-started"
  echo ""
  echo "▸ 강의 개발환경 설치를 시작합니다 (인증코드 → 프로젝트명 → 에이전트 순서로 묻습니다)."
  curl -fsSL $SETUP_HOST/setup.sh | bash
fi
HOOK

echo ""
echo "✅ 준비 끝. 상단 메뉴 Terminal → New Terminal 로 터미널을 열면 설치가 자동으로 시작됩니다."
echo "   자동으로 안 뜨면 직접 실행하세요: curl -fsSL $SETUP_HOST/setup.sh | bash"
