---
name: sdd-clarify
description: Audits specs/NNN-feature/spec.md against constitution.md for ambiguities, gaps, and edge cases before planning. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Clarificación y Auditoría de Especificación (`sdd-clarify`)

## Propósito
Actuar como Ingeniero de QA Senior y Analista de Requisitos en modo solo lectura para auditar `spec.md` antes de la planificación, eliminando ambigüedades, contradicciones, casos límite omitidos y conflictos normativos.

## Procedimiento Paso a Paso

### Paso 1: Localización del Contexto
1. Identifica la especificación objetivo (por defecto, la más reciente en `specs/` o la especificada por el usuario).
2. Lee en modo solo lectura:
   - Especificación: `specs/NNN-<feature>/spec.md`
   - Constitución: `docs/constitution.md` (si existe).

### Paso 2: Auditoría Diagnóstica (Solo Lectura)
Analiza la especificación sin modificar ningún archivo en disco y presenta un reporte estructurado exactamente en estas 4 secciones:

1. **Ambigüedades Restantes:** Términos vagos, adjetivos no medibles, métricas faltantes o estados finales inciertos.
2. **Contradicciones Internas:** Conflictos lógicos entre Requisitos Funcionales, Historias de Usuario o criterios EARS (cita IDs explícitos, ej: `RF-02 vs RF-05`).
3. **Casos Límite (Edge Cases) No Cubiertos:** Fallos de red, límites de datos, errores de permisos, condicionales no evaluadas o estados vacíos.
4. **Conflictos con la Constitución:** Violaciones directas a los principios de `docs/constitution.md`.

### Paso 3: Evaluación de Madurez
Finaliza el análisis respondiendo a estas preguntas:
- **¿Existen hallazgos (críticos o no críticos)?** 
  - *SI:* Haz un entrevista interactiva al usuario.
  - *NO:* Declara el documento como maduro para producción.

### Paso 4: Transición de Estado y Escritura
- Si hay dudas resueltas o correcciones pendientes, muestra la propuesta de actualización para `spec.md`.
- Si la especificación está madura y sin ambigüedades, solicita confirmación explícita para actualizar el encabezado de `Estado: Borrador` a `Estado: Aprobado`.
- **Escritura:** Únicamente tras recibir la aprobación explícita del usuario, sobrescribe `spec.md` con las correcciones finales y el nuevo estado.

## Reglas de Ejecución
- **Solo Lectura Inicial:** PROHIBIDO escribir o modificar archivos en disco durante las fases 1, 2 y 3.
- **Sin Soluciones Técnicas:** Centra el análisis exclusivamente en lógica de negocio, reglas y requisitos. Guarda las decisiones de arquitectura para `/sdd-plan`.
- **Interacción con el usuario:** Siempre que se requiera que el usuario responda 2 preguntas o más DEBE hacerse como una **Entrevista Interactiva**.