import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

SECRET_KEY = '{{ oauth_secret_key_local }}'

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, "static/")
FORCE_SCRIPT_NAME = '/'
LOGIN_URL = '/accounts/login/'

DEBUG = False

SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

ALLOWED_HOSTS = ['*']

KRB5_REALM = '{{ oauth_krb5_realm }}'
KRB5_SERVICE = '{{ oauth_krb5_service }}'
