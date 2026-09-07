# Changelog

## v1.0.0 (2026-09-07)

Primeira versão.

- Template do segundo cérebro em PT-BR: manual do agente (`AGENTS.md` = `CLAUDE.md`) com mapa de rotas, `contexto/`, `referencias/`, `decisoes/`, `projetos/`, `fontes/`, `wiki/`, `entrevistas/`, `auditorias/`, `rotinas/`, `arquivo/`.
- Oito skills, iguais para Claude Code e Codex: `iniciar`, `entrevista`, `wiki`, `vincular`, `auditar`, `evoluir`, `rotina`, `cerebro-3d`.
- Instalador `install.sh` (local ou via `curl | bash`), idempotente, com opção `--global`.
- `INSTALAR.md` com instruções que o próprio agente consegue seguir.
- Auditoria com rubrica de 4 pilares (0 a 100), relatório datado e `auditorias/historico.md`.
- Skill `wiki` (método de wiki mantida por LLM) e skill `rotina` (cadência com registro de execuções), que não existiam no kit de origem.
- Cérebro 3D com interface em PT-BR, pastas padrão do kit, sem instalação de dependências para rodar.
