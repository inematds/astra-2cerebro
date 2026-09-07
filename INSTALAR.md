# Instalar o astra-2cerebro

Este arquivo serve para duas leituras: a sua, e a do seu agente (Claude Code ou Codex). Se você colou a URL do repositório no agente e pediu para instalar, ele deve seguir a seção **"Instruções para o agente"** abaixo.

## Requisitos

- Claude Code **ou** Codex (CLI ou app) instalado e com assinatura ativa.
- Uma pasta vazia (ou quase) onde o cérebro vai viver. Exemplo: `~/meu-cerebro`.
- Para o `/cerebro-3d` apenas: Node.js 22 ou superior. Quem usa Claude Code ou Codex já tem Node.

## Caminho 1: instalador no terminal (Linux, macOS, Git Bash, WSL)

```bash
curl -fsSL https://raw.githubusercontent.com/inematds/astra-2cerebro/main/install.sh | bash -s -- ~/meu-cerebro
```

Ou, com o repositório clonado:

```bash
bash astra-2cerebro/install.sh ~/meu-cerebro
```

Opções:

| Opção | Efeito |
|---|---|
| `install.sh <pasta>` | Cria a estrutura do cérebro na pasta e instala as skills em `<pasta>/.claude/skills` e `<pasta>/.agents/skills` |
| `install.sh <pasta> --global` | Além do acima, instala as skills em `~/.claude/skills` e `~/.agents/skills`, para valerem em qualquer projeto. Substitui skills globais de mesmo nome (`wiki`, `rotina`, `entrevista`...) se já existirem |
| `install.sh <pasta> --so-skills` | Só atualiza as skills, sem tocar na estrutura |
| `install.sh --ajuda` | Mostra a ajuda |

O instalador **nunca sobrescreve** um arquivo que já existe na pasta de destino, exceto as skills do próprio kit (que ele atualiza). Rodar duas vezes é seguro.

## Caminho 2: pelo agente (funciona em qualquer sistema, inclusive Windows puro)

Abra o Claude Code ou o Codex **na pasta onde quer o cérebro** e cole:

```
Instale o kit https://github.com/inematds/astra-2cerebro nesta pasta seguindo o INSTALAR.md do repositório e depois rode /iniciar.
```

## Depois de instalar

1. Abra a pasta do cérebro no Claude Code ou no Codex.
2. Rode `/iniciar` (Claude Code) ou `$iniciar` (Codex). Responda as 7 perguntas. Leva uns 15 minutos.
3. Abra uma conversa nova e pergunte: **"Quem sou eu e no que devo focar esta semana?"** Se a resposta citar seu contexto real, funcionou.
4. Use por uma semana. Depois `/auditar`, depois `/evoluir`.

## Windows

- **Git Bash** (vem com o Git para Windows) ou **WSL**: use o Caminho 1.
- **PowerShell puro**: use o Caminho 2. O agente copia os arquivos por você.

## Atualizar

Rode o instalador de novo apontando para a mesma pasta. Só as skills mudam. Seu contexto, wiki, decisões e auditorias ficam intactos.

---

## Instruções para o agente

Você é um agente (Claude Code, Codex ou equivalente) e o usuário pediu para instalar o kit `astra-2cerebro` na pasta atual. Faça exatamente isto:

1. **Obtenha o kit.** Se `git` estiver disponível: `git clone --depth 1 https://github.com/inematds/astra-2cerebro.git` em uma pasta temporária. Senão, baixe e extraia `https://github.com/inematds/astra-2cerebro/archive/refs/heads/main.tar.gz` (ou `.zip`).
2. **Confirme o destino.** É a pasta de trabalho atual, a menos que o usuário tenha dito outra. Não instale dentro do clone temporário.
3. **Copie a estrutura.** Copie todo o conteúdo de `template/` do kit para o destino, **sem sobrescrever** nenhum arquivo que já exista lá. Inclua arquivos ocultos (`.gitignore`). Liste o que pulou por já existir.
4. **Instale as skills.** Copie cada pasta de `skills/` do kit para `<destino>/.claude/skills/<nome>/` **e** para `<destino>/.agents/skills/<nome>/`, com conteúdo idêntico nas duas (ou copie para a primeira e rode `bash scripts/sincronizar-skills.sh` na raiz do destino). Aqui pode sobrescrever: são as skills do próprio kit. Não copie `node_modules`.
5. **Confira.** Devem existir `<destino>/AGENTS.md`, `<destino>/CLAUDE.md`, `<destino>/.claude/skills/iniciar/SKILL.md` e `<destino>/.agents/skills/iniciar/SKILL.md`.
6. **Limpe.** Remova o clone temporário. Não apague nada do destino.
7. **Diga ao usuário** que a instalação terminou e que o próximo passo é rodar `/iniciar` (Claude Code) ou `$iniciar` (Codex). Se o usuário já pediu para rodar o `/iniciar`, rode.

Não peça chaves de API, não crie `.env`, não inicie repositório git sem o usuário pedir.
