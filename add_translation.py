
import json
import subprocess
import sys
from pathlib import Path

ARB_DIR = Path("lib/l10n")

FILES = {
    "en": ARB_DIR / "app_en.arb",
    "ar": ARB_DIR / "app_ar.arb",
}


def add_translation(key, english, arabic):
    if key.startswith("@"):
        print("Error: Translation keys cannot start with @.")
        return

    translations = {
        "en": english,
        "ar": arabic,
    }

    # Read and validate both files before modifying anything.
    data = {}

    for language, file_path in FILES.items():
        if not file_path.exists():
            print(f"Error: File not found: {file_path}")
            return

        try:
            with file_path.open("r", encoding="utf-8") as file:
                data[language] = json.load(file)
        except json.JSONDecodeError as error:
            print(f"Error: Invalid JSON in {file_path}: {error}")
            return

    # Check whether the key already exists in either file.
    existing = [
        language
        for language, translations_data in data.items()
        if key in translations_data
    ]

    if existing:
        print(f"Warning: Key '{key}' already exists in: {', '.join(existing)}")
        print("No changes were made.")
        return

    # Add the new translations.
    for language, file_path in FILES.items():
        data[language][key] = translations[language]

        with file_path.open("w", encoding="utf-8") as file:
            json.dump(data[language], file, ensure_ascii=False, indent=2)
            file.write("\n")

    print(f"Translation '{key}' added successfully.")

    subprocess.run(["flutter", "gen-l10n"], check=True)

    print("Localization code generated successfully!")


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print(
            'Usage: python3 add_translation.py '
            '<key> "<English>" "<Arabic>"'
        )
        sys.exit(1)

    add_translation(sys.argv[1], sys.argv[2], sys.argv[3])
