modules := $(patsubst %.erl,%.beam,$(wildcard *.erl))

compile: $(modules)

shell: compile
	erl

%.beam: %.erl
	erlc $<

clean:
	rm -f $(modules)
