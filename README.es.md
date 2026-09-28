# astra-2cerebro

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

![El segundo cerebro con IA: Contexto, Conexiones, Skills, Automatización](docs/capa.png)

**Tu segundo cerebro con IA, en archivos y carpetas que controlas.**

## 📖 Guía de uso

Guía completa (landing + paso a paso): **https://inematds.github.io/astra-2cerebro/guia/es/**

Un kit gratuito (MIT) que transforma **Claude Code** o **Codex** en un sistema operativo de IA personal: un asistente que te conoce a ti, tu trabajo, tus prioridades y tus herramientas, y que responde como un socio, no como un chatbot genérico.

Todo lo que crea el kit son archivos Markdown y carpetas. Nada queda atado a un proveedor. Cambia de modelo, cambia de herramienta, y el cerebro sigue siendo tuyo.

---

## Instalación en 1 minuto

**Opción A (la más fácil): pídeselo a tu asistente.** Abre Claude Code o Codex en la carpeta donde quieres crear el cerebro y pega:

```
Instala el kit https://github.com/inematds/astra-2cerebro en esta carpeta siguiendo el INSTALAR.md del repositorio y luego ejecuta /iniciar.
```

**Opción B: una línea en la terminal** (Linux, macOS o Windows mediante Git Bash / WSL):

```bash
curl -fsSL https://raw.githubusercontent.com/inematds/astra-2cerebro/main/install.sh | bash -s -- ~/meu-cerebro
```

**Opción C: clonar e instalar**

```bash
git clone https://github.com/inematds/astra-2cerebro.git
bash astra-2cerebro/install.sh ~/meu-cerebro
```

Después, abre la carpeta `~/meu-cerebro` en Claude Code o Codex y ejecuta `/iniciar`. Encontrarás detalles y variantes en [INSTALAR.md](INSTALAR.md).

El instalador nunca sobrescribe archivos existentes, así que es seguro volver a ejecutarlo para actualizar las skills.

---

## Qué obtienes

| Comando | Qué hace | Cuándo usarlo |
|---|---|---|
| `/iniciar` | Entrevista de 7 preguntas y crea la estructura inicial: contexto, voz, conexiones y el manual del agente | Día 1. Puedes ejecutarlo de nuevo en cualquier momento |
| `/entrevista` | Entrevista profunda sobre un tema y guarda cada respuesta en un archivo | Siempre que quieras sacar algo de tu cabeza y ponerlo en el cerebro |
| `/wiki` | Transforma fuentes sin procesar (transcripciones, docs, notas) en páginas de wiki interconectadas, con índice y registro | Cuando acumules material y quieras encontrar relaciones, no crear un depósito |
| `/vincular` | Añade una ruta en el manual del agente para un archivo, carpeta o fuente | Al crear un proyecto o incorporar una fuente nueva |
| `/auditar` | Evalúa los 4 pilares con evidencias, asigna una puntuación de 0 a 100 y guarda un informe fechado | Semanalmente mientras lo construyes; después, mensualmente |
| `/evoluir` | Lee la última auditoría y cierra UNA brecha con un artefacto entregado | Después de cada auditoría |
| `/rotina` | Crea una rutina recurrente (manual o programada) con un registro de ejecución | Cuando algo debe suceder sin que tengas que pedirlo |
| `/cerebro-3d` | Genera un globo 3D interactivo y local con todo el conocimiento guardado | Cuando quieras ver (y mostrar) el cerebro |

Las skills funcionan igual en Claude Code (`/comando`) y en Codex (`$comando`).

---

## Los 4 pilares

El kit organiza el sistema en cuatro capas que se construyen unas sobre otras. Las dos primeras son el **segundo cerebro**. Las dos últimas son el **sistema operativo**.

| # | Pilar | Pregunta que responde | Dónde vive |
|---|---|---|---|
| 1 | **Contexto** | ¿El agente sabe quién soy, qué hago y qué importa ahora? | `contexto/`, `referencias/`, `wiki/` |
| 2 | **Conexiones** | ¿El agente puede acceder a mis datos actualizados (correo electrónico, agenda, tareas, finanzas)? | `conexoes.md`, MCPs, scripts |
| 3 | **Capacidades** | ¿Una frase corta activa un flujo de varios pasos que entrega algo utilizable? | `.claude/skills/`, `.agents/skills/` |
| 4 | **Cadencia** | ¿Las cosas útiles suceden sin que tenga que pedirlas, y quedan registradas? | `rotinas/`, programaciones |

