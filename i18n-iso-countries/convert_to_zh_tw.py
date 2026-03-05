import json
from pathlib import Path
from zhconv import convert

ROOT = Path(__file__).resolve().parent
LANGS = ROOT / "langs"


def transform(data: dict) -> dict:
    countries = {}
    for code, name in data["countries"].items():
        countries[code] = convert(name, "zh-tw")


    return {"locale": data["locale"], "countries": countries}


for filename in ["zh-CN.json", "en.json"]:
    path = LANGS / filename
    data = json.loads(path.read_text(encoding="utf-8"))
    output = transform(data)
    path.write_text(
        json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    print(f"updated {path}")
