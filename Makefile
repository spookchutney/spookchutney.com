GH_SOURCES = _layouts/ _posts/ img/ css/ js/ index.html CNAME LICENSE Gemfile _config.yml .gitignore

.PHONY: main
main:
	git checkout gh-pages
	git rm -rf .
	git checkout master $(GH_SOURCES)
	git reset HEAD
	bundle exec jekyll build
	rm -rf $(GH_SOURCES)
	echo "spookchutney.com" > CNAME
	cp -r _site/* ./
	rm -rf _site
	git add -A
	git commit -m "Generate gh-pages site for `git log master -1 --pretty=format:%h`" && \
	git push -f origin gh-pages; git checkout master

.PHONY: serve
serve:
	bundle exec jekyll serve --port=4001

.PHONY: build
build:
	bundle exec jekyll build

# to create an orphan gh-pages branch:
# cd repo
# git checkout --orphan gh-pages
# git rm -rf .
# echo "init" > index.html
# git cm init
# git push origin gh-pages