**Contexto** es lo que cambia poco: quién eres, tu negocio o trabajo, las metas del trimestre, tu público y tus problemas. **Conexiones** son las herramientas del día a día, donde los datos cambian constantemente. Sin estas dos, las skills y automatizaciones quedan genéricas. Por eso el orden importa: Contexto primero, Cadencia al final.

### El ciclo

```
/iniciar → usar durante una semana → /auditar → /evoluir → construir → /auditar → ...
```

Cada vuelta del ciclo cierra una brecha y la siguiente auditoría demuestra (o no) que se cerró. Los informes quedan en `auditorias/` y el historial de puntuaciones en `auditorias/historico.md`, para que puedas ver la evolución mes a mes.

### Tres señales de que está funcionando

1. **Alguien te hace una pregunta y te das cuenta de que tu cerebro respondería mejor y más rápido, con las fuentes exactas.** Entonces también se lo preguntas.
2. **Dejas de abrir diez pestañas.** Ante cualquier cosa nueva, el primer paso es preguntarle al cerebro, no abrir seis aplicaciones.
3. **El conocimiento sale de tu cabeza.** Ya no tienes que repasar lo que decidiste el trimestre pasado ni lo que dijo el cliente en aquella reunión. Confías en que podrás recuperarlo.

---

## El manual del agente: `AGENTS.md` y `CLAUDE.md`

El archivo más importante del cerebro. Codex lee `AGENTS.md`; Claude Code lee `CLAUDE.md`. Ambos tienen el mismo contenido y el kit los mantiene sincronizados.

El agente lee este archivo **antes** de leer tu mensaje, cada vez. Contiene:

- **Quién eres y cuál es el trabajo del agente** (se completa con `/iniciar`).
- **Reglas de operación**: tono, formato, qué hacer y qué no hacer.
- **Mapa de rutas**: la mayor parte del archivo. «Si necesitas X, busca en Y». Es lo que ayuda al agente a encontrar las cosas en vez de adivinar.

Cuanto mejor sea el mapa de rutas, mejor será el cerebro. `/vincular` y `/auditar` existen para mantenerlo actualizado.

---

## Estructura del cerebro instalado

```
meu-cerebro/
├── AGENTS.md               ← manual del agente (Codex)
├── CLAUDE.md               ← manual del agente (Claude Code), mismo contenido
├── COMO-USAR.md            ← guía rápida dentro del cerebro
├── EXPANSOES.md            ← qué agregar a medida que crece (y qué no agregar)
├── entrevista-inicial.md   ← las 7 preguntas de /iniciar (edítalo y vuelve a ejecutarlo)
├── conexoes.md             ← registro de cada sistema al que accede el cerebro
├── contexto/               ← sobre ti, tu trabajo y tus prioridades
├── referencias/            ← voz, guías de API, procedimientos
├── decisoes/registro.md    ← qué se decidió y por qué
├── projetos/               ← un subdirectorio por cada proyecto activo
├── fontes/                 ← material sin procesar (transcripciones, exportaciones, docs)
├── wiki/                   ← páginas interconectadas generadas por /wiki
├── entrevistas/            ← registros de /entrevista (ignorado por git)
├── auditorias/             ← informes de /auditar (ignorado por git)
├── rotinas/registro.md     ← rutinas activas y registro de ejecuciones
├── arquivo/                ← cosas antiguas. No las borres, muévelas aquí
├── scripts/                ← sincronizar-skills.sh y tus scripts de conexión
├── .claude/skills/         ← las 8 skills (Claude Code)
└── .agents/skills/         ← las mismas 8 skills (Codex)
```

El cerebro contiene datos personales. Si vas a usar git para versionarlo, usa un repositorio **privado**.

---

## Conectar herramientas

Después de `/iniciar`, haz una lista de las herramientas que usas cada semana pensando en siete dominios: **ingresos, clientes, agenda, comunicación, tareas, reuniones, conocimiento**. Luego pídele al agente, una por una:

```
Quiero conectar Google Calendar. ¿Cuál es la mejor opción: MCP, API con script o exportación?
```

Te propondrá un mecanismo, te ayudará a configurarlo y lo registrará en `conexoes.md` y `referencias/<herramienta>-api.md`. Lo investigas una vez y queda guardado para siempre.

---

## Consejo sobre los modelos

