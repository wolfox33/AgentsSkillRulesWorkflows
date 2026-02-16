# My Skills Stack

Stack personalizada de skills para agentes AI (Antigravity, Claude, Cursor, Copilot).

## 📚 Skills Disponíveis

### Architecture

#### [Vertical Slice + Modular Monolith](./architecture/vertical-slice-modular-monolith/)
Arquitetura padrão para projetos SaaS combinando Vertical Slice Architecture e Modular Monolith.

**Quando usar:**
- Iniciando novo projeto SaaS
- Refatorando monólito tradicional
- Estabelecendo padrões de arquitetura
- Evitando overengineering

**Recursos:**
- [SKILL.md](./architecture/vertical-slice-modular-monolith/SKILL.md) - Skill principal
- [Implementation Guide](./architecture/vertical-slice-modular-monolith/resources/implementation-guide.md) - Guia passo a passo
- [Feature Template](./architecture/vertical-slice-modular-monolith/resources/feature-template.md) - Template reutilizável

### Development

#### [Frontend Design — Bagual](./development/frontend-design/)
Design system completo do SaaS Bagual com paleta de cores, tipografia (Ubuntu + Open Sans), componentes shadcn/ui, padrões de layout, acessibilidade e responsividade.

**Quando usar:**
- Criando qualquer componente, página ou layout
- Definindo estilos visuais para novas features
- Implementando landing pages, dashboards, formulários
- Precisando de decisão sobre cor, tipografia, espaçamento

**Recursos:**
- [SKILL.md](./development/frontend-design/SKILL.md) - Design system + patterns + checklist

**Stack:** Tailwind CSS v4, shadcn/ui, Next.js 16, Lucide React

---

#### [AI SDK UI Chat](./development/ai-sdk-ui-chat/)
Padrões de implementação de interface de chat usando Vercel AI SDK UI (`@ai-sdk/react`) com `useChat`, streaming, persistência, tools e integração segura.

**Quando usar:**
- Construir interface de chat com AI streaming
- Integrar `useChat` com Next.js App Router
- Implementar tool calling na UI
- Persistir mensagens com Drizzle + PostgreSQL
- Substituir implementação manual de SSE por abstração robusta

**Recursos:**
- [SKILL.md](./development/ai-sdk-ui-chat/SKILL.md) - Skill principal com patterns completos

**Stack:** `ai` 6.0+, `@ai-sdk/react` 1.0+, `@ai-sdk/openai` 1.0+

---

#### [Tech Stack Decision](./development/tech-stack-decision/)
Guia de decisão de stack tecnológica para projetos SaaS com versões atualizadas (fev/2026).

**Quando usar:**
- Iniciando novo projeto e definindo stack
- Em dúvida entre múltiplas tecnologias
- Validando escolha de framework/biblioteca
- Atualizando versões de dependências

**Recursos:**
- [SKILL.md](./development/tech-stack-decision/SKILL.md) - Skill principal com stack padrão
- [Stack Reference](./development/tech-stack-decision/resources/stack-reference.md) - Detalhamento completo

**Stack Padrão:**
- Frontend: Next.js 16.0.10, Bun 1.3.9, Tailwind v4.0, Better Auth 1.4.18
- Backend: FastAPI 0.129.0, Python 3.12, LangGraph 1.0
- Database: PostgreSQL 16, Drizzle 0.45.1

## 🚀 Como Usar

### Opção 1: Integração com Antigravity

```bash
# Copiar skills para diretório do Antigravity
cp -r ./architecture "C:\Code\Python Scripts\agent\.agent\skills\"

# Reiniciar Antigravity
```

Usar skill:
```
@vertical-slice-modular-monolith criar nova feature de notificações
```

### Opção 2: Uso Manual

1. Navegar até a skill desejada
2. Ler `SKILL.md` para entender princípios
3. Seguir guias em `resources/`

### Opção 3: Referência

Adicionar link no README do projeto como documentação de arquitetura.

## 📁 Estrutura

```
my-skills-stack/
├── README.md                    # Este arquivo
├── architecture/                # Skills de arquitetura
│   └── vertical-slice-modular-monolith/
│       ├── SKILL.md
│       └── resources/
│           ├── implementation-guide.md
│           └── feature-template.md
├── data-science/               # Skills de data science (futuro)
├── trading/                    # Skills de trading (futuro)
├── machine-learning/           # Skills de ML (futuro)
└── development/                # Skills de desenvolvimento (futuro)
```

## 🎯 Roadmap

### Em Desenvolvimento
- [ ] Meta-Labeling Workflow (trading)
- [ ] Feature Engineering Pipeline (data science)
- [ ] Model Training Orchestrator (ML)

### Planejado
- [ ] Data Quality Checker
- [ ] Code Review Assistant
- [ ] Documentation Generator
- [ ] Hyperparameter Optimizer

## 📖 Referências

Esta stack foi criada baseando-se nos seguintes repositórios:

- [Antigravity Skills](https://github.com/rmyndharis/antigravity-skills) - 105+ skills
- [Claude Skills](https://github.com/BehiSecc/awesome-claude-skills) - 50+ skills
- [Vercel Skills](https://github.com/vercel-labs/skills) - Open agent skills
- [OpenAI Skills](https://github.com/openai/skills) - Agent skills catalog

## 🤝 Contribuindo

Para adicionar nova skill:

1. Criar diretório em categoria apropriada
2. Seguir formato padrão:
   ```
   skill-name/
   ├── SKILL.md          # Skill principal com YAML frontmatter
   ├── resources/        # Guias e templates
   └── examples/         # Exemplos de uso
   ```
3. Incluir YAML frontmatter completo
4. Adicionar seções: Use when, Do not use, Instructions, Safety
5. Documentar em README.md

## 📝 Formato de Skill

Toda skill deve seguir este formato:

```yaml
---
name: skill-name
description: Breve descrição da skill
metadata:
  model: inherit
  version: 1.0.0
  category: architecture|data-science|trading|ml|development
  complexity: 1-5
  tags: [tag1, tag2, tag3]
  compatible_with: [antigravity, claude, cursor, copilot]
---

# Skill Title

## Use this skill when
- Cenário 1
- Cenário 2

## Do not use this skill when
- Cenário 1
- Cenário 2

## Instructions
1. Passo 1
2. Passo 2

## Safety
- Consideração 1
- Consideração 2

## Resources
- `resources/guide.md`
```

## 📊 Estatísticas

- **Total de Skills**: 14+
- **Categorias**: 2 (Architecture, Development)
- **Em Desenvolvimento**: 4
- **Planejadas**: 4

## 📄 Licença

MIT License - Sinta-se livre para usar e modificar.

## 🔗 Links Úteis

- [Antigravity Documentation](https://github.com/google-deepmind/antigravity)
- [Claude Skills Guide](https://docs.anthropic.com)
- [Agent Skills Standard](https://github.com/openai/skills)
