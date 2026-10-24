from pathlib import Path

from .config import settings

STATIC_DIR = Path(__file__).resolve().parent.parent / "static"
STATIC_DIR.mkdir(parents=True, exist_ok=True)

PLACEHOLDER = "/static/placeholder/image-unavailable.svg"


def resolve_image(image_url: str | None) -> tuple[str, bool]:
    """Return (absolute image URL, has_real_image). Falls back to the placeholder."""
    base = settings.public_base_url.rstrip("/")

    if image_url:
        if image_url.startswith(("http://", "https://")):
            return image_url, True  # external image (S3/CDN), trusted as-is

        rel = image_url.lstrip("/")
        if rel.startswith("static/"):
            candidate = (STATIC_DIR / rel[len("static/"):]).resolve()
            # file must exist and stay inside static/ (blocks ../ tricks)
            if STATIC_DIR in candidate.parents and candidate.is_file():
                return f"{base}/{rel}", True

    return f"{base}{PLACEHOLDER}", False