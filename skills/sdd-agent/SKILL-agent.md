---
name: sdd-agent
description: Express initial setup and configuration of AGENTS.md via interactive interview.
---

# SDD Skill: Inicialización de `AGENTS.md`

## Propósito
Realizar una entrevista guiada e interactiva para generar o actualizar el archivo raíz `AGENTS.md`, definiendo las reglas operativas, comandos y límites para los agentes de IA en este repositorio.

## Procedimiento

### Paso 1: Inspección Silenciosa del Entorno
Antes de interactuar con el usuario, revisa la raíz del repositorio para inferir configuraciones existentes (ej. presencia de `package.json`, `Cargo.toml`, `go.mod`, `pyproject.toml`, `Makefile`, etc.).
- Extrae comandos por defecto para ejecución, pruebas y formateo si están disponibles.

### Paso 2: Entrevista Interactiva
Presenta las siguientes preguntas al usuario (utiliza las inferencias del Paso 1 como valores por defecto sugeridos):

1. **Propósito del Proyecto:** ¿Qué hace este proyecto? 
2. **Stack Tecnológico:** ¿Cuál es el stack principal? <ofrecer alternativas tecnologicas>
3. **Comandos:**
   - Comando para **ejecutar**:
   - Comando para **tests**:
   - Comando para **linter/formato**:
   - <otros comandos propuestos>
4. **Convenciones:**
   - Versión del lenguaje/runtime:
   - Convención de nombres (ej. `camelCase`, `snake_case`):
   - Idioma del código/comentarios:
   - Idioma de commits/logs:
   - <otras convenciones propuestas>
5. **Restricciones:** ¿Existe algún directorio o archivo que la IA tenga prohibido modificar?

### Paso 3: Generación del Borrador
1. Carga la plantilla desde `./assets/agents-template.md`.
2. Reemplaza todos los marcadores `{...}` con la información consolidada de la entrevista.
3. Muestra una vista previa en Markdown del contenido generado y solicita confirmación previa al usuario.

### Paso 4: Creación del Archivo
Tras recibir la confirmación del usuario, crea o sobrescribe el archivo `AGENTS.md` en la raíz del proyecto (`./AGENTS.md`).

## Reglas de Ejecución
- Mantén las reglas breves e imperativas para optimizar la ventana de contexto de los modelos.
- No omitas la sección "Reglas Obligatorias", ya que garantiza la integridad del flujo SDD en los pasos posteriores.