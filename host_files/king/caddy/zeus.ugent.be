zeus.ugent.be {
	@pics path_regexp pics ^/zeuswpi(/.*|$)
	@gamification path_regexp game ^/game(/.*|$)

	handle @pics {
		redir https://pics.zeus.gent{re.pics.1}
	}

	handle @gamification {
		redir https://gamification.zeus.gent{re.game.1}
	}

	reverse_proxy https://site.pratchett.zeus.gent {
		header_up Host {upstream_hostport}
	}
}
