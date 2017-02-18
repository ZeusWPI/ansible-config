import os

BASE_DIR = os.path.dirname(os.path.dirname(__file__))

SECRET_KEY = '{{ oauth_secret_key }}'

STATIC_URL = '/oauth/static/'
STATIC_ROOT = os.path.join(BASE_DIR, "static/")
FORCE_SCRIPT_NAME = '/oauth'
LOGIN_URL = '/oauth/accounts/login/'

DEBUG = False

SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

ALLOWED_HOSTS = ['*']

KRB5_REALM = '{{ oauth_krb5_realm }}'
KRB5_SERVICE = '{{ oauth_krb5_service }}'
