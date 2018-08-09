# flake8: noqa
from .base import *

SECRET_KEY = "vx6d!*4ao55!es-2l0x!z9&viyr^jm5n&tc5@c@$cx=2u9ts5*"
DEBUG = True

INSTALLED_APPS = (
    ["django_ptvsd"] + INSTALLED_APPS + ["debug_toolbar", "django_extensions"]
)

MIDDLEWARE = MIDDLEWARE + ["debug_toolbar.middleware.DebugToolbarMiddleware"]

# Uploaded files storage
MEDIA_ROOT = "/uploads/"
MEDIA_URL_PATH = "uploads/"
MEDIA_URL = "http://localhost:8000/" + MEDIA_URL_PATH

# Caching
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.filebased.FileBasedCache",
        "LOCATION": "/var/tmp/django_cache",
    }
}

DEBUG_TOOLBAR_CONFIG = {"SHOW_TOOLBAR_CALLBACK": lambda request: bool(DEBUG)}

REMOTE_DEBUG_PORT = 9000
REMOTE_DEBUG_PASS = "testwillrocks"