Usa el modelo más capaz para montar la estructura y para trabajos que requieren un razonamiento intenso. Para el día a día (encontrar un documento, resumir una reunión, redactar un correo electrónico), un modelo más barato y rápido es suficiente y conserva tu cuota. Ajusta también el nivel de esfuerzo cuando la tarea sea sencilla.

---

## Cerebro 3D

`/cerebro-3d` te pregunta el nombre de tu cerebro y qué categorías quieres mostrar, y genera una app local en `apps/cerebro-3d/`. Necesita Node.js 22 o superior (si usas Claude Code o Codex, ya lo tienes). Se ejecuta con `node serve.mjs`, sin instalar nada, y nunca sale de tu máquina.

Búsqueda, lectura de notas, filtros por categoría, señalización de páginas antiguas u huérfanas, modo cine y la animación de crecimiento (el cerebro nace de una idea hasta convertirse en el globo completo).

---

## Ecosistema: tres proyectos hermanos

El cerebro son solo carpetas y Markdown, así que puede ser leído por más de un agente y por sistemas existentes. Tres proyectos separados hacen esto; todos están construidos sobre este kit:

| Proyecto | Qué hace | Repositorio | Guía |
|---|---|---|---|
| **cerebro-mcp** | Servidor MCP que expone el cerebro como herramientas (10 de lectura, 3 de escritura optativa) para Claude Code, Codex, Claude Desktop, n8n y bots. Stdio y HTTP local | [inematds/cerebro-mcp](https://github.com/inematds/cerebro-mcp) | [guia](https://inematds.github.io/cerebro-mcp/guia/) |
| **cerebro-duplo** | Un cerebro, dos agentes: `duplo.sh` con verificación de paridad, sincronización, perfiles de modelo y esfuerzo para Claude Code y Codex, registro de uso y las skills `qual-agente` y `duplo-verificar` | [inematds/cerebro-duplo](https://github.com/inematds/cerebro-duplo) | [guia](https://inematds.github.io/cerebro-duplo/guia/) |
| **cerebro-integra** | API HTTP local, bot de Telegram, importadores JSON/CSV/carpeta, exportador de la wiki, flujo de n8n y puente de voz. Cero dependencias | [inematds/cerebro-integra](https://github.com/inematds/cerebro-integra) | [guia](https://inematds.github.io/cerebro-integra/guia/) |

Cuál usar:

- ¿Quieres el mismo cerebro en **otro cliente de IA** (Codex, Claude Desktop, n8n)? `cerebro-mcp`.
- ¿Usas **Claude Code y Codex** y quieres elegir el agente y el modelo según la tarea sin que los manuales se desincronicen? `cerebro-duplo`.
- ¿Quieres hacer consultas por **Telegram**, mostrar la wiki en un **sitio** o alimentar `fontes/` con una **base de datos** todas las noches? `cerebro-integra`.

Limitaciones conocidas de los tres, para que no te sorprendan: el modo HTTP de `cerebro-mcp` no tiene autenticación y escucha solo en `127.0.0.1`; los perfiles de `cerebro-duplo` incluyen nombres de modelos de ejemplo que debes editar; el bot de `cerebro-integra` se probó con Telegram simulado, no con un token real. En los tres, la raíz de GitHub Pages da 404 por diseño y la página está en `/guia/`.

---

## Preguntas frecuentes

**¿Necesito saber programar?** No. Conversas con el agente. Las skills hacen el resto.

**¿Funciona con otra herramienta además de Claude Code y Codex?** Cualquier agente que lea `AGENTS.md` o `CLAUDE.md` y carpetas de skills con el formato abierto puede usar el cerebro. Es solo Markdown.

**¿Puedo tener más de un cerebro?** Sí. Uno por carpeta. Mucha gente separa su vida personal del trabajo.

**¿Cómo actualizo el kit?** Vuelve a ejecutar el instalador apuntando a la misma carpeta. Actualiza las skills y no toca tu contenido.

---

## Créditos y licencia

MIT. Consulta [LICENSE](LICENSE).

La estructura de este kit deriva de un kit de código abierto (MIT) para sistemas operativos de IA personales; la atribución exigida por la licencia está en el archivo `LICENSE`. El método de wiki mantenida por LLM se inspira en la idea publicada por Andrej Karpathy. El renderizador 3D usa `3d-force-graph`, `three`, `marked` y `dompurify` (avisos en `THIRD-PARTY-NOTICES.txt`).
