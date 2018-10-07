GH_SOURCES = _includes/ _layouts/ _posts/ about/ assets/ blog/ images/ teaching/ writing/ \
             index.html 404.md CNAME LICENSE README.md .gitignore

.PHONY: main
main:
	git checkout gh-pages
	git rm -rf .
	git checkout master $(GH_SOURCES)
	git reset HEAD
	jekyll build
	rm -rf $(GH_SOURCES)
	cp -r _site/* ./
	rm -rf _site
	git add -A
	git commit -m "Generate gh-pages site for `git log master -1 --pretty=format:%h`" && \
	git push -f origin gh-pages; git checkout master
