# AGENTS.md

## Proyecto
{PROJECT_DESCRIPTION}

## Stack Tecnológico
{STACK}

## Comandos
<!-- Comandos principales de desarrollo y validación -->
- **Ejecutar:** `{CMD_RUN}`
- **Tests:** `{CMD_TEST}`
- **Lint/Formato:** `{CMD_LINT}`

## Estilo y Convenciones
<!-- Convenciones técnicas obligatorias -->
- **Lenguaje / Versión:** {LANG_VERSION}
- **Convención de Nombres:** {NAMING_CONVENTIONS}
- **Idioma de Código:** {CODE_LANGUAGE} (Variables, funciones, comentarios)
- **Idioma de Mensajes:** {MESSAGES_LANGUAGE} (Commits, logs, interfaz)

## Reglas Obligatorias
- **Lectura Contextual:** Lee siempre `docs/constitution.md` y la especificación activa (`spec.md`) antes de proponer o editar código.
- **Límites de Alcance:**
  - No modifiques archivos fuera del alcance definido en la tarea o especificación activa.
  - No agregues dependencias externas sin confirmación previa.
  - No alteres firmas o contratos de API públicas sin actualizar `spec.md`.

## Al Terminar Cualquier Tarea
- **Verificación Obligatoria:** Ejecuta la suite de pruebas (`{CMD_TEST}`) y valida que el linter pase sin errores (`{CMD_LINT}`).
- **Formateo:** Aplica el formateador de código del proyecto sobre todos los archivos modificados.