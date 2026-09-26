---
name: sdd-plan
description: Technical architecture planning (plan.md) from an approved spec.md. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Planificación Técnica y Arquitectura (`sdd-plan`)

## Propósito
Actuar como Tech Lead y Arquitecto de Software para diseñar la solución técnica (el **CÓMO**) basada en una especificación aprobada (`spec.md`), produciendo el archivo `plan.md` con trazabilidad 100% hacia los Requisitos Funcionales.

## Procedimiento Paso a Paso

### Paso 1: Inspección de Entradas
1. Localiza la especificación activa aprobada (ej. `specs/NNN-<feature>/spec.md`).
2. Lee `docs/constitution.md` para garantizar el respeto a las restricciones de arquitectura y stack.

### Paso 2: Diseño Técnico y Generación del Borrador
1. Carga la plantilla de `./assets/plan-template.md`.
2. Completa las 6 secciones definiendo la arquitectura, modelo de datos, pseudocódigo de lógica core, contratos de interfaz, ADRs y estrategia de pruebas.
3. **Mapeo Obligatorio:** Incluye en cada sección la etiqueta `[Cubre RF-XX, RF-YY]` asociando explícitamente el diseño con los Requisitos Funcionales de `spec.md`.

### Paso 3: Guardrails y Verificación
Antes de presentar la propuesta, valida:
- [ ] ¿Cubre el 100% de los Requisitos Funcionales y casos límite de `spec.md`?
- [ ] ¿Respeta estrictamente las restricciones de `docs/constitution.md`?
- [ ] ¿Se evita la inclusión de código fuente ejecutable final? (Solo se permite pseudocódigo, firmas e interfaces).

### Paso 4: Aprobación Explícita y Escritura
1. Presenta la propuesta de `plan.md` en el chat y **detén la ejecución**.
2. Solicita aprobación explícita al usuario con el mensaje:
   > *"¿Apruebas este diseño de arquitectura para proceder a la generación de `plan.md`?"*
3. **Escritura:** Tras recibir la autorización, escribe el archivo en `specs/NNN-<feature>/plan.md`.

## Reglas de Ejecución
- **PROHIBIDO código fuente final:** No generes archivos de código ejecutable completo (.js, .py, .go, etc.). El plan debe permanecer en nivel de arquitectura, diagramas contextuales, interfaces y pseudocódigo.
- **Sin escritura sin permiso:** No modifiques el disco hasta contar con la confirmación explícita en el Paso 4.
- **Interacción con el usuario:** SI se requiere que el usuario responda 2 preguntas o más ENTONCES debe hacerse una **Entrevista Interactiva**.