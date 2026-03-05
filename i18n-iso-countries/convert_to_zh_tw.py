import json
from pathlib import Path
from zhconv import convert

ROOT = Path(__file__).resolve().parent
LANGS = ROOT / "langs"


def transform(data: dict) -> dict:
    countries = {}
    for code, name in data["countries"].items():
        countries[code] = convert(name, "zh-tw")

    # 覆写特定地区命名，避免出现“中国香港/中国澳门/中国台湾”这类表述
    countries["TW"] = "臺灣"
    countries["HK"] = "香港"
    countries["MO"] = "澳門"
    countries["CN"] = "中國"

    return {"locale": data["locale"], "countries": countries}


for filename in ["zh-CN.json", "en.json"]:
    path = LANGS / filename
    data = json.loads(path.read_text(encoding="utf-8"))
    output = transform(data)
    path.write_text(
        json.dumps(output, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
    )
    print(f"updated {path}")
