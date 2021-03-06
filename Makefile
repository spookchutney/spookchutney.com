GH_SOURCES = _layouts/ _posts/ img/ css/ index.html CNAME LICENSE Gemfile _config.yml .gitignore

.PHONY: main
main:
	bundle exec jekyll serve --port=4001

.PHONY: build
build:
	bundle exec jekyll build

.PHONY: github-pages
github-pages:
	git checkout gh-pages
	git rm -rf .
	git checkout master $(GH_SOURCES)
	git reset HEAD
	bundle exec jekyll build
	rm -rf $(GH_SOURCES)
	git checkout master CNAME _config.yml
	cp -r _site/* ./
	rm -rf _site
	git add -A
	git commit -m "Generate gh-pages site for `git log master -1 --pretty=format:%h`" && \
	git push origin gh-pages; git checkout master

# to create an orphan gh-pages branch:
#    cd repo
#    git checkout --orphan gh-pages
#    git rm -rf .
#    echo "init" > index.html
#    git cm init
#    git push origin gh-pages

