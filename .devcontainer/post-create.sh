#!/bin/bash
# Codespace 생성 직후 1회 실행(비대화형). 공통 도구만 미리 깔아 둔다 — 생성 단계의 대기 시간을 활용해
# 이후 설치를 빠르게 한다.
#
# 왜 여기서 워크스페이스를 만들지 않나: post-create는 비대화형이라 인증코드·프로젝트명·에이전트를 물을 수
# 없다(TTY 없음). 그 대화형 설치는 로컬과 똑같은 setup.sh가 한다 — 수강생이 터미널에서 한 줄을 붙여넣어
# 시작하며, 그 명령은 README에 크게 안내한다. (.bashrc 자동 실행은 이미 열린 첫 터미널엔 반영되지 않아
# "첫 터미널은 가만, 새 터미널은 자동"이라는 혼란을 만들기에 쓰지 않는다.)
# 실패해도 Codespace 자체는 뜨도록 set -e를 쓰지 않는다.

SETUP_HOST="https://saas-starter-setup.vercel.app"

echo "▸ 공통 도구 미리 설치 (pnpm·vercel·eas·sentry)"
npm install -g pnpm@10 vercel eas-cli @sentry/cli >/dev/null 2>&1 \
  || echo "⚠ 일부 도구 설치가 덜 됐습니다 — 다음 단계의 setup이 다시 시도하니 그대로 진행하세요."

echo ""
echo "✅ 준비 끝. 터미널(상단 Terminal → New Terminal)에서 아래 한 줄을 붙여넣어 시작하세요:"
echo "   curl -fsSL $SETUP_HOST/setup.sh | bash"
echo "   (인증코드 → 프로젝트명 → 에이전트를 묻고, 생성·로그인·백업·doctor까지 이어집니다.)"
