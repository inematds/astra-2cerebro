# astra-2cerebro

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

![Your second brain with AI: Context, Connections, Skills, Automation](docs/capa.png)

**Your second brain with AI, in files and folders you control.**

## 📖 User guide

Complete guide (landing page + step-by-step instructions): **https://inematds.github.io/astra-2cerebro/guia/en/**

A free (MIT) kit that turns **Claude Code** or **Codex** into a personal AI operating system: an assistant that knows you, your work, your priorities, and your tools, and responds like a partner, not a generic chatbot.

Everything the kit creates is Markdown files and folders. Nothing is locked to a vendor. Change models, change tools, and the brain remains yours.

---

## Install in 1 minute

**Option A (easiest): ask your assistant.** Open Claude Code or Codex in the folder where you want to create the brain and paste:

```
Install the kit https://github.com/inematds/astra-2cerebro in this folder, following the repository's INSTALAR.md, and then run /iniciar.
```

**Option B: one line in the terminal** (Linux, macOS, or Windows via Git Bash / WSL):

```bash
curl -fsSL https://raw.githubusercontent.com/inematds/astra-2cerebro/main/install.sh | bash -s -- ~/meu-cerebro
```

**Option C: clone and install**

```bash
git clone https://github.com/inematds/astra-2cerebro.git
bash astra-2cerebro/install.sh ~/meu-cerebro
```

Then open the `~/meu-cerebro` folder in Claude Code or Codex and run `/iniciar`. Details and variations in [INSTALAR.md](INSTALAR.md).

The installer never overwrites existing files, so it's safe to run again to update the skills.

---

## What you get

| Command | What it does | When to use it |
|---|---|---|
| `/iniciar` | 7-question interview that creates the initial structure: context, voice, connections, and the agent's manual | Day 1. You can run it again anytime |
| `/entrevista` | In-depth interview on a topic, saving each answer to a file | Whenever you want to get something out of your head and into the brain |
| `/wiki` | Turns raw sources (transcripts, docs, notes) into interconnected wiki pages, with an index and log | When you have accumulated material and want connections, not a dumping ground |
| `/vincular` | Adds a route to the agent's manual for a file, folder, or source | When creating a project or bringing in a new source |
| `/auditar` | Evaluates the 4 pillars with evidence, assigns a score from 0 to 100, and saves a dated report | Weekly while building, then monthly |
| `/evoluir` | Reads the latest audit and closes ONE gap with a delivered artifact | After each audit |
| `/rotina` | Creates a recurring routine (manual or scheduled) with an execution log | When something needs to happen without you asking |
| `/cerebro-3d` | Generates an interactive, local 3D globe with all saved knowledge | When you want to see (and show) the brain |

The skills work the same in Claude Code (`/comando`) and Codex (`$comando`).

---

## The 4 pillars

The kit organizes the system into four layers built on top of one another. The first two are the **second brain**. The last two are the **operating system**.

| # | Pillar | Question it answers | Where it lives |
|---|---|---|---|
| 1 | **Context** | Does the agent know who I am, what I do, and what matters now? | `contexto/`, `referencias/`, `wiki/` |
| 2 | **Connections** | Can the agent reach my live data (email, calendar, tasks, finances)? | `conexoes.md`, MCPs, scripts |
| 3 | **Capabilities** | Does a short phrase trigger a multi-step workflow that delivers something usable? | `.claude/skills/`, `.agents/skills/` |
| 4 | **Cadence** | Do useful things happen without me asking, with a record? | `rotinas/`, schedules |

**Context** changes little: who you are, your business or work, quarterly goals, audience, pain points. **Connections** are your everyday tools, where the data changes constantly. Without these two, skills and automations come out generic. That's why the order matters: Context first, Cadence last.

### The cycle

```
/iniciar → use for a week → /auditar → /evoluir → build → /auditar → ...
```

