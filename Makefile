SHELL:=/bin/bash

VERSION=0.0.1

PREFIX?=/usr/local
INSTALL_BIN=$(PREFIX)/bin
KICKSTART_LOCATION=$(PREFIX)/share/kickstart

docs/index.md: $(shell find docs/kickstart)
	echo "# Kickstart" > docs/index.md
	echo "" >> docs/index.md
	echo "### Functions" >> docs/index.md
	find docs/kickstart -type f | cut -d/ -f2- | cut -d. -f1 | xargs -n1 -I l bash -c 'echo "* [$$(echo l | tr / .)](l)"' >> docs/index.md

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

install:
	mkdir -p $(KICKSTART_LOCATION)
	rsync -r * $(KICKSTART_LOCATION)
	$(RM) $(INSTALL_BIN)/kickstart || true
	mkdir -p $(INSTALL_BIN)
	ln -s $(KICKSTART_LOCATION)/bin/kickstart $(INSTALL_BIN)/kickstart
