# astra-2cerebro

![O segundo cérebro com IA: Contexto, Conexões, Skills, Automação](docs/capa.png)

**Seu segundo cérebro com IA, em arquivos e pastas que você controla.**

## 📖 Guia de uso

Guia completo (landing + passo a passo): **https://inematds.github.io/astra-2cerebro/guia/**

Um kit gratuito (MIT) que transforma o **Claude Code** ou o **Codex** em um sistema operacional de IA pessoal: um assistente que conhece você, seu trabalho, suas prioridades e suas ferramentas, e que responde como um sócio, não como um chatbot genérico.

Tudo o que o kit cria são arquivos Markdown e pastas. Nada fica preso a um fornecedor. Troque de modelo, troque de ferramenta, e o cérebro continua seu.

---

## Instalação em 1 minuto

**Opção A (mais fácil): peça ao seu assistente.** Abra o Claude Code ou o Codex na pasta onde quer criar o cérebro e cole:

```
Instale o kit https://github.com/inematds/astra-2cerebro nesta pasta seguindo o INSTALAR.md do repositório e depois rode /iniciar.
```

**Opção B: uma linha no terminal** (Linux, macOS, ou Windows via Git Bash / WSL):

```bash
curl -fsSL https://raw.githubusercontent.com/inematds/astra-2cerebro/main/install.sh | bash -s -- ~/meu-cerebro
```

**Opção C: clonar e instalar**

```bash
git clone https://github.com/inematds/astra-2cerebro.git
bash astra-2cerebro/install.sh ~/meu-cerebro
```

Depois, abra a pasta `~/meu-cerebro` no Claude Code ou no Codex e rode `/iniciar`. Detalhes e variações em [INSTALAR.md](INSTALAR.md).

O instalador nunca sobrescreve arquivos existentes, então é seguro rodar de novo para atualizar as skills.

---

## O que você ganha

| Comando | O que faz | Quando usar |
|---|---|---|
| `/iniciar` | Entrevista de 7 perguntas e cria a estrutura inicial: contexto, voz, conexões e o manual do agente | Dia 1. Pode rodar de novo a qualquer momento |
| `/entrevista` | Entrevista profunda sobre um tema, salvando cada resposta em arquivo | Sempre que quiser tirar algo da cabeça e colocar no cérebro |
| `/wiki` | Transforma fontes brutas (transcrições, docs, notas) em páginas de wiki interligadas, com índice e log | Quando acumular material e quiser relações, não um depósito |
| `/vincular` | Adiciona uma rota no manual do agente para um arquivo, pasta ou fonte | Ao criar um projeto ou trazer uma fonte nova |
| `/auditar` | Avalia os 4 pilares com evidências, dá nota de 0 a 100 e salva relatório datado | Semanalmente enquanto constrói, depois mensalmente |
| `/evoluir` | Lê a última auditoria e fecha UMA lacuna com um artefato entregue | Depois de cada auditoria |
| `/rotina` | Cria uma rotina recorrente (manual ou agendada) com registro de execução | Quando algo precisa acontecer sem você pedir |
| `/cerebro-3d` | Gera um globo 3D interativo e local com todo o conhecimento salvo | Quando quiser enxergar (e mostrar) o cérebro |

As skills funcionam igual no Claude Code (`/comando`) e no Codex (`$comando`).

---

## Os 4 pilares

O kit organiza o sistema em quatro camadas que se constroem uma sobre a outra. As duas primeiras são o **segundo cérebro**. As duas últimas são o **sistema operacional**.

| # | Pilar | Pergunta que responde | Onde vive |
|---|---|---|---|
| 1 | **Contexto** | O agente sabe quem eu sou, o que faço e o que importa agora? | `contexto/`, `referencias/`, `wiki/` |
| 2 | **Conexões** | O agente alcança meus dados vivos (e-mail, agenda, tarefas, finanças)? | `conexoes.md`, MCPs, scripts |
| 3 | **Capacidades** | Uma frase curta dispara um fluxo de vários passos que entrega algo usável? | `.claude/skills/`, `.agents/skills/` |
| 4 | **Cadência** | Coisas úteis acontecem sem eu pedir, com registro? | `rotinas/`, agendamentos |

**Contexto** é o que muda pouco: quem você é, seu negócio ou trabalho, metas do trimestre, público, dores. **Conexões** são as ferramentas do dia a dia, onde o dado muda sempre. Sem esses dois, skills e automações saem genéricas. Por isso a ordem importa: Contexto primeiro, Cadência por último.

### O ciclo

```
/iniciar → usar por uma semana → /auditar → /evoluir → construir → /auditar → ...
```

Cada volta do ciclo fecha uma lacuna e a auditoria seguinte prova (ou não) que fechou. Os relatórios ficam em `auditorias/` e o histórico de notas em `auditorias/historico.md`, para você ver a evolução mês a mês.

### Três sinais de que está funcionando

1. **Alguém te faz uma pergunta e você percebe que o seu cérebro responderia melhor e mais rápido, com as fontes exatas.** Então você pergunta a ele também.
2. **Você para de abrir dez abas.** O primeiro movimento diante de qualquer coisa nova é perguntar ao cérebro, não abrir seis aplicativos.
3. **O conhecimento sai da sua cabeça.** Você não ensaia mais o que decidiu no trimestre passado nem o que o cliente disse naquela reunião. Você confia na recuperação.

