#!/bin/bash
# Codespace 생성 직후 1회 실행 — 도구 설치와 워크스페이스 생성을 자동으로 끝낸다.
# 실패해도 Codespace 자체는 뜨도록 set -e를 쓰지 않고, 마지막에 상태를 알려준다.

echo "▸ 도구 설치 (pnpm·vercel·eas·Claude Code)"
npm install -g pnpm@10 vercel eas-cli >/dev/null 2>&1 || echo "⚠ npm 전역 설치 일부 실패 — 터미널에서 npm install -g pnpm@10 vercel eas-cli 를 다시 실행하세요."
curl -fsSL https://claude.ai/install.sh | bash >/dev/null 2>&1 || echo "⚠ Claude Code 설치 실패 — 터미널에서 curl -fsSL https://claude.ai/install.sh | bash 를 다시 실행하세요."

echo "▸ 워크스페이스 생성 (my-service)"
if [ -f my-service/workspace.json ]; then
  echo "  이미 생성되어 있어 건너뜁니다."
else
  npx -y create-saas-starter-workspace@latest my-service --agent claude --no-doctor \
    || echo "⚠ 생성 실패 — 터미널에서 npx -y create-saas-starter-workspace@latest my-service 를 다시 실행하세요."
fi

echo ""
echo "✅ 준비 끝. 아래 순서로 시작하세요 (자세한 안내는 README.md):"
echo "   1. 터미널에서: cd my-service"
echo "   2. claude 입력 → 구독 계정으로 로그인"
echo "   3. 로그인 안 된 도구는 pnpm doctor 가 알려줍니다 (vercel login, supabase login)"
