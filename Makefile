SHELL:=/bin/bash

VERSION=0.0.1

deb: clean
	fpm -s dir -t deb -n kickstart \
		-x usr/local/share/kickstart/.baseline \
		-x usr/local/share/kickstart/.git \
		-x usr/local/share/kickstart/kickstart/compile \
		-a all \
		-v $(VERSION) \
		-m "Bruno Tavares <@bltavares>" \
		--url "https://github.com/bltavares/kickstart" \
		--after-install <(echo "ln -s /usr/local/share/kickstart/bin/kickstart /usr/local/bin/kickstart") \
		--after-remove <(echo "$(RM) /usr/local/bin/kickstart") \
		.=/usr/local/share/kickstart

clean:
	rm *.deb 2>/dev/null || true
