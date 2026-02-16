---
description: Gera um resumo e descrição para commits no Git
---

1. Verifique o estado do repositório e liste os arquivos alterados.
   - Comando sugerido: `git status --short`

2. Revise o diff para entender o impacto funcional e técnico.
   - Comando sugerido: `git diff --` e, se houver stage, `git diff --staged --`

3. Agrupe mudanças relacionadas em um único commit lógico.
   - Se houver mudanças não relacionadas, proponha separar em commits distintos.

4. Escreva a mensagem de commit no formato Conventional Commits:
   - Estrutura: `<tipo>(escopo opcional): <resumo>`
   - Tipos comuns: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`

5. Gere também uma descrição curta (bullet points) com:
   - O que mudou
   - Por que mudou
   - Riscos/impactos

6. Confirme com o usuário antes de executar `git add` e `git commit`.

7. Após aprovação:
   - Faça stage apenas dos arquivos relacionados.
   - Comando sugerido: `git add <arquivos>`
   - Faça o commit com título e descrição.
   - Comando sugerido: `git commit -m "<titulo>" -m "<descricao>"`

8. Mostre o resultado final e hash do commit.
   - Comando sugerido: `git log -1 --oneline`
