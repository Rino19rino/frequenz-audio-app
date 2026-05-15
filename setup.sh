#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# Rife Frequenz-Player – Einrichtungsskript
# Führe dieses Skript aus, nachdem Node.js installiert wurde.
# ─────────────────────────────────────────────────────────────────────────────

set -e

echo ""
echo "=== Rife Frequenz-Player Setup ==="
echo ""

# 1. Node.js prüfen
if ! command -v node &> /dev/null; then
  echo "FEHLER: Node.js ist nicht installiert."
  echo "Installiere Node.js von: https://nodejs.org (LTS-Version empfohlen)"
  exit 1
fi
echo "✓ Node.js $(node --version) gefunden"

# 2. Dependencies installieren
echo ""
echo "→ Installiere npm-Pakete..."
npm install

# 3. Plattform wählen
echo ""
echo "Welche Plattform möchtest du hinzufügen?"
echo "  [1] Android"
echo "  [2] iOS (nur auf macOS mit Xcode)"
echo "  [3] Beide"
echo "  [4] Überspringen"
read -p "Auswahl (1-4): " choice

case $choice in
  1)
    npx cap add android
    echo "✓ Android-Plattform hinzugefügt"
    ;;
  2)
    npx cap add ios
    echo "✓ iOS-Plattform hinzugefügt"
    ;;
  3)
    npx cap add android
    npx cap add ios
    echo "✓ Android & iOS hinzugefügt"
    ;;
  *)
    echo "→ Plattform übersprungen. Später hinzufügen mit: npx cap add android / npx cap add ios"
    ;;
esac

# 4. Sync
echo ""
echo "→ Capacitor sync..."
npx cap sync

echo ""
echo "=== Setup abgeschlossen! ==="
echo ""
echo "Nächste Schritte:"
echo "  Android öffnen:  npm run open:android  (benötigt Android Studio)"
echo "  iOS öffnen:      npm run open:ios      (benötigt Xcode auf macOS)"
echo ""
echo "GitHub-Deployment:"
echo "  1. git init && git remote add origin https://github.com/Rino19rino/frequenz-audio-app.git"
echo "  2. git add . && git commit -m 'Initial commit'"
echo "  3. git push -u origin main"
echo "  4. In GitHub → Settings → Pages → Source: GitHub Actions"
echo ""
