#!/data/data/com.termux/files/usr/bin/bash
# dpt-shell का jar जहाँ रखा है, वो पाथ यहाँ डालें
DPT_JAR="$HOME/dpt/dpt.jar"
OUT="/storage/emulated/0/ABHI BHAI"

while true; do
  echo "1) Protect   2) Signature Protect   0) Exit"
  read -r -p "Select: " c
  case "$c" in
    0) exit 0 ;;
    1|2)
      read -r -p "APK/AAB path: " f
      [ -f "$f" ] || { echo "File not found"; continue; }
      mkdir -p "$OUT"
      flags=()
      [ "$c" = "2" ] && flags=(-vs)
      java -jar "$DPT_JAR" -f "$f" -o "$OUT" "${flags[@]}" \
        && echo "Done: $OUT" || echo "Failed"
      ;;
    *) echo "Invalid" ;;
  esac
done
