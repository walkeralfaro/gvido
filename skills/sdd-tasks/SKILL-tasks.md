---
name: sdd-tasks
description: Generates an actionable, step-by-step task backlog (tasks.md) from spec.md and plan.md. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Desglose Táctico de Tareas (`sdd-tasks`)

## Propósito
Actuar como Lead Engineer y Gestor Técnico para descomponer el diseño técnico (`plan.md`) y los requisitos (`spec.md`) en una secuencia ordenada de tareas atómicas, trazables y verificables.

## Procedimiento Paso a Paso

### Paso 1: Inspección de Contexto
1. Localiza el plan de arquitectura (`specs/NNN-<feature>/plan.md`) y la especificación aprobada (`specs/NNN-<feature>/spec.md`).
2. Verifica que ambos documentos existan antes de proceder.

### Paso 2: Desglose Táctico por Fases
Carga la plantilla `./assets/tasks-template.md` y desglosa la implementación en 4 fases secuenciales:
1. **Fase 1: Configuración e Infraestructura Base** (Módulos vacíos, dependencias, types base).
2. **Fase 2: Modelo de Datos y Lógica Core** (Entidades, algoritmos, reglas de negocio).
3. **Fase 3: Interfaz y Comandos** (Endpoints API, comandos CLI, integración UI/transporte).
4. **Fase 4: Pruebas de Integración y Pulido** (Pruebas E2E, manejo de errores de borde, documentación).

### Paso 3: Guardrails de Calidad por Tarea
Asegúrate de que cada tarea cumpla estrictamente con:
- **Granularidad:** Estimada entre 15 y 30 minutos de trabajo continuo.
- **Trazabilidad:** Etiquetada explícitamente con `[Cubre RF-XX / Plan Sec. X]`.
- **Criterio de Aceptación Binario:** Debe contener un **"Hecho cuando:"** que especifique una verificación objetiva (ej. "el test X pasa sin errores", "el comando retorna código de salida 0").

### Paso 4: Aprobación Explícita y Escritura
1. Muestra el backlog resultante en el chat y **detén la ejecución**.
2. Solicita aprobación explícita al usuario con el mensaje:
   > *"¿Apruebas la secuencia de tareas planteada para generar `tasks.md`?"*
3. **Escritura:** Tras recibir la confirmación, guarda el archivo en `specs/NNN-<feature>/tasks.md`.

## Reglas de Ejecución
- **PROHIBIDO escribir código fuente:** No generes implementación ni lógica funcional en esta etapa.
- **Sin omitir requisitos:** Revisa que el 100% de los RF de `spec.md` estén cubiertos por al menos una tarea.