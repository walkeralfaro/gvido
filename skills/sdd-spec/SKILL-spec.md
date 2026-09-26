---
name: sdd-spec
description: Interactive requirement gathering to create specs/NNN-feature/spec.md using EARS notation. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Generador de Especificación (`spec.md`)

## Propósito
Transformar ideas o requisitos en un documento `spec.md` estructurado en 10 secciones, enfocado estrictamente en el **QUÉ** y **POR QUÉ** (sin detalles de implementación ni arquitectura) con Requisitos Funcionales en notación EARS.

## Procedimiento Paso a Paso

### Paso 1: Lectura de Contexto
Lee `docs/constitution.md` (si existe) y las especificaciones en `specs/` para no contradecir decisiones previas ni duplicar reglas.

### Paso 2: Entrevista Interactiva
- Realiza preguntas **de UNA en UNA** (máximo 6 en total), priorizando dudas sobre casos límite, errores y alcance.
- Si el usuario consulta sobre tecnología, arquitectura o bases de datos, redirige la atención al problema de negocio (**QUÉ**).

### Paso 3: Asignación de Ruta
Revisa el directorio `specs/` y determina el siguiente número correlativo disponible para la ruta: `specs/NNN-<nombre-kebab-case>/spec.md`.

### Paso 4: Redacción con Plantilla y EARS
1. Carga la plantilla desde `./assets/spec-template.md`.
2. Formula los Requisitos Funcionales (RF) usando los 5 patrones EARS:
   - **Normal:** "El sistema deberá..."
   - **Condicional:** "CUANDO <disparador>, el sistema deberá..."
   - **Eventual:** "SI <condición>, ENTONCES el sistema deberá..."
   - **Opcional:** "DONDE <característica>, el sistema deberá..."
   - **Límite:** "MIENTRAS <estado>, el sistema deberá..."
3. Ante vacíos de información, coloca `[NECESITA ACLARACIÓN: pregunta]` en la Sección 10. Queda prohibido asumir requisitos.

### Paso 5: Aprobación y Escritura
1. Presenta la especificación en el chat y **detén la ejecución**.
2. Al recibir aprobación explícita, crea la carpeta `specs/NNN-<nombre-kebab-case>/` y guarda `spec.md`.

## Modo Auditoría / Revisión
Si el usuario pide revisar una spec existente, no la sobreescribas. Retorna una lista numerada agrupada en: (1) Ambigüedades, (2) Contradicciones, (3) Casos límite omitidos y (4) Violaciones a `docs/constitution.md`.