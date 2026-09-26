# Constitución del Proyecto: {PROJECT_NAME}

1. **Simplicidad del Stack:** Prohibido agregar frameworks o dependencias sin justificación técnica crítica.
2. **Trazabilidad Estricta:** Todo módulo, función pública o cambio debe mapearse explícitamente a un requisito de `spec.md`.
3. **Separación de Capas:** La lógica de negocio debe ser agnóstica de la interfaz gráfica, CLI o capa de transporte.
4. **Política de Tests:** Todo requisito funcional requiere pruebas unitarias automatizadas con cobertura del happy path y casos de borde.
5. **Persistencia Decoplada:** El acceso a datos debe gestionarse mediante interfaces/repositorios aislados de la lógica central.
6. **Idioma & Convenciones:** Código, variables y comentarios en {CODE_LANG}; interfaz de usuario y mensajes en {UI_LANG}.