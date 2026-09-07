#!/usr/bin/env bash
# Sincroniza as skills canônicas (.claude/skills) para o espelho do Codex (.agents/skills).
#
# Rode depois de criar ou editar qualquer skill em .claude/skills/ para o Codex ver o mesmo
# conteúdo. As cópias são idênticas (as skills usam caminhos relativos aos próprios arquivos).
# Passe nomes de skills para sincronizar só essas; sem argumentos, sincroniza todas.
#
# O script nunca apaga. Se uma skill foi aposentada em .claude/skills, ele avisa para você
# mover a cópia antiga de .agents/skills para arquivo/ à mão.

set -euo pipefail
cd "$(dirname "$0")/.."

ORIGEM=".claude/skills"
DESTINO=".agents/skills"
mkdir -p "$DESTINO"
total=0

if [ "$#" -gt 0 ]; then
  nomes=("$@")
else
  nomes=()
  for d in "$ORIGEM"/*/; do
    [ -d "$d" ] && nomes+=("$(basename "$d")")
  done
fi

for nome in "${nomes[@]}"; do
  if [ ! -d "$ORIGEM/$nome" ]; then
    echo "ERRO: skill não encontrada em $ORIGEM/$nome" >&2
    exit 1
  fi
  rm -rf "$DESTINO/$nome"
  cp -R "$ORIGEM/$nome" "$DESTINO/$nome"
  rm -rf "$DESTINO/$nome/node_modules"
  total=$((total + 1))
done
echo "Sincronizadas $total skills: $ORIGEM -> $DESTINO"

if [ "$#" -eq 0 ]; then
  for d in "$DESTINO"/*/; do
    [ -d "$d" ] || continue
    nome="$(basename "$d")"
    if [ ! -d "$ORIGEM/$nome" ]; then
      echo "AVISO: $DESTINO/$nome não tem origem em $ORIGEM. Se foi aposentada, mova para arquivo/ à mão."
    fi
  done
fi
