GH_SOURCES = _layouts/ _posts/ img/ css/ js/ \
             index.html CNAME LICENSE README.md .gitignore Gemfile _config.yml

.PHONY: main
main:
	git checkout gh-pages
	git rm -rf .
	git checkout master $(GH_SOURCES)
	git reset HEAD
	bundle exec jekyll build
	rm -rf $(GH_SOURCES)
	echo "spookchutney" > CNAME
	cp -r _site/* ./
	rm -rf _site
	git add -A
	git commit -m "Generate gh-pages site for `git log master -1 --pretty=format:%h`" && \
	git push -f origin gh-pages; git checkout master
