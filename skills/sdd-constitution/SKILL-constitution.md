---
name: sdd-constitution
description: Express creation of docs/constitution.md with 6 non-negotiable architectural principles. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Definición de la Constitución del Proyecto (`docs/constitution.md`)

## Propósito
Actuar como Arquitecto de Software para redactar y guardar la propuesta del archivo `docs/constitution.md` con exactamente 6 principios innegociables, verificables y adaptados al proyecto.

## Procedimiento Paso a Paso

### Paso 1: Inspección de Contexto
1. Revisa si existe el archivo `AGENTS.md` en la raíz para extraer el nombre del proyecto, el stack y los idiomas configurados.
2. Si `AGENTS.md` no existe, realiza una pregunta rápida al usuario para obtener:
   - Nombre del proyecto.
   - Idioma del código y de la interfaz.

### Paso 2: Redacción de la Propuesta
Asume el rol de Arquitecto de Software y genera un borrador basándote en `./assets/constitution-template.md`. Debes cubrir exactamente estos 6 pilares:
1. **Simplicidad del stack:** Límites para no sobre-diseñar ni sumar librerías innecesarias.
2. **Trazabilidad estricta:** Vinculación directa entre `spec.md` y código.
3. **Separación de capas:** Lógica de negocio aislada de la interfaz.
4. **Política de pruebas unitarias:** Cobertura técnica mínima exigida.
5. **Estrategia de persistencia de datos:** Manejo decoplado del almacenamiento.
6. **Idioma:** Regla clara diferenciando código/comentarios vs interfaz/mensajes.

### Paso 3: Validación de Restricciones (Guardrails)
Antes de mostrar la propuesta al usuario, verifica:
- [ ] ¿Cubre los 6 pilares exigidos?
- [ ] ¿El borrador completo tiene **un máximo de 20 líneas** en formato Markdown?

*Si la propuesta excede las 20 líneas o falta algún pilar, redáctala nuevamente y resúmela antes de responder.*

### Paso 4: Aprobación Explícita
Muestra el borrador generado en el chat y **detén la ejecución**. Solicita confirmación explícita del usuario con el siguiente mensaje:
> *"Esta es la propuesta de constitución (máximo 20 líneas). ¿Apruebas la creación de `docs/constitution.md` con estos principios?"*

### Paso 5: Escritura en Disco
Únicamente tras recibir la aprobación explícita del usuario, crea la carpeta `docs/` (si no existe) y escribe el contenido en `docs/constitution.md`.

## Reglas de Ejecución
- NO crees ni modifiques `docs/constitution.md` en el disco sin la confirmación explícita en el chat.
- Mantén cada principio en una sola frase concisa y verificable.