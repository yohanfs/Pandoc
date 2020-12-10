.PHONY: watch html

SRC:= $(wildcard *.rst) $(wildcard */*.rst)
OUT:= $(SRC:%.rst=%.html)


watch:
	while true; do \
                inotifywait -qre close_write README.rst; \
                make html; \
        done

html: $(OUT)

%.html: %.rst
	rst2html5 --stylesheet=github-pandoc.css $< $@

#pandoc -s --toc -c github-pandoc.css $< -o $@
