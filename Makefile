#!/usr/bin/make -f

SHELL := /bin/bash


deb:
	mkdir -p dist
	docker run -ti -e RUN_UID=`id -u` -v `pwd`:/home/bob/build phlax/debian-build bash -c "\
	  cd build \
	  && debuild -b \
	  && cp -a ../*deb dist"

pysh:
	pip install -U pip setuptools termcolor
	pip install -e 'git+https://github.com/phlax/pysh#egg=pysh.test&subdirectory=pysh.test'


test-directory-tree:
	mkdir -p /tmp/dirtree
	for a in $$(seq 1 5); do\
		mkdir -p "/tmp/dirtree/sub$${a}"; \
		for b in $$(seq 1 5); do\
			mkdir -p "/tmp/dirtree/sub$${a}/sub$${b}"; \
			for c in $$(seq 1 5); do\
				mkdir -p "/tmp/dirtree/sub$${a}/sub$${b}/sub$${c}"; \
				for d in $$(seq 1 5); do\
					fallocate -l 256K "/tmp/dirtree/sub$${a}/sub$${b}/sub$${c}/file$${d}"; \
				done; \
			done; \
		done; \
		fallocate -l 256M "/tmp/dirtree/sub$${a}/sub1/sub1/fileX"; \
	done