Each cycle closes a gap, and the next audit proves (or doesn't prove) that it was closed. Reports are stored in `auditorias/` and the score history in `auditorias/historico.md`, so you can see progress month by month.

### Three signs it's working

1. **Someone asks you a question and you realize your brain would answer better and faster, with the exact sources.** So you ask it too.
2. **You stop opening ten tabs.** Your first move when facing anything new is to ask the brain, not open six apps.
3. **Knowledge leaves your head.** You no longer rehearse what you decided last quarter or what the client said in that meeting. You trust retrieval.

---

## The agent's manual: `AGENTS.md` and `CLAUDE.md`

The brain's most important file. Codex reads `AGENTS.md`; Claude Code reads `CLAUDE.md`. Both have the same content, and the kit keeps them in sync.

The agent reads this file **before** reading your message, every time. It contains:

- **Who you are and what the agent's job is** (filled in by `/iniciar`).
- **Operating rules**: tone, format, what to do and what not to do.
- **Route map**: most of the file. “If you need X, look in Y.” This is what helps the agent find things instead of guessing.

The better the route map, the better the brain. `/vincular` and `/auditar` are there to keep it alive.

---

## Structure of the installed brain

```
meu-cerebro/
├── AGENTS.md               ← agent's manual (Codex)
├── CLAUDE.md               ← agent's manual (Claude Code), same content
├── COMO-USAR.md            ← quick guide inside the brain
├── EXPANSOES.md            ← what to add as it grows (and what not to add)
├── entrevista-inicial.md   ← the 7 /iniciar questions (edit and run again)
├── conexoes.md             ← record of each system the brain can reach
├── contexto/               ← about you, your work, priorities
├── referencias/            ← voice, API guides, procedures
├── decisoes/registro.md    ← what was decided and why
├── projetos/               ← one subdirectory per active project
├── fontes/                 ← raw material (transcripts, exports, docs)
├── wiki/                   ← interconnected pages generated by /wiki
├── entrevistas/            ← captures from /entrevista (ignored by git)
├── auditorias/             ← reports from /auditar (ignored by git)
├── rotinas/registro.md     ← active routines and execution log
├── arquivo/                ← old stuff. Don't delete it; move it here
├── scripts/                ← sincronizar-skills.sh and your connection scripts
├── .claude/skills/         ← the same 8 skills (Claude Code)
└── .agents/skills/         ← the same 8 skills (Codex)
```

The brain contains personal data. If you version it with git, use a **private** repository.

---

## Connecting tools

After `/iniciar`, list the tools you use every week by thinking about seven domains: **revenue, clients, calendar, communication, tasks, meetings, knowledge**. Then ask the agent, one at a time:

```
I want to connect Google Calendar. What's the best approach: MCP, API with a script, or export?
```

It will propose the mechanism, help configure it, and record it in `conexoes.md` and `referencias/<ferramenta>-api.md`. Research it once, save it forever.

---

## A note about models

Use the most capable model to set up the structure and for work that requires heavy reasoning. For everyday tasks (finding a document, summarizing a meeting, drafting an email), a cheaper, faster model will do and preserve your quota. Also adjust the effort level when the task is simple.

---

## 3D brain

`/cerebro-3d` asks for your brain's name and which categories to show, then generates a local app in `apps/cerebro-3d/`. It requires Node.js 22 or higher (if you use Claude Code or Codex, you already have it). Run it with `node serve.mjs`, without installing anything, and it never leaves your machine.

Search, note reading, category filters, flags for old or orphaned pages, cinema mode, and the growth animation (the brain growing from an idea into a complete globe).

---

## Ecosystem: three related projects

The brain is just folders and Markdown, so it can be read by more than one agent and by existing systems. Three separate projects do this, all built on this kit:

| Project | What it does | Repository | Guide |
|---|---|---|---|
| **cerebro-mcp** | MCP server that exposes the brain as tools (10 read-only, 3 opt-in write tools) for Claude Code, Codex, Claude Desktop, n8n, and bots. Stdio and local HTTP | [inematds/cerebro-mcp](https://github.com/inematds/cerebro-mcp) | [guia](https://inematds.github.io/cerebro-mcp/guia/) |
| **cerebro-duplo** | One brain, two agents: `duplo.sh` with parity checking, sync, model and effort profiles for Claude Code and Codex, usage logging, and the `qual-agente` and `duplo-verificar` skills | [inematds/cerebro-duplo](https://github.com/inematds/cerebro-duplo) | [guia](https://inematds.github.io/cerebro-duplo/guia/) |
| **cerebro-integra** | Local HTTP API, Telegram bot, JSON/CSV/folder importers, wiki exporter, n8n workflow, and voice bridge. Zero dependencies | [inematds/cerebro-integra](https://github.com/inematds/cerebro-integra) | [guia](https://inematds.github.io/cerebro-integra/guia/) |

Which one to use:

- Want the same brain in **another AI client** (Codex, Claude Desktop, n8n)? `cerebro-mcp`.
- Use **Claude Code and Codex** and want to choose an agent and model for each task without the manuals drifting apart? `cerebro-duplo`.
- Want to ask questions via **Telegram**, show the wiki on a **site**, or feed `fontes/` with a **database** every night? `cerebro-integra`.

Known limitations of the three, so you won't be surprised: `cerebro-mcp`'s HTTP mode has no authentication and listens only on `127.0.0.1`; `cerebro-duplo`'s profiles include example model names that you edit; `cerebro-integra`'s bot was tested with simulated Telegram, not a real token. In all three, the GitHub Pages root returns 404 by design, and the page is at `/guia/`.

---

## Frequently asked questions

**Do I need to know how to code?** No. You talk to the agent. The skills do the rest.

**Does it work with tools other than Claude Code and Codex?** Any agent that reads `AGENTS.md` or `CLAUDE.md` and skill folders in the open standard can use the brain. It's just Markdown.

**Can I have more than one brain?** Yes. One per folder. Many people separate personal life and work.

**How do I update the kit?** Run the installer again, pointing it at the same folder. It updates the skills and doesn't touch your content.

---

## Credits and license

MIT. See [LICENSE](LICENSE).

The structure of this kit is derived from an open-source (MIT) kit for personal AI operating systems; the attribution required by the license is in the `LICENSE` file. The LLM-maintained wiki method is inspired by the idea published by Andrej Karpathy. The 3D renderer uses `3d-force-graph`, `three`, `marked`, and `dompurify` (notices in `THIRD-PARTY-NOTICES.txt`).
