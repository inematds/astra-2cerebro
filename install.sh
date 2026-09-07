#!/usr/bin/env bash
# astra-2cerebro: instalador
#
# Uso:
#   bash install.sh [pasta-destino] [--global] [--so-skills]
#   curl -fsSL https://raw.githubusercontent.com/inematds/astra-2cerebro/main/install.sh | bash -s -- ~/meu-cerebro
#
# - Cria a estrutura do segundo cérebro em <pasta-destino> (padrão: pasta atual) sem
#   sobrescrever nada que já exista.
# - Instala as skills em <destino>/.claude/skills e <destino>/.agents/skills (atualiza as do kit).
# - --global: instala as skills também em ~/.claude/skills e ~/.agents/skills.
# - --so-skills: só atualiza as skills.

set -euo pipefail

REPO_TARBALL="https://github.com/inematds/astra-2cerebro/archive/refs/heads/main.tar.gz"
REPO_GIT="https://github.com/inematds/astra-2cerebro.git"

DESTINO=""
GLOBAL=0
SO_SKILLS=0

for arg in "$@"; do
  case "$arg" in
    --global) GLOBAL=1 ;;
    --so-skills) SO_SKILLS=1 ;;
    --ajuda|--help|-h)
      sed -n '2,14p' "$0" 2>/dev/null || true
      echo "Uso: bash install.sh [pasta-destino] [--global] [--so-skills]"
      exit 0 ;;
    -*) echo "Opção desconhecida: $arg" >&2; exit 1 ;;
    *) DESTINO="$arg" ;;
  esac
done

DESTINO="${DESTINO:-$PWD}"
mkdir -p "$DESTINO"
DESTINO="$(cd "$DESTINO" && pwd)"

# Localiza o kit: ao lado deste script, ou baixa.
KIT=""
TMP=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  candidato="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [ -d "$candidato/template" ] && [ -d "$candidato/skills" ]; then
    KIT="$candidato"
  fi
fi
if [ -z "$KIT" ]; then
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  echo "Baixando o kit..."
  if command -v git >/dev/null 2>&1; then
    git clone --quiet --depth 1 "$REPO_GIT" "$TMP/kit"
    KIT="$TMP/kit"
  elif command -v curl >/dev/null 2>&1 && command -v tar >/dev/null 2>&1; then
    curl -fsSL "$REPO_TARBALL" | tar -xz -C "$TMP"
    KIT="$(find "$TMP" -maxdepth 1 -mindepth 1 -type d | head -n 1)"
  else
    echo "Preciso de git, ou de curl + tar, para baixar o kit." >&2
    exit 1
  fi
fi

if [ "$KIT" = "$DESTINO" ]; then
  echo "A pasta de destino é o próprio kit. Escolha outra pasta para o seu cérebro." >&2
  exit 1
fi

VERSAO="$(cat "$KIT/VERSION" 2>/dev/null || echo "?")"
echo "astra-2cerebro v$VERSAO"
echo "Destino: $DESTINO"

criados=0
pulados=0
if [ "$SO_SKILLS" -eq 0 ]; then
  echo
  echo "Estrutura do cérebro:"
  while IFS= read -r -d '' src; do
    rel="${src#"$KIT/template/"}"
    alvo="$DESTINO/$rel"
    if [ -e "$alvo" ]; then
      pulados=$((pulados + 1))
    else
      mkdir -p "$(dirname "$alvo")"
      cp -p "$src" "$alvo"
      criados=$((criados + 1))
      echo "  + $rel"
    fi
  done < <(find "$KIT/template" -type f -print0 | sort -z)
  echo "  $criados arquivos criados, $pulados já existiam (mantidos)."
fi

instalar_skills() {
  local base="$1"
  local n=0
  for dir in "$KIT"/skills/*/; do
    [ -d "$dir" ] || continue
    local nome
    nome="$(basename "$dir")"
    mkdir -p "$base"
    rm -rf "${base:?}/$nome"
    cp -R "$dir" "$base/$nome"
    rm -rf "$base/$nome/node_modules"
    n=$((n + 1))
  done
  echo "  $n skills em $base"
}

echo
echo "Skills:"
instalar_skills "$DESTINO/.claude/skills"
instalar_skills "$DESTINO/.agents/skills"
if [ "$GLOBAL" -eq 1 ]; then
  echo "  (--global substitui skills de mesmo nome já existentes nas pastas globais)"
  instalar_skills "$HOME/.claude/skills"
  instalar_skills "$HOME/.agents/skills"
fi

# Confere.
for f in AGENTS.md CLAUDE.md .claude/skills/iniciar/SKILL.md .agents/skills/iniciar/SKILL.md; do
  if [ "$SO_SKILLS" -eq 1 ] && [[ "$f" != .*/skills/* ]]; then continue; fi
  if [ ! -f "$DESTINO/$f" ]; then
    echo "ERRO: esperava $DESTINO/$f e não encontrei." >&2
    exit 1
  fi
done

echo
echo "Pronto. Próximos passos:"
echo "  1. Abra a pasta no Claude Code ou no Codex:  cd \"$DESTINO\""
echo "  2. Rode /iniciar (Claude Code) ou \$iniciar (Codex) e responda as 7 perguntas."
echo "  3. Leia COMO-USAR.md quando quiser o mapa completo."