---

## O manual do agente: `AGENTS.md` e `CLAUDE.md`

O arquivo mais importante do cérebro. O Codex lê `AGENTS.md`; o Claude Code lê `CLAUDE.md`. Os dois têm o mesmo conteúdo e o kit mantém os dois em sincronia.

O agente lê esse arquivo **antes** de ler a sua mensagem, toda vez. Ele contém:

- **Quem você é e qual é o trabalho do agente** (preenchido por `/iniciar`).
- **Regras de operação**: tom, formato, o que fazer e não fazer.
- **Mapa de rotas**: a maior parte do arquivo. "Se precisar de X, olhe em Y." É o que faz o agente achar as coisas em vez de chutar.

Quanto melhor o mapa de rotas, melhor o cérebro. `/vincular` e `/auditar` existem para mantê-lo vivo.

---

## Estrutura do cérebro instalado

```
meu-cerebro/
├── AGENTS.md               ← manual do agente (Codex)
├── CLAUDE.md               ← manual do agente (Claude Code), mesmo conteúdo
├── COMO-USAR.md            ← guia rápido dentro do cérebro
├── EXPANSOES.md            ← o que adicionar conforme cresce (e o que não adicionar)
├── entrevista-inicial.md   ← as 7 perguntas do /iniciar (edite e rode de novo)
├── conexoes.md             ← registro de cada sistema que o cérebro alcança
├── contexto/               ← sobre você, seu trabalho, prioridades
├── referencias/            ← voz, guias de API, procedimentos
├── decisoes/registro.md    ← o que foi decidido e por quê
├── projetos/               ← um subdiretório por projeto ativo
├── fontes/                 ← material bruto (transcrições, exportações, docs)
├── wiki/                   ← páginas interligadas geradas pelo /wiki
├── entrevistas/            ← capturas do /entrevista (ignorado pelo git)
├── auditorias/             ← relatórios do /auditar (ignorado pelo git)
├── rotinas/registro.md     ← rotinas ativas e registro de execuções
├── arquivo/                ← coisa velha. Não apague, mova para cá
├── scripts/                ← sincronizar-skills.sh e seus scripts de conexão
├── .claude/skills/         ← as 8 skills (Claude Code)
└── .agents/skills/         ← as mesmas 8 skills (Codex)
```

O cérebro contém dados pessoais. Se for versionar com git, use um repositório **privado**.

---

## Conectando ferramentas

Depois do `/iniciar`, liste as ferramentas que você usa toda semana pensando em sete domínios: **receita, clientes, agenda, comunicação, tarefas, reuniões, conhecimento**. Depois peça ao agente, uma de cada vez:

```
Quero conectar o Google Calendar. Qual é o melhor caminho: MCP, API com script, ou exportação?
```

Ele vai propor o mecanismo, ajudar a configurar e registrar em `conexoes.md` e `referencias/<ferramenta>-api.md`. Pesquisou uma vez, salvou para sempre.

---

## Dica sobre modelos

Use o modelo mais capaz para montar a estrutura e para trabalhos que exigem raciocínio pesado. Para o dia a dia (achar um documento, resumir uma reunião, redigir um e-mail), um modelo mais barato e rápido resolve e preserva sua cota. Ajuste também o nível de esforço quando a tarefa for simples.

---

## Cérebro 3D

`/cerebro-3d` pergunta o nome do seu cérebro e quais categorias mostrar, e gera um app local em `apps/cerebro-3d/`. Precisa de Node.js 22 ou superior (se você usa Claude Code ou Codex, já tem). Roda com `node serve.mjs`, sem instalar nada, e nunca sai da sua máquina.

Busca, leitura da nota, filtros por categoria, sinalização de páginas velhas ou órfãs, modo cinema e a animação de crescimento (o cérebro nascendo de uma ideia até o globo completo).

---

## Perguntas frequentes

**Preciso saber programar?** Não. Você conversa com o agente. As skills fazem o resto.

**Funciona com outra ferramenta além de Claude Code e Codex?** Qualquer agente que leia `AGENTS.md` ou `CLAUDE.md` e pastas de skills no padrão aberto consegue usar o cérebro. É só Markdown.

**Posso ter mais de um cérebro?** Sim. Um por pasta. Muita gente separa vida pessoal e trabalho.

**Como atualizo o kit?** Rode o instalador de novo apontando para a mesma pasta. Ele atualiza as skills e não toca no seu conteúdo.

---

## Créditos e licença

MIT. Veja [LICENSE](LICENSE).

A estrutura deste kit deriva de um kit de código aberto (MIT) para sistemas operacionais de IA pessoais; a atribuição exigida pela licença está no arquivo `LICENSE`. O método de wiki mantida por LLM se inspira na ideia publicada por Andrej Karpathy. O renderizador 3D usa `3d-force-graph`, `three`, `marked` e `dompurify` (avisos em `THIRD-PARTY-NOTICES.txt`).
