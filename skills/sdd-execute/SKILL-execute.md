---
name: sdd-execute
description: Executes tasks from tasks.md using a strict TDD loop (Red-Green-Verify). Supports single task or full phase execution. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Ejecución Atómica TDD (`sdd-execute`)

## Propósito
Actuar como Senior Software Engineer para implementar código de producción atómico y testeado mediante el ciclo TDD (Red-Green-Verify), basándose en `tasks.md`, `plan.md`, `spec.md` y `constitution.md`.

## Procedimiento Paso a Paso

### Paso 1: Lectura de Contexto y Herramientas
1. Lee `AGENTS.md` para identificar el comando exacto de tests (ej. `npm test`, `pytest`, `cargo test`).
2. Lee `docs/constitution.md`, `spec.md`, `plan.md` y `tasks.md` del módulo activo.

### Paso 2: Determinación del Alcance (Scope)
Determina el objetivo según la instrucción del usuario:
- **Modo Tarea Única:** Se indicó una tarea específica (ej. "Tarea 1.1").
- **Modo Lote / Fase:** Se indicó una fase completa (ej. "Fase 1").
- **Modo Por Defecto:** Si no se especificó, toma la **primera tarea pendiente (`- [ ]`)** de `tasks.md`.

### Paso 3: Bucle TDD por Tarea
Para la tarea objetivo (o secuencialmente por cada tarea `- [ ]` en la fase):

1. **Lectura:** Carga el criterio `"Hecho cuando:"` y los requisitos `[RF-XX]` asociados.
2. **Fase RED (Test):** Escribe o actualiza la suite de pruebas. Ejecuta el comando de tests y confirma que **falla** por las razones esperadas.
3. **Fase GREEN (Código):** Escribe el código de producción mínimo y necesario para cumplir la tarea respetando `plan.md`.
4. **Verificación:** Ejecuta nuevamente la suite de pruebas.
   - **SI LOS TESTS FALLAN:** Detén el proceso de inmediato, reporta el fallo y NO avances.
   - **SI LOS TESTS PASAN:** Actualiza `tasks.md` cambiando la casilla de `- [ ]` a `- [x]`.

### Paso 4: Resumen y Detención Rígida (Hard Stop)
Al completar la tarea (o todas las tareas de la fase objetivo):
1. Muestra un resumen con:
   - Archivos creados o modificados.
   - Salida final del ejecutor de pruebas.
   - Requisitos Funcionales (`[RF-XX]`) cubiertos y estado de casillas actualizadas.
2. **DETENTE INMEDIATAMENTE.** Prohibido iniciar la siguiente tarea/fase sin confirmación explícita del usuario.

## Reglas de Ejecución
- **TDD Estricto:** Prohibido escribir código de producción antes de tener el test en fallido (Fase Red).
- **Aislamiento:** No modifiques componentes ajenos a la tarea en curso.
- **Detención por error:** En ejecuciones por lote, si una tarea falla en la verificación GREEN, detén la fase de inmediato sin tocar las tareas posteriores.