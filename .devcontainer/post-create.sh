#!/bin/bash
# Codespace 생성 직후 1회 실행(비대화형). 여기서는 무거운 작업을 하지 않는다 —
# 도구 설치·워크스페이스 생성·로그인·백업·doctor는 모두 수강생이 터미널에서 setup.sh로 진행한다(README 참고).
#
# 왜 도구를 미리 안 까나: 예전엔 여기서 공통 도구를 미리 설치했는데, 그 설치가 수 분간 돌면서
# (1) 완료 시 VS Code가 이 '생성 로그' 터미널로 포커스를 가로채 수강생이 setup을 시작한 터미널에서
# 튕겨 나가는 혼란을 만들고, (2) setup.sh의 설치와 동시에 돌면 npm 전역 설치가 충돌할 수 있어 제거했다.
# 설치는 setup.sh가 일괄로 한다. devcontainer가 이미 node·git·gh를 제공하므로 그것으로 충분하다.

echo "✅ 준비 끝. 터미널(상단 Terminal → New Terminal)에서 아래 한 줄을 붙여넣어 시작하세요:"
echo "   curl -fsSL https://saas-starter-setup.vercel.app/setup.sh | bash"
