#!/bin/bash

FILE_TO_MONITOR="./compose.yml" # Zmień na ścieżkę do pliku, który chcesz monitorować
SCRIPT_TO_RUN="./restart.sh"    # Ścieżka do skryptu, który chcesz uruchomić

while true; do
  # Czekamy na zapisanie pliku
  inotifywait -e close_write "$FILE_TO_MONITOR"
  # Uruchamiamy skrypt po zapisaniu pliku
  $SCRIPT_TO_RUN
done
