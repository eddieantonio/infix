
index.html: README.md
	pandoc -Ss $< -o $@

install-hooks:
	@echo 'Installing hooks in .git/hooks...'
	@for hook in hooks/* ; do ln -s ../../$$hook .git/$$hook ; done


.PHONY: install-hooks
