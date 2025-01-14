USERNAME = "Github"
ICON_URL = ""

# So I don't have to type it every time
WEBHOOK = "{{ hookermost_webhook }}"

# Repository settings
MATTERMOST_WEBHOOK_URLS = {
    'default' : (WEBHOOK,"zeus-dev"),
}

# Ignore specified event actions
GITHUB_IGNORE_ACTIONS = {}

class Wildcard(object):
    def __contains__(self, key):
        return True

# Ignore events from specified users
IGNORE_USER_EVENTS = {
     'dependabot[bot]': Wildcard()
}

# Redirect events to different channels
REDIRECT_EVENTS = {}
SECRET = "{{ hookermost_secret }}"
SHOW_AVATARS = False
SERVER = {
    'hook' : '/matterhook',
    'server' : '127.0.0.1',
    'port' : 5876
}
