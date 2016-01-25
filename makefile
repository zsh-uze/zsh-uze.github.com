depth?=.

sections= \
tips \
dev/perl \
workshop

include $(depth)/_/make/site.mk

pages = \
index.html \
modules.html \

all: $(pages)

modules.md: modules.m4d modules.csv
	m4 $< > $@

