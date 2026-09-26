---
name: sdd-verify
description: Final compliance audit and traceability matrix comparing spec.md against unit/integration tests. Only invoked explicitly.
license: MIT
slash: true
metadata:
  opencode/autoinvoke: false
---

# SDD Skill: Verificación y Auditoría Final (`sdd-verify`)

## Propósito
Actuar como Lead QA Auditor & Compliance Engineer para auditar el repositorio tras la ejecución, validando el 100% de trazabilidad entre `spec.md`, el código escrito y los resultados de las pruebas automatizadas.

## Procedimiento Paso a Paso

### Paso 1: Ejecución Global de Pruebas
1. Lee `AGENTS.md` para extraer el comando de tests del proyecto (`{CMD_TEST}`).
2. Ejecuta la suite completa de pruebas desde la raíz y registra la salida técnica.

### Paso 2: Análisis de Trazabilidad y Cobertura
1. Lee `specs/NNN-<feature>/spec.md` e inspecciona:
   - Requisitos Funcionales (`RF-01`, `RF-02`...).
   - Sección "Casos Límite y Manejo de Errores".
   - Sección "Criterios de Finalización".
2. Mapea cada Requisito Funcional y Caso Límite contra el archivo y función de test específico en la suite que lo valida.

### Paso 3: Generación del Reporte
1. Carga la plantilla `./assets/verify-template.md`.
2. Completa la Matriz de Trazabilidad indicando el resultado de cada prueba (`PASS`, `FAIL`, `NO CUBIERTO`).
3. Evalúa la lista de Criterios de Finalización de la especificación.

### Paso 4: Emisión del Veredicto Final
Emite una declaración binaria no ambigua al final del reporte:
- **SI todos los tests pasan, no hay RF omitidos y la checklist está completa:**
  > `🟢 VEREDICTO: ESPECIFICACIÓN CUMPLIDA (Aprobado para Producción/Merge)`
- **SI existe al menos un test en FAIL, RF no cubierto o criterio pendiente:**
  > `🔴 VEREDICTO: ESPECIFICACIÓN INCOMPLETA (Requiere correcciones)`

### Paso 5: Escritura en Disco
Guarda el reporte consolidado en `specs/NNN-<feature>/verify.md` y muestra el resumen con el veredicto final en el chat.

## Reglas de Ejecución
- **Veracidad Estricta:** No asumas que un requisito está cubierto si no existe una función de prueba explícita probándolo.
- **Solo Lectura de Código:** Esta skill no modifica código de producción ni tests; solo genera el reporte de auditoría.