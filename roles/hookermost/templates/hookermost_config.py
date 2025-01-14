USERNAME = "Github"
ICON_URL = ""

# So I don't have to type it every time
WEBHOOK = "{{ hookermost_webhook }}"

# Repository settings
MATTERMOST_WEBHOOK_URLS = {
    'DERP' : (WEBHOOK, "derp"),

    '12urenloop' : (WEBHOOK, "12urenloop-dev"),
    'ZeusWPI/Saruman': (WEBHOOK, "12urenloop-dev"),

    'dodona': (WEBHOOK, "dodona-notifications"),

    'ZeusWPI/mattermore' : (WEBHOOK, "mattermore"),
    'ZeusWPI/g2-backend' : (WEBHOOK, "g2-backend"),
    'ZeusWPI/g2-frontend' : (WEBHOOK, "g2-frontend"),
    'ZeusWPI/hydra' : (WEBHOOK, "hydra-dev"),
    'ZeusWPI/hydra-iOS' : (WEBHOOK, "hydra-dev"),
    'ZeusWPI/hydra-android' : (WEBHOOK, "hydra-dev"),
    'ZeusWPI/hydra-app' : (WEBHOOK, "hydra-dev"),
    'ZeusWPI/hydra-react-native' : (WEBHOOK, "hydra-dev"),
    'ZeusWPI/Haldis' : (WEBHOOK, "haldis"),
    'ZeusWPI/Tab' : (WEBHOOK, "tab"),
    'ZeusWPI/Tap' : (WEBHOOK, "tap"),
    'ZeusWPI/Tappb' : (WEBHOOK, "tappb"),
    'ZeusWPI/Tabbp' : (WEBHOOK, "tappb"),
    'ZeusWPI/blokmap' : (WEBHOOK, "blokmap"),
    'ZeusWPI/Blokdata' : (WEBHOOK, "blokmap"),
    'ZeusWPI/ansible-config' : (WEBHOOK, "zeusadmin"),
    'ZeusWPI/slotmachien' : (WEBHOOK, "lockbot"),
    'ZeusWPI/SlotMachIIn' : (WEBHOOK, "lockbot"),
    'ZeusWPI/doorkeeper' : (WEBHOOK, "lockbot"),
    'ZeusWPI/MOZAIC' : (WEBHOOK, "mozaic"),
    'ZeusWPI/MOZAICP' : (WEBHOOK, "mozaic"),
    'ZeusWPI/Tuxcape' : (WEBHOOK, "tuxcape"),
    'ZeusWPI/TABS' : (WEBHOOK, "tabs"),
    'ZeusWPI/durfdoen-2.0' : (WEBHOOK, "durfdoen-dev"),
    'ZeusWPI/OBUS': (WEBHOOK, "obus"),
    'ZeusWPI/zauth' : (WEBHOOK, "zauth"),
    'ZeusWPI/lockbot' : (WEBHOOK, "lockbot"),
    'ZeusWPI/Gandalf': (WEBHOOK, "gandalf-2"),
    'ZeusWPI/ZeSS': (WEBHOOK, "zess-dev"),
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
    'hook' : '/hookermost',
    'server' : '127.0.0.1',
    'port' : 5875
}
