#!/usr/bin/env bash

# ==============================================================================
# GVIDO SDD Framework Installer for OpenCode
# Esperanto: "Gvido" -> Guide
# ==============================================================================

set -e

# Configuration Defaults
REPO_OWNER="walkeralfaro"  # Cambiar por tu usuario/organización de GitHub
REPO_NAME="gvido"
BRANCH="main"
TAG=""
FORCE=false
TARGET_DIR="./.opencode"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_info() {
  echo -e "${CYAN}[GVIDO]${NC} $1"
}

print_success() {
  echo -e "${GREEN}[GVIDO] ✅ $1${NC}"
}

print_warning() {
  echo -e "${YELLOW}[GVIDO] ⚠️  $1${NC}"
}

print_error() {
  echo -e "${RED}[GVIDO] ❌ $1${NC}"
  exit 1
}

# Argument Parsing
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --tag) TAG="$2"; shift ;;
    --branch) BRANCH="$2"; shift ;;
    --force) FORCE=true ;;
    --help)
      echo "GVIDO SDD Framework Installer"
      echo "Uso: install.sh [opciones]"
      echo "  --tag <version>    Instala una versión específica (ej. v0.2.0)"
      echo "  --branch <nombre>  Instala desde una rama específica (por defecto: main)"
      echo "  --force            Sobrescribe la carpeta de skills si ya existe"
      exit 0
      ;;
    *) print_error "Opción desconocida: $1" ;;
  esac
  shift
done

# Check Dependencies
command -v curl >/dev/null 2>&1 || print_error "curl es requerido para la instalación."
command -v tar >/dev/null 2>&1 || print_error "tar es requerido para la instalación."

REF="${TAG:-$BRANCH}"
TARBALL_URL="https://github.com/$REPO_OWNER/$REPO_NAME/tarball/$REF"

print_info "Instalando GVIDO SDD Framework ($REF) en $TARGET_DIR..."

# Create base target directory
mkdir -p "$TARGET_DIR/skills"

# Temporary Directory for Download
TMP_DIR=$(mktemp -d)
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Download and Extract Bundle
print_info "Descargando paquete desde GitHub..."
curl -sL "$TARBALL_URL" | tar -xz -C "$TMP_DIR" --strip-components=1 || print_error "No se pudo descargar el repositorio de GVIDO."

# Inject Skills and nested Assets
if [ -d "$TMP_DIR/skills" ]; then
  print_info "Inyectando skills y plantillas en $TARGET_DIR/skills/..."
  
  if [ "$FORCE" = true ]; then
    cp -Rf "$TMP_DIR/skills/"* "$TARGET_DIR/skills/"
  else
    cp -Rn "$TMP_DIR/skills/"* "$TARGET_DIR/skills/" 2>/dev/null || cp -R "$TMP_DIR/skills/"* "$TARGET_DIR/skills/"
  fi
else
  print_warning "No se encontró el directorio /skills en el repositorio origen."
fi

# Inject Manifest File
if [ -f "$TMP_DIR/manifest.json" ]; then
  cp "$TMP_DIR/manifest.json" "$TARGET_DIR/gvido-manifest.json"
fi

print_success "¡GVIDO SDD Framework instalado con éxito!"
print_info "OpenCode ya puede reconocer las 8 skills de GVIDO en .opencode/skills/"